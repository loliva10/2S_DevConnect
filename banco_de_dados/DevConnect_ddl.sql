CREATE DATABASE DevConnect;
GO

USE DevConnect;
GO

--DDL
CREATE TABLE tb_usuario(
id INT IDENTITY(1, 1) PRIMARY KEY,
nome_completo NVARCHAR(255) NOT NULL,
nome_usuario NVARCHAR(50) UNIQUE NOT NULL,
email NVARCHAR(255) UNIQUE NOT NULL,
senha NVARCHAR(30) NOT NULL,
foto_perfil_url NVARCHAR(150) NULL
);

SELECT * FROM tb_usuario;

CREATE TABLE tb_seguidor(
    id INT IDENTITY(1, 1) PRIMARY KEY,
    usuarioid NVARCHAR(255) NOT NULL, -- usuario que esta sendo seguido
    seguidorid NVARCHAR(255) NOT NULL, -- usuario que esta seguindo

    CONSTRAINT fk_seguidor_usuarioid FOREIGN KEY (usuarioid) REFERENCES tb_usuario(id),
    CONSTRAINT fk_seguidor_seguidorid FOREIGN KEY (seguidorid) REFERENCES tb_usuario(id)
);
GO

SELECT * FROM tb_seguidor;

CREATE TABLE tb_publicacao(
id INT IDENTITY(1, 1) PRIMARY KEY,
usuarioid INT NOT NULL,	
descricao NVARCHAR(255) NOT NULL,
imagem_url NVARCHAR(150) NOT NULL,
data_publicacao DATE NOT NULL,

CONSTRAINT fk_usuario FOREIGN KEY (usuarioid) REFERENCES tb_usuario(id)
);

SELECT * FROM tb_publicacao;

CREATE TABLE tb_curtida(
id INT IDENTITY(1, 1) PRIMARY KEY,
usuarioid INT NOT NULL,
publicacaoid INT NOT NULL,

CONSTRAINT fk_usuario_ca FOREIGN KEY (usuarioid) REFERENCES tb_usuario(id),
CONSTRAINT fk_publicacao_ca FOREIGN KEY (publicacaoid) REFERENCES tb_publicacao(id)
);

SELECT * FROM tb_curtida;

CREATE TABLE tb_comentario(
id INT IDENTITY(1, 1) PRIMARY KEY,
usuarioid INT NOT NULL,
publicacaoid INT NOT NULL,
texto NVARCHAR(255) NOT NULL,
data_comentario DATE NOT NULL,

CONSTRAINT fk_usuario_ct FOREIGN KEY (usuarioid) REFERENCES tb_usuario(id),
CONSTRAINT fk_publicacao_ct FOREIGN KEY (publicacaoid) REFERENCES tb_publicacao(id)
);

SELECT * FROM tb_comentario;