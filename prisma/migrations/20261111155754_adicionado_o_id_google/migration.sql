/*
  Warnings:

  - A unique constraint covering the columns `[id_google]` on the table `Usuario` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `id_google` to the `Usuario` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Usuario" ADD COLUMN     "id_google" TEXT NOT NULL;

-- CreateIndex
CREATE UNIQUE INDEX "Usuario_id_google_key" ON "Usuario"("id_google");
