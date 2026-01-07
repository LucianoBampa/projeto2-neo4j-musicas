## Constraints
CREATE CONSTRAINT usuario_id IF NOT EXISTS
FOR (u:Usuario)
REQUIRE u.id IS UNIQUE;

CREATE CONSTRAINT artista_id IF NOT EXISTS
FOR (a:Artista)
REQUIRE a.id IS UNIQUE;

CREATE CONSTRAINT musica_id IF NOT EXISTS
FOR (m:Musica)
REQUIRE m.id IS UNIQUE;

CREATE CONSTRAINT genero_nome IF NOT EXISTS
FOR (g:Genero)
REQUIRE g.nome IS UNIQUE;


## Usuarios
MERGE (:Usuario {id: "u1", nome: "Luciano", pais: "Brasil"});
MERGE (:Usuario {id: "u2", nome: "Ana", pais: "Portugal"});
MERGE (:Usuario {id: "u3", nome: "Carlos", pais: "Brasil"});


## Artistas
MERGE (:Artista {id: "a1", nome: "Linkin Park"});
MERGE (:Artista {id: "a2", nome: "Coldplay"});
MERGE (:Artista {id: "a3", nome: "Metallica"});


## Musicas
MERGE (:Musica {id: "m1", titulo: "Numb", duracao: 185});
MERGE (:Musica {id: "m2", titulo: "In the End", duracao: 216});
MERGE (:Musica {id: "m3", titulo: "Yellow", duracao: 269});
MERGE (:Musica {id: "m4", titulo: "Enter Sandman", duracao: 331});


## Generos
MERGE (:Genero {nome: "Rock"});
MERGE (:Genero {nome: "Pop"});
MERGE (:Genero {nome: "Metal"});

## Relacionamentos
MATCH
(u1:Usuario {id: "u1"}),
(u2:Usuario {id: "u2"}),
(u3:Usuario {id: "u3"}),

(a1:Artista {id: "a1"}),
(a2:Artista {id: "a2"}),
(a3:Artista {id: "a3"}),

(m1:Musica {id: "m1"}),
(m2:Musica {id: "m2"}),
(m3:Musica {id: "m3"}),
(m4:Musica {id: "m4"}),

(g1:Genero {nome: "Rock"}),
(g2:Genero {nome: "Pop"}),
(g3:Genero {nome: "Metal"})

CREATE
-- Usuários ouvindo músicas
(u1)-[:OUVIU {plays: 20}]->(m1),
(u1)-[:OUVIU {plays: 15}]->(m2),
(u1)-[:CURTIU]->(m1),

(u2)-[:OUVIU {plays: 10}]->(m3),
(u2)-[:CURTIU]->(m3),

(u3)-[:OUVIU {plays: 25}]->(m4),

-- Artistas interpretam músicas
(a1)-[:INTERPRETA]->(m1),
(a1)-[:INTERPRETA]->(m2),
(a2)-[:INTERPRETA]->(m3),
(a3)-[:INTERPRETA]->(m4),

-- Músicas e gêneros
(m1)-[:PERTENCE_A]->(g1),
(m2)-[:PERTENCE_A]->(g1),
(m3)-[:PERTENCE_A]->(g2),
(m4)-[:PERTENCE_A]->(g3),

-- Usuários seguem artistas
(u1)-[:SEGUE]->(a1),
(u2)-[:SEGUE]->(a2),
(u3)-[:SEGUE]->(a3);

## Relacionamentos Usuário → Música
MATCH (u:Usuario {id: "u1"}), (m:Musica {id: "m1"})
MERGE (u)-[:OUVIU {plays: 20}]->(m);

MATCH (u:Usuario {id: "u1"}), (m:Musica {id: "m2"})
MERGE (u)-[:OUVIU {plays: 15}]->(m);

MATCH (u:Usuario {id: "u1"}), (m:Musica {id: "m1"})
MERGE (u)-[:CURTIU]->(m);

## Outros usuários
MATCH (u:Usuario {id: "u2"}), (m:Musica {id: "m3"})
MERGE (u)-[:OUVIU {plays: 10}]->(m)
MERGE (u)-[:CURTIU]->(m);

MATCH (u:Usuario {id: "u3"}), (m:Musica {id: "m4"})
MERGE (u)-[:OUVIU {plays: 25}]->(m);

## Artista → Música
MATCH (a:Artista {id: "a1"}), (m:Musica {id: "m1"})
MERGE (a)-[:INTERPRETA]->(m);

MATCH (a:Artista {id: "a1"}), (m:Musica {id: "m2"})
MERGE (a)-[:INTERPRETA]->(m);

MATCH (a:Artista {id: "a2"}), (m:Musica {id: "m3"})
MERGE (a)-[:INTERPRETA]->(m);

MATCH (a:Artista {id: "a3"}), (m:Musica {id: "m4"})
MERGE (a)-[:INTERPRETA]->(m);

## Música → Gênero
MATCH (m:Musica {id: "m1"}), (g:Genero {nome: "Rock"})
MERGE (m)-[:PERTENCE_A]->(g);

MATCH (m:Musica {id: "m2"}), (g:Genero {nome: "Rock"})
MERGE (m)-[:PERTENCE_A]->(g);

MATCH (m:Musica {id: "m3"}), (g:Genero {nome: "Pop"})
MERGE (m)-[:PERTENCE_A]->(g);

MATCH (m:Musica {id: "m4"}), (g:Genero {nome: "Metal"})
MERGE (m)-[:PERTENCE_A]->(g);

## Usuário → Artista
MATCH (u:Usuario {id: "u1"}), (a:Artista {id: "a1"})
MERGE (u)-[:SEGUE]->(a);

MATCH (u:Usuario {id: "u2"}), (a:Artista {id: "a2"})
MERGE (u)-[:SEGUE]->(a);

MATCH (u:Usuario {id: "u3"}), (a:Artista {id: "a3"})
MERGE (u)-[:SEGUE]->(a);

## Verificação final
MATCH (n) RETURN n;

## Ou
MATCH (u:Usuario)-[r]->(x)
RETURN u, r, x;

