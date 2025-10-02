--DML
USE DevConnect;
GO

INSERT INTO Usuario(nome_completo,nome_usuario, email, senha, foto_perfil_url)
VALUES 
('Luis de Oliva', 'l.foliva', 'lfernandooliva@icloud.com', 'LuisOlivaB', 'Foto1.png'), 
('Beatriz Yusmy', 'beaayusmy', 'beatrizyd@gmail.com', '11952561L', 'Foto2.png');

SELECT * FROM Usuario;

INSERT INTO Seguidor(UsuarioSeguirid,UsuarioSeguidorid)
VALUES (1, 2);

SELECT * FROM Seguidor;

INSERT INTO Publicacao(Usuarioid, descricao, imagem_url, data_publicacao)
VALUES (1, 'Feliz Aniversário meu Amor', 'url.6969', '2025-06-11');

SELECT * FROM Publicacao;

INSERT INTO Curtida(Usuarioid, Publicacaoid)
VALUES (1, 2);

SELECT * FROM Curtida;

INSERT INTO Comentario(Usuarioid, Publicacaoid, texto, data_comentario)
VALUES (1, 2, 'RJ Vibes', '2025-06-11');

SELECT * FROM Comentario;