using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;
using Npgsql;
using Npgsql.NameTranslation;
using Oqtane.Models;
using System;
using System.Linq;
using System.Text.RegularExpressions;

namespace Oqtane.Repository
{
    public class DBContextBase : IdentityUserContext<IdentityUser>
    {
        static readonly Regex _keysRegex = new Regex("^(PK|FK|IX)_", RegexOptions.Compiled);

        private Tenant _tenant;
        private IHttpContextAccessor _accessor;

        public DBContextBase(ITenantResolver tenantResolver, IHttpContextAccessor accessor)
        {
            _tenant = tenantResolver.GetTenant();
            _accessor = accessor;
        }

        protected override void OnModelCreating(ModelBuilder builder)
        {
            base.OnModelCreating(builder);
        }
        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            //optionsBuilder.UseSqlServer(_tenant.DBConnectionString
            //        .Replace("|DataDirectory|", AppDomain.CurrentDomain.GetData("DataDirectory")?.ToString())
            //);

            optionsBuilder
                .UseNpgsql(_tenant.DBConnectionString)
                .UseLowerCaseNamingConvention();

            base.OnConfiguring(optionsBuilder);
        }

        public override int SaveChanges()
        {
            ChangeTracker.DetectChanges();

            string username = "";
            if (_accessor.HttpContext != null && _accessor.HttpContext.User.Identity.Name != null)
            {
                username = _accessor.HttpContext.User.Identity.Name;
            }
            DateTime date = DateTime.UtcNow;

            var created = ChangeTracker.Entries()
                .Where(x => x.State == EntityState.Added);

            foreach (var item in created)
            {
                if (item.Entity is IAuditable)
                {
                    item.CurrentValues[nameof(IAuditable.CreatedBy)] = username;
                    item.CurrentValues[nameof(IAuditable.CreatedOn)] = date;
                }
            }

            var modified = ChangeTracker.Entries()
                .Where(x => x.State == EntityState.Modified || x.State == EntityState.Added);

            foreach (var item in modified)
            {
                if (item.Entity is IAuditable)
                {
                    item.CurrentValues[nameof(IAuditable.ModifiedBy)] = username;
                    item.CurrentValues[nameof(IAuditable.ModifiedOn)] = date;
                }

                if (item.Entity is IDeletable && item.State != EntityState.Added)
                {
                    if ((bool)item.CurrentValues[nameof(IDeletable.IsDeleted)]
                        && !item.GetDatabaseValues().GetValue<bool>(nameof(IDeletable.IsDeleted)))
                    {
                        item.CurrentValues[nameof(IDeletable.DeletedBy)] = username;
                        item.CurrentValues[nameof(IDeletable.DeletedOn)] = date;
                    }
                    else if (!(bool)item.CurrentValues[nameof(IDeletable.IsDeleted)]
                        && item.GetDatabaseValues().GetValue<bool>(nameof(IDeletable.IsDeleted)))
                    {
                        item.CurrentValues[nameof(IDeletable.DeletedBy)] = null;
                        item.CurrentValues[nameof(IDeletable.DeletedOn)] = null;
                    }
                }
            }

            return base.SaveChanges();
        }
    }
}
