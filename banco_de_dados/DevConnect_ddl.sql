CREATE DATABASE DevConnect;
GO

USE DevConnect;
GO

CREATE TABLE Usuario(
    id INT IDENTITY(1, 1) PRIMARY KEY,
    nome_completo NVARCHAR(255) NOT NULL,
    nome_usuario NVARCHAR(50) UNIQUE NOT NULL,
    email NVARCHAR(255) UNIQUE NOT NULL,
    senha NVARCHAR(30) NOT NULL,
    foto_perfil_url NVARCHAR(150) NULL
);
GO

SELECT * FROM Usuario;

CREATE TABLE Seguidor (
    id INT IDENTITY(1,1) PRIMARY KEY,
    usuarioid INT NOT NULL,     -- usuário que está sendo seguido
    seguidorid INT NOT NULL,    -- usuário que está seguindo

    CONSTRAINT fk_Seguidor_usuarioid FOREIGN KEY (usuarioid) REFERENCES Usuario(id),
    CONSTRAINT fk_Seguidor_seguidorid FOREIGN KEY (seguidorid) REFERENCES Usuario(id)
);
GO

SELECT * FROM Seguidor;

CREATE TABLE Publicacao(
    id INT IDENTITY(1, 1) PRIMARY KEY,
    usuarioid INT NOT NULL,	
    descricao NVARCHAR(255) NOT NULL,
    imagem_url NVARCHAR(150) NOT NULL,
    data_publicacao DATE NOT NULL,

    CONSTRAINT fk_Publicacao_usuario FOREIGN KEY (usuarioid) REFERENCES Usuario(id)
);
GO

SELECT * FROM Publicacao;

CREATE TABLE Curtida(
    id INT IDENTITY(1, 1) PRIMARY KEY,
    usuarioid INT NOT NULL,
    publicacaoid INT NOT NULL,

    CONSTRAINT fk_Curtida_usuario FOREIGN KEY (usuarioid) REFERENCES Usuario(id),
    CONSTRAINT fk_Curtida_publicacao FOREIGN KEY (publicacaoid) REFERENCES Publicacao(id)
);
GO

SELECT * FROM Curtida;

ALTER TABLE Curtida
ADD CONSTRAINT UQ_Curtida_UsuarioPublicacao UNIQUE (usuarioid, publicacaoid);
GO

CREATE TABLE Comentario(
    id INT IDENTITY(1, 1) PRIMARY KEY,
    usuarioid INT NOT NULL,
    publicacaoid INT NOT NULL,
    texto NVARCHAR(255) NOT NULL,
    data_comentario DATE NOT NULL,

    CONSTRAINT fk_Comentario_usuario FOREIGN KEY (usuarioid) REFERENCES Usuario(id),
    CONSTRAINT fk_Comentario_publicacao FOREIGN KEY (publicacaoid) REFERENCES Publicacao(id)
);
GO

SELECT * FROM Comentario;