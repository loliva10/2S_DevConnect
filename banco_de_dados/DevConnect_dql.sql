--DQL
USE DevConnect;
GO

--Exiba todos os nomes dos seguidores (de quem est� seguindo e de quem ser� seguido)
SELECT 
    uSeguidor.nome_usuario AS Seguidor,
    uSeguido.nome_usuario AS Seguido
FROM Seguidor s
JOIN Usuario uSeguidor ON s.seguidorid = uSeguidor.id
JOIN Usuario uSeguido ON s.usuarioid = uSeguido.id;

--Exiba quantos seguidores possui um respectivo usu�rio (seguidores que realmente existem no sistema)
SELECT 
    u.nome_usuario AS Usuario,
    COUNT(s.seguidorid) AS QuantidadeSeguidores
FROM Seguidor s
INNER JOIN Usuario u ON s.usuarioid = u.id
GROUP BY u.nome_usuario;

--Exiba todas as publica��es contendo descri��o, caminho da imagem e nome de usu�rio
SELECT 
    p.descricao,
    p.imagem_url,
    u.nome_usuario
FROM Publicacao p
JOIN Usuario u ON p.usuarioid = u.id;


--Exiba todos os coment�rios com o nome do usu�rio e o texto da respectiva publica��o
SELECT 
    u.nome_usuario,
    c.texto AS Comentario,
    p.descricao AS Publicacao
FROM Comentario c
JOIN Usuario u ON c.usuarioid = u.id
JOIN Publicacao p ON c.publicacaoid = p.id;

--Exiba a quantidade de curtidas de uma respectiva publica��o
SELECT 
  p.descricao,
    COUNT(c.id) AS QuantidadeCurtidas
FROM Curtida c
JOIN Publicacao p ON c.publicacaoid = p.id
GROUP BY p.descricao;

--Exiba todos os usu�rios que n�o chegaram a fazer publica��es
SELECT 
    u.nome_usuario
FROM Usuario u
LEFT JOIN Publicacao p ON u.id = p.usuarioid
WHERE p.id IS NULL;


--Exiba todos os usu�rios que n�o chegaram a fazer rea��es (curtidas)
SELECT 
    u.nome_usuario
FROM Usuario u
LEFT JOIN Curtida c ON u.id = c.usuarioid
WHERE c.id IS NULL;

--Exiba se o usu�rio remover uma curtida de um usu�rio h� uma publica��o
SELECT 
    p.descricao,
    COUNT(c.id) AS QuantidadeCurtidas
FROM Curtida c
JOIN Publicacao p ON c.publicacaoid = p.id
GROUP BY p.descricao;
GO