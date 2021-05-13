using Microsoft.EntityFrameworkCore;
using Shop_Online.Models;

namespace Shop_Online.Data
{
    public class ShopOnlineContext : DbContext
    {
        public ShopOnlineContext(DbContextOptions<ShopOnlineContext> options)
            : base(options)
        {
        }

        public DbSet<Product> Product { get; set; }
        public DbSet<Catolog> Catolog { get; set; }
        public DbSet<Combo> Combo { get; set; }
        public DbSet<Customer> Customer { get; set; }
        public DbSet<Employee> Employee { get; set; }
        public DbSet<Invoice> Invoice { get; set; }
        public DbSet<InvoiceDetail> InvoiceDetail { get; set; }
        public DbSet<ProductDetail> ProductDetail { get; set; }
        public DbSet<Role> Role { get; set; }
        public DbSet<Storage> Storage { get; set; }
        public DbSet<ProductImage> ProductImage { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Catolog>().ToTable("Catolog");
            modelBuilder.Entity<Combo>().ToTable("Combo");
            modelBuilder.Entity<Customer>().ToTable("Customer");
            modelBuilder.Entity<Employee>().ToTable("Employee");
            modelBuilder.Entity<Invoice>().ToTable("Invoice");
            modelBuilder.Entity<Product>().ToTable("Product");
            modelBuilder.Entity<ProductDetail>().ToTable("ProductDetail");
            modelBuilder.Entity<Role>().ToTable("Role");
            modelBuilder.Entity<Storage>().ToTable("Storage");
            modelBuilder.Entity<ProductImage>().ToTable("ProductImage");

            modelBuilder.Entity<InvoiceDetail>()
                .HasKey(i => new { i.Invoice_ID, i.Product_ID });
            modelBuilder.Entity<ProductImage>()
                .HasKey(i => new { i.Product_ID, i.Image });

        }
    }
}