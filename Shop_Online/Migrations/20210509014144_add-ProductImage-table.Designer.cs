// <auto-generated />
using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Metadata;
using Microsoft.EntityFrameworkCore.Migrations;
using Microsoft.EntityFrameworkCore.Storage.ValueConversion;
using Shop_Online.Data;

namespace Shop_Online.Migrations
{
    [DbContext(typeof(ShopOnlineContext))]
    [Migration("20210509014144_add-ProductImage-table")]
    partial class addProductImagetable
    {
        protected override void BuildTargetModel(ModelBuilder modelBuilder)
        {
#pragma warning disable 612, 618
            modelBuilder
                .HasAnnotation("Relational:MaxIdentifierLength", 128)
                .HasAnnotation("ProductVersion", "5.0.4")
                .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

            modelBuilder.Entity("Shop_Online.Models.Catolog", b =>
                {
                    b.Property<int>("ID")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<string>("Catolog_Name")
                        .HasColumnType("nvarchar(max)");

                    b.HasKey("ID");

                    b.ToTable("Catolog");
                });

            modelBuilder.Entity("Shop_Online.Models.Combo", b =>
                {
                    b.Property<int>("ID")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<string>("Combo_Name")
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("Discount")
                        .HasColumnType("nvarchar(max)");

                    b.Property<decimal>("DiscountMoney")
                        .HasColumnType("decimal(18,2)");

                    b.Property<DateTime>("EndDay")
                        .HasColumnType("datetime2");

                    b.Property<string>("ProductList")
                        .HasColumnType("nvarchar(max)");

                    b.Property<DateTime>("StartDay")
                        .HasColumnType("datetime2");

                    b.Property<decimal>("TotalMoney")
                        .HasColumnType("decimal(18,2)");

                    b.HasKey("ID");

                    b.ToTable("Combo");
                });

            modelBuilder.Entity("Shop_Online.Models.Customer", b =>
                {
                    b.Property<int>("ID")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<string>("Address")
                        .HasColumnType("nvarchar(max)");

                    b.Property<DateTime>("BirthDay")
                        .HasColumnType("datetime2");

                    b.Property<string>("FirstName")
                        .HasColumnType("nvarchar(max)");

                    b.Property<bool>("Gender")
                        .HasColumnType("bit");

                    b.Property<bool>("IsNew")
                        .HasColumnType("bit");

                    b.Property<DateTime>("JoinDate")
                        .HasColumnType("datetime2");

                    b.Property<string>("LastName")
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("Password")
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("Username")
                        .HasColumnType("nvarchar(max)");

                    b.HasKey("ID");

                    b.ToTable("Customer");
                });

            modelBuilder.Entity("Shop_Online.Models.Employee", b =>
                {
                    b.Property<int>("ID")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<string>("Address")
                        .HasColumnType("nvarchar(max)");

                    b.Property<DateTime>("BirthDay")
                        .HasColumnType("datetime2");

                    b.Property<string>("FirstName")
                        .HasColumnType("nvarchar(max)");

                    b.Property<bool>("Gender")
                        .HasColumnType("bit");

                    b.Property<DateTime>("JoinDate")
                        .HasColumnType("datetime2");

                    b.Property<string>("LastName")
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("Password")
                        .HasColumnType("nvarchar(max)");

                    b.Property<int?>("RoleID")
                        .HasColumnType("int");

                    b.Property<int>("Role_ID")
                        .HasColumnType("int");

                    b.Property<string>("Username")
                        .HasColumnType("nvarchar(max)");

                    b.HasKey("ID");

                    b.HasIndex("RoleID");

                    b.ToTable("Employee");
                });

            modelBuilder.Entity("Shop_Online.Models.Invoice", b =>
                {
                    b.Property<int>("ID")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<DateTime>("CreateDate")
                        .HasColumnType("datetime2");

                    b.Property<string>("CustomerAddress")
                        .HasColumnType("nvarchar(max)");

                    b.Property<int?>("CustomerID")
                        .HasColumnType("int");

                    b.Property<int>("Customer_Id")
                        .HasColumnType("int");

                    b.Property<string>("Invoice_Name")
                        .HasColumnType("nvarchar(max)");

                    b.Property<DateTime>("ShipDate")
                        .HasColumnType("datetime2");

                    b.Property<int?>("ShipperID")
                        .HasColumnType("int");

                    b.Property<int>("Shipper_Id")
                        .HasColumnType("int");

                    b.Property<decimal>("TotalMoney")
                        .HasColumnType("decimal(18,2)");

                    b.HasKey("ID");

                    b.HasIndex("CustomerID");

                    b.HasIndex("ShipperID");

                    b.ToTable("Invoice");
                });

            modelBuilder.Entity("Shop_Online.Models.InvoiceDetail", b =>
                {
                    b.Property<int>("Invoice_ID")
                        .HasColumnType("int");

                    b.Property<int>("Product_ID")
                        .HasColumnType("int");

                    b.Property<int>("Amount")
                        .HasColumnType("int");

                    b.Property<int?>("ComboID")
                        .HasColumnType("int");

                    b.Property<int>("Combo_ID")
                        .HasColumnType("int");

                    b.Property<int?>("InvoiceID")
                        .HasColumnType("int");

                    b.Property<decimal>("Price")
                        .HasColumnType("decimal(18,2)");

                    b.Property<int?>("ProductID")
                        .HasColumnType("int");

                    b.HasKey("Invoice_ID", "Product_ID");

                    b.HasIndex("ComboID");

                    b.HasIndex("InvoiceID");

                    b.HasIndex("ProductID");

                    b.ToTable("InvoiceDetail");
                });

            modelBuilder.Entity("Shop_Online.Models.Product", b =>
                {
                    b.Property<int>("ID")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<int>("Amount")
                        .HasColumnType("int");

                    b.Property<int>("Catalog_id")
                        .HasColumnType("int");

                    b.Property<int?>("CatologID")
                        .HasColumnType("int");

                    b.Property<string>("Product_Name")
                        .HasColumnType("nvarchar(max)");

                    b.Property<decimal>("price")
                        .HasColumnType("decimal(18,2)");

                    b.HasKey("ID");

                    b.HasIndex("CatologID");

                    b.ToTable("Product");
                });

            modelBuilder.Entity("Shop_Online.Models.ProductDetail", b =>
                {
                    b.Property<int>("Product_ID")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<string>("Product_Detail")
                        .HasColumnType("nvarchar(max)");

                    b.HasKey("Product_ID");

                    b.ToTable("ProductDetail");
                });

            modelBuilder.Entity("Shop_Online.Models.ProductImage", b =>
                {
                    b.Property<int>("Product_ID")
                        .HasColumnType("int");

                    b.Property<string>("Image")
                        .HasColumnType("nvarchar(450)");

                    b.Property<int?>("ProductID")
                        .HasColumnType("int");

                    b.HasKey("Product_ID", "Image");

                    b.HasIndex("ProductID");

                    b.ToTable("ProductImage");
                });

            modelBuilder.Entity("Shop_Online.Models.Role", b =>
                {
                    b.Property<int>("ID")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<string>("Role_Name")
                        .HasColumnType("nvarchar(max)");

                    b.HasKey("ID");

                    b.ToTable("Role");
                });

            modelBuilder.Entity("Shop_Online.Models.Storage", b =>
                {
                    b.Property<string>("Product_Id")
                        .HasColumnType("nvarchar(450)");

                    b.Property<decimal>("Amount")
                        .HasColumnType("decimal(18,2)");

                    b.Property<DateTime>("exportDate")
                        .HasColumnType("datetime2");

                    b.Property<DateTime>("importDate")
                        .HasColumnType("datetime2");

                    b.HasKey("Product_Id");

                    b.ToTable("Storage");
                });

            modelBuilder.Entity("Shop_Online.Models.Employee", b =>
                {
                    b.HasOne("Shop_Online.Models.Role", "Role")
                        .WithMany("Employee")
                        .HasForeignKey("RoleID");

                    b.Navigation("Role");
                });

            modelBuilder.Entity("Shop_Online.Models.Invoice", b =>
                {
                    b.HasOne("Shop_Online.Models.Customer", "Customer")
                        .WithMany("Invoices")
                        .HasForeignKey("CustomerID");

                    b.HasOne("Shop_Online.Models.Employee", "Shipper")
                        .WithMany("Invoices")
                        .HasForeignKey("ShipperID");

                    b.Navigation("Customer");

                    b.Navigation("Shipper");
                });

            modelBuilder.Entity("Shop_Online.Models.InvoiceDetail", b =>
                {
                    b.HasOne("Shop_Online.Models.Combo", "Combo")
                        .WithMany("InvoiceDetails")
                        .HasForeignKey("ComboID");

                    b.HasOne("Shop_Online.Models.Invoice", "Invoice")
                        .WithMany("InvoiceDetails")
                        .HasForeignKey("InvoiceID");

                    b.HasOne("Shop_Online.Models.Product", "Product")
                        .WithMany("InvoiceDetails")
                        .HasForeignKey("ProductID");

                    b.Navigation("Combo");

                    b.Navigation("Invoice");

                    b.Navigation("Product");
                });

            modelBuilder.Entity("Shop_Online.Models.Product", b =>
                {
                    b.HasOne("Shop_Online.Models.Catolog", "Catolog")
                        .WithMany("Products")
                        .HasForeignKey("CatologID");

                    b.Navigation("Catolog");
                });

            modelBuilder.Entity("Shop_Online.Models.ProductImage", b =>
                {
                    b.HasOne("Shop_Online.Models.Product", "Product")
                        .WithMany("ProductImages")
                        .HasForeignKey("ProductID");

                    b.Navigation("Product");
                });

            modelBuilder.Entity("Shop_Online.Models.Catolog", b =>
                {
                    b.Navigation("Products");
                });

            modelBuilder.Entity("Shop_Online.Models.Combo", b =>
                {
                    b.Navigation("InvoiceDetails");
                });

            modelBuilder.Entity("Shop_Online.Models.Customer", b =>
                {
                    b.Navigation("Invoices");
                });

            modelBuilder.Entity("Shop_Online.Models.Employee", b =>
                {
                    b.Navigation("Invoices");
                });

            modelBuilder.Entity("Shop_Online.Models.Invoice", b =>
                {
                    b.Navigation("InvoiceDetails");
                });

            modelBuilder.Entity("Shop_Online.Models.Product", b =>
                {
                    b.Navigation("InvoiceDetails");

                    b.Navigation("ProductImages");
                });

            modelBuilder.Entity("Shop_Online.Models.Role", b =>
                {
                    b.Navigation("Employee");
                });
#pragma warning restore 612, 618
        }
    }
}
