--DDL
CREATE TABLE Usuario(
    id INT IDENTITY(1, 1) PRIMARY KEY,
    nome_completo NVARCHAR(255) NOT NULL,
    nome_usuario NVARCHAR(50) UNIQUE NOT NULL,
    email NVARCHAR(255) UNIQUE NOT NULL,
    senha NVARCHAR(30) NOT NULL,
    foto_perfil_url NVARCHAR(150) NULL
);

SELECT * FROM Usuario;

CREATE TABLE Seguidor(
    UsuarioSeguirid INT NOT NULL,
    UsuarioSeguidorid INT NOT NULL,
    
    PRIMARY KEY(UsuarioSeguirid, UsuarioSeguidorid)
);

SELECT * FROM Seguidor;

CREATE TABLE Publicacao(
    id INT IDENTITY(1, 1) PRIMARY KEY,
    descricao NVARCHAR(255) NOT NULL,
    imagem_url NVARCHAR(150) NOT NULL,
    data_publicacao DATE NOT NULL,

    Usuarioid INT NOT NULL FOREIGN KEY REFERENCES Usuario(id)
);

SELECT * FROM Publicacao;

CREATE TABLE Curtida(
    id INT IDENTITY(1, 1) PRIMARY KEY,

    Usuarioid INT NOT NULL FOREIGN KEY REFERENCES Usuario(id),
    Publicacaoid INT NOT NULL FOREIGN KEY REFERENCES Publicacao(id)
);

SELECT * FROM Curtida;

CREATE TABLE Comentario(
    id INT IDENTITY(1, 1) PRIMARY KEY,
    texto NVARCHAR(1000) NOT NULL,
    data_comentario DATE NOT NULL,

    Usuarioid INT NOT NULL FOREIGN KEY REFERENCES Usuario(id),
    Publicacaoid INT NOT NULL FOREIGN KEY REFERENCES Publicacao(id)
);

SELECT * FROM Comentario;