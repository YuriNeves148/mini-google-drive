/*
  Warnings:

  - A unique constraint covering the columns `[storage_key]` on the table `Arquivo` will be added. If there are existing duplicate values, this will fail.

*/
-- AlterTable
ALTER TABLE "Arquivo" ALTER COLUMN "nome_arquivo" SET DATA TYPE VARCHAR(100);

-- CreateIndex
CREATE UNIQUE INDEX "Arquivo_storage_key_key" ON "Arquivo"("storage_key");
