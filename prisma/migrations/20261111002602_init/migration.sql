-- CreateTable
CREATE TABLE "Usuario" (
    "id_usuario" SERIAL NOT NULL,
    "nome_usuario" VARCHAR(50) NOT NULL,
    "email" VARCHAR(255) NOT NULL,
    "foto_perfil" VARCHAR(255),
    "criado_em" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "editado_em" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Usuario_pkey" PRIMARY KEY ("id_usuario")
);

-- CreateTable
CREATE TABLE "Pasta" (
    "id_pasta" SERIAL NOT NULL,
    "id_pasta_pai" INTEGER,
    "usuario_id" INTEGER NOT NULL,
    "nome_pasta" VARCHAR(100) NOT NULL,
    "criado_em" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "editado_em" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Pasta_pkey" PRIMARY KEY ("id_pasta")
);

-- CreateTable
CREATE TABLE "Arquivo" (
    "id_arquivo" SERIAL NOT NULL,
    "usuario_id" INTEGER NOT NULL,
    "pasta_id" INTEGER,
    "nome_arquivo" VARCHAR(50) NOT NULL,
    "storage_key" VARCHAR(255) NOT NULL,
    "tipo" VARCHAR(100) NOT NULL,
    "tamanho" BIGINT NOT NULL,
    "criado_em" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "editado_em" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Arquivo_pkey" PRIMARY KEY ("id_arquivo")
);

-- CreateTable
CREATE TABLE "Compartilhamento" (
    "id_comp" SERIAL NOT NULL,
    "arquivo_id" INTEGER,
    "pasta_id" INTEGER,
    "id_proprietario" INTEGER NOT NULL,
    "id_destinatario" INTEGER NOT NULL,
    "token" VARCHAR(100) NOT NULL,
    "expira_em" TIMESTAMP(3) NOT NULL,
    "criado_em" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Compartilhamento_pkey" PRIMARY KEY ("id_comp")
);

-- CreateIndex
CREATE UNIQUE INDEX "Usuario_nome_usuario_key" ON "Usuario"("nome_usuario");

-- CreateIndex
CREATE UNIQUE INDEX "Usuario_email_key" ON "Usuario"("email");

-- CreateIndex
CREATE UNIQUE INDEX "Compartilhamento_token_key" ON "Compartilhamento"("token");

-- AddForeignKey
ALTER TABLE "Pasta" ADD CONSTRAINT "Pasta_usuario_id_fkey" FOREIGN KEY ("usuario_id") REFERENCES "Usuario"("id_usuario") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Pasta" ADD CONSTRAINT "Pasta_id_pasta_pai_fkey" FOREIGN KEY ("id_pasta_pai") REFERENCES "Pasta"("id_pasta") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "Arquivo" ADD CONSTRAINT "Arquivo_usuario_id_fkey" FOREIGN KEY ("usuario_id") REFERENCES "Usuario"("id_usuario") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Arquivo" ADD CONSTRAINT "Arquivo_pasta_id_fkey" FOREIGN KEY ("pasta_id") REFERENCES "Pasta"("id_pasta") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Compartilhamento" ADD CONSTRAINT "Compartilhamento_arquivo_id_fkey" FOREIGN KEY ("arquivo_id") REFERENCES "Arquivo"("id_arquivo") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Compartilhamento" ADD CONSTRAINT "Compartilhamento_pasta_id_fkey" FOREIGN KEY ("pasta_id") REFERENCES "Pasta"("id_pasta") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Compartilhamento" ADD CONSTRAINT "Compartilhamento_id_proprietario_fkey" FOREIGN KEY ("id_proprietario") REFERENCES "Usuario"("id_usuario") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Compartilhamento" ADD CONSTRAINT "Compartilhamento_id_destinatario_fkey" FOREIGN KEY ("id_destinatario") REFERENCES "Usuario"("id_usuario") ON DELETE CASCADE ON UPDATE CASCADE;
