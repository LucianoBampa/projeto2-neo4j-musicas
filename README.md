# Sistema de Recomendação Musical com Neo4j
Este projeto foi desenvolvido como parte do curso **Neo4j** da **DIO**.
O objetivo é construir um sistema de recomendação musical utilizando grafos,
modelando usuários, músicas, artistas e gêneros, além de aplicar algoritmos
do Graph Data Science (GDS).

## Modelo do Grafo
O grafo é composto pelas seguintes entidades:
- **Usuario**
- **Musica**
- **Artista**
- **Genero**

As interações dos usuários são representadas como relacionamentos com propriedades,
permitindo capturar padrões de escuta e preferências musicais.

[![Modelo do Grafo]grafo_musicas2.png](https://github.com/LucianoBampa/projeto2-neo4j-musicas/blob/main/grafo_musicas2.png)

## Relacionamentos
- `Usuario` → `Musica` : **OUVIU**
- `Usuario` → `Musica` : **CURTIU**
- `Usuario` → `Artista` : **SEGUE**
- `Musica` → `Artista` : **INTERPRETADA_POR**
- `Musica` → `Genero` : **POSSUI_GENERO**

## Tecnologias Utilizadas
- Neo4j Aura
- Cypher Query Language
- Neo4j Graph Data Science (GDS)
- Arrow.app
- GitHub

## Algoritmos de Grafos Aplicados
- PageRank
- Similaridade de Nós
- Detecção de Comunidades
- Caminhos mínimos

## Como executar
1. Criar um banco no **Neo4j Aura**
2. Executar os scripts disponíveis na pasta `cypher`
3. Visualizar os resultados no Neo4j Browser

## Conclusão
O uso de grafos permite identificar padrões de escuta e gerar recomendações
musicais personalizadas de forma eficiente, explorando conexões complexas
entre usuários, músicas e artistas.
