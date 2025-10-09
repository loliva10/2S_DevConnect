--DML
USE DevConnect;
GO

INSERT INTO Usuario(nome_completo,nome_usuario, email, senha, foto_perfil_url)
VALUES 
('Luis de Oliva', 'l.foliva', 'lfernandooliva@icloud.com', 'LuisOlivaB', 'Foto1.png'), 
('Beatriz Yusmy', 'beaayusmy', 'beatrizyd@gmail.com', '11952561L', 'Foto2.png');

INSERT INTO Usuario(nome_completo,nome_usuario, email, senha, foto_perfil_url)
VALUES 
('Alexia', 'alexia', 'alexia@icloud.com', '123', 'Foto1.png')

SELECT * FROM Usuario;

INSERT INTO Seguidor(usuarioid, seguidorid)
VALUES (1, 2);

SELECT * FROM Seguidor;

INSERT INTO Publicacao(usuarioid, descricao, imagem_url, data_publicacao)
VALUES (2, 'Feliz Aniversário meu Amor', 'url.6969', '2025-06-11');

SELECT * FROM Publicacao;

INSERT INTO Curtida(usuarioid, publicacaoid)
VALUES (1, 1);

SELECT * FROM Curtida;

DELETE FROM Curtida
WHERE usuarioid = 1 AND publicacaoid = 1;
GO

INSERT INTO Curtida (usuarioid, publicacaoid)
VALUES (1, 1);
GO

INSERT INTO Comentario(usuarioid, publicacaoid, texto, data_comentario)
VALUES (1, 1, 'RJ Vibes', '2025-06-11');

SELECT * FROM Comentario;