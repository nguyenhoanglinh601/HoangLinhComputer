using Microsoft.EntityFrameworkCore.Migrations;

namespace Shop_Online.Migrations
{
    public partial class changeDetailpropertytoProduct_Detailproperty : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.RenameColumn(
                name: "Detail",
                table: "ProductDetail",
                newName: "Product_Detail");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.RenameColumn(
                name: "Product_Detail",
                table: "ProductDetail",
                newName: "Detail");
        }
    }
}
