/*
  Warnings:

  - You are about to drop the column `roles_id` on the `employees` table. All the data in the column will be lost.
  - Added the required column `role_id` to the `employees` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "employees" DROP CONSTRAINT "employees_roles_id_fkey";

-- AlterTable
ALTER TABLE "employees" DROP COLUMN "roles_id",
ADD COLUMN     "role_id" TEXT NOT NULL;

-- AddForeignKey
ALTER TABLE "employees" ADD CONSTRAINT "employees_role_id_fkey" FOREIGN KEY ("role_id") REFERENCES "roles"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
