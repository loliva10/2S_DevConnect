--DQL
USE DevConnect;
GO

--Exiba todos os nomes dos seguidores (de quem está seguindo e de quem será seguido)
SELECT 
    uSeguidor.nome_usuario AS Seguidor,
    uSeguido.nome_usuario AS Seguido
FROM Seguidor s
JOIN Usuario uSeguidor ON s.seguidorid = uSeguidor.id
JOIN Usuario uSeguido ON s.usuarioid = uSeguido.id;

--Exiba quantos seguidores possui um respectivo usuário (seguidores que realmente existem no sistema)
SELECT 
    u.nome_usuario AS Usuario,
    COUNT(s.seguidorid) AS QuantidadeSeguidores
FROM Seguidor s
INNER JOIN Usuario u ON s.usuarioid = u.id
GROUP BY u.nome_usuario;

--Exiba todas as publicações contendo descrição, caminho da imagem e nome de usuário
SELECT 
    p.descricao,
    p.imagem_url,
    u.nome_usuario
FROM Publicacao p
JOIN Usuario u ON p.usuarioid = u.id;


--Exiba todos os comentários com o nome do usuário e o texto da respectiva publicação
SELECT 
    u.nome_usuario,
    c.texto AS Comentario,
    p.descricao AS Publicacao
FROM Comentario c
JOIN Usuario u ON c.usuarioid = u.id
JOIN Publicacao p ON c.publicacaoid = p.id;

--Exiba a quantidade de curtidas de uma respectiva publicação
SELECT 
  p.descricao,
    COUNT(c.id) AS QuantidadeCurtidas
FROM Curtida c
JOIN Publicacao p ON c.publicacaoid = p.id
GROUP BY p.descricao;

--Exiba todos os usuários que não chegaram a fazer publicações
SELECT 
    u.nome_usuario
FROM Usuario u
LEFT JOIN Publicacao p ON u.id = p.usuarioid
WHERE p.id IS NULL;


--Exiba todos os usuários que não chegaram a fazer reações (curtidas)
SELECT 
    u.nome_usuario
FROM Usuario u
LEFT JOIN Curtida c ON u.id = c.usuarioid
WHERE c.id IS NULL;

--Exiba se o usuário remover uma curtida de um usuário há uma publicação
SELECT 
    p.descricao,
    COUNT(c.id) AS QuantidadeCurtidas
FROM Curtida c
JOIN Publicacao p ON c.publicacaoid = p.id
GROUP BY p.descricao;
GO