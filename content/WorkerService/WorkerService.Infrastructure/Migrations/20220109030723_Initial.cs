﻿using System;
using Microsoft.EntityFrameworkCore.Migrations;

namespace WorkerService.Infrastructure.Migrations
{
    public partial class Initial : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "other_things",
                columns: table => new
                {
                    id = table.Column<Guid>(type: "uuid", nullable: false),
                    description = table.Column<string>(type: "text", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("pk_other_things", x => x.id);
                });

            migrationBuilder.CreateTable(
                name: "somethings",
                columns: table => new
                {
                    id = table.Column<Guid>(type: "uuid", nullable: false),
                    description = table.Column<string>(type: "text", nullable: true),
                    other_thing_id = table.Column<Guid>(type: "uuid", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("pk_somethings", x => x.id);
                    table.ForeignKey(
                        name: "fk_somethings_other_things_other_thing_id",
                        column: x => x.other_thing_id,
                        principalTable: "other_things",
                        principalColumn: "id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateIndex(
                name: "ix_somethings_other_thing_id",
                table: "somethings",
                column: "other_thing_id");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "somethings");

            migrationBuilder.DropTable(
                name: "other_things");
        }
    }
}
