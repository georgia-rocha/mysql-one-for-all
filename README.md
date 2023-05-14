# Boas vindas ao repositório do Projeto MySQL One For All 🚀

<summary>👨‍💻 Objetivo</summary><br />

Nesse projeto, usei **algumas** tabelas não normalizadas e populadas em banco de dados(bd) disponibilizadas pela Trybe para revisar e consolidar **todos** os principais conceitos de **Normalização de tabelas** que vi no bloco de Back-End até o momento, seguindo o padrão de nome de arquivos e organização pedidos.

1. Clone o repositório

```
git clone git@github.com:georgia-rocha/mysql-one-for-all.git
```

2. Entre na pasta do repositório que você acabou de clonar:

```
cd msql-one-for-all
```

<details>
<summary> 🐳 Início rápido com Docker Compose</summary><br>

```bash
docker-compose up -d
docker exec -it one_for_all bash
npm install # instala as dependencias da aplicação
npm test # roda todos os testes
npm test -- -t "01" # rodando apenas o teste do requisito 01
```

<details>
<summary>🐳 Mais informações</summary><br>

O que cada comando faz:

- `docker-compose up -d`
  - Inicia os serviços `node` e `db`
    - Esses serviços irão inicializar um container chamado `one_for_all` e outro chamado `one_for_all_db`.
    - Ao iniciar pela primeira vez, o docker constrói a imagem do serviço `node`, instalando as dependências Node necessárias para a avaliação automatizada
- `docker exec -it one_for_all bash`
  - Acessa a linha de comando do container `one_for_all`
    - Isso dá acesso ao terminal interativo do container criado pelo compose, que está rodando em segundo plano
- `npm test`
  - Roda os testes do avaliador

> As credenciais de acesso ao banco de dados estão definidas no arquivo `docker-compose.yml`, e são acessíveis no container através das variáveis de ambiente `MYSQL_USER` e `MYSQL_PASSWORD`.

</details>
</details>

<details>
<summary>🖥️ Início rápido com apenas um container MySQL</summary><br>

> ⚠️ **Atenção**: É necessário criar um container MySQL e passar as credenciais através de variáveis de ambiente. Veja a [FAQ](./FAQ.md#rodando-o-projeto-localmente) para mais detalhes.
>
> ⚠️ O avaliador espera que a versão do `node` utilizada seja a 16.

```bash
npm install
docker run -p 3306:3306 --name mysql_8 -e MYSQL_ROOT_PASSWORD=password --platform=linux/amd64 -d mysql:8.0.23 mysqld --default-authentication-plugin=mysql_native_password
MYSQL_USER=root MYSQL_PASSWORD=password MYSQL_HOSTNAME=localhost npm test # roda todos os testes
MYSQL_USER=root MYSQL_PASSWORD=password MYSQL_HOSTNAME=localhost npm test -- -t "01" # rodando apenas o teste do requisito 01
```

<details>
<summary>🖥️ Mais informações</summary><br>

O que cada comando faz:

- `npm install`
  - Instala as dependências Node necessárias para os testes do avaliador
- `docker run -p 3306:3306 --name mysql_8 -e MYSQL_ROOT_PASSWORD=password --platform=linux/amd64 -d mysql:8.0.23 mysqld --default-authentication-plugin=mysql_native_password`
  - Cria um container MySQL com as variáveis de ambiente definidas
- `MYSQL_USER=root MYSQL_PASSWORD=password MYSQL_HOSTNAME=localhost npm test`
  - Roda os testes do avaliador passando as variáveis de ambiente

</details>
</details>

## Requisitos obrigatórios
<details>
  <summary>Desafio 1 - Crie e Normalize a tabela SpotifyClone</summary>

<details>
  <summary>Parte 1 - Normalize as tabelas da planilha SpotifyClone</summary>

**🎲 Planilha SpotifyClone**

Abaixo você pode visualizar e baixar a planilha com as tabelas que foram normalizadas:

[![Tabela não normalizada "Spotify Clone"](./images/non-normalized-tables.png)](./SpotifyClone-Non-NormalizedTable.xlsx)
[Faça o download dela aqui](./SpotifyClone-Non-NormalizedTable.xlsx)

</details>
<details>
<summary>Parte 2 - Após a normalização, crie as tabelas no banco de dados</summary>

- Foi criado um banco com o nome de **`SpotifyClone`**.

- As queries foram criadas e salvas nos arquivos com final `.sql`.
</details>
</details>
<details>
<summary> Desafio 2 - Foi criada uma `QUERY` que exibe três colunas:</summary>

1. A primeira coluna exibe a quantidade total de canções. Dê a essa coluna o alias "**cancoes**".

2. A segunda coluna exibe a quantidade total de artistas e deverá ter o alias "**artistas**".

3. A terceira coluna exibe a quantidade de álbuns e deverá ter o alias "**albuns**".

<details>
  <summary>➕ Informações complementares</summary><br />

| cancoes | artistas | albuns |
|---------|----------|--------|
| 10      | 6        | 8      |

</details>
  </details>

<details>
<summary> Desafio 3 - Foi criada uma `QUERY` que tem apenas três colunas:</summary>

1. A primeira coluna possue o alias "**pessoa_usuaria**" e exibe o nome da pessoa usuária.

2. A segunda coluna possue o alias "**musicas_ouvidas**" e exibe a quantidade de músicas ouvida pela pessoa com base no seu histórico de reprodução.

3. A terceira coluna possue o alias "**total_minutos**" e exibe a soma dos minutos ouvidos pela pessoa usuária com base no seu histórico de reprodução.

Os resultados são agrupados pelo nome da pessoa usuária e ordenados em ordem alfabética.

<details>
  <summary>➕ Informações complementares</summary><br />

| pessoa_usuaria        | musicas_ouvidas | total_minutos |
|-----------------------|-----------------|---------------|
| Ada Lovelace          | 2               | 7.82          |
| Barbara Liskov        | 3               | 12.27         |
| Bell Hooks            | 1               | 3.38          |
| Christopher Alexander | 1               | 3.38          |
| Jorge Amado           | 1               | 1.93          |
| Judith Butler         | 1               | 4.07          |
| Martin Fowler         | 1               | 4.45          |
| Paulo Freire          | 2               | 8.10          |
| Robert Cecil Martin   | 2               | 5.12          |
| Sandi Metz            | 2               | 6.98          |

</details>
  </details>

<details>
<summary>Desafio 4 - Foi Criada uma `QUERY` que mostra as pessoas usuárias que estavam ativas **a partir do ano de 2021**, se baseando na data mais recente no histórico de reprodução.</summary>

1. A primeira coluna possue o alias "**pessoa_usuaria**" e exibe o nome da pessoa usuária.

2. A segunda coluna tem o alias "**status_pessoa_usuaria**" e exibe se a pessoa usuária está ativa ou inativa.

O resultado está ordenado em ordem alfabética.

<details>
  <summary>➕ Informações complementares</summary><br />

| pessoa_usuaria        | status_pessoa_usuaria |
|-----------------------|-----------------------|
| Ada Lovelace          | Inativa               |
| Barbara Liskov        | Ativa                 |
| Bell Hooks            | Inativa               |
| Christopher Alexander | Inativa               |
| Jorge Amado           | Inativa               |
| Judith Butler         | Ativa                 |
| Martin Fowler         | Ativa                 |
| Paulo Freire          | Inativa               |
| Robert Cecil Martin   | Ativa                 |
| Sandi Metz            | Ativa                 |

</details>
  </details>

<details>
<summary>Desafio 5 - Foi criada uma `QUERY` que possue duas colunas:</summary>

1. A primeira coluna possue o alias "**cancao**" e exibe o nome da canção.

2. A segunda coluna possue o alias "**reproducoes**" e exibe a quantidade de pessoas que já escutaram a canção em questão.
O resultado foi ordenado em ordem decrescente, baseando-se no número de reproduções. E em caso de empate, vai ser ordenado pelo nome da canção em ordem alfabética, com limit de 2 canções.

<details>
  <summary>➕ Informações complementares</summary><br />

| cancao         | reproducoes |
|----------------|-------------|
| Feeling Good   | 3           |
| Samba em Paris | 3           |

</details>
</details>

<details>
<summary>Desafio 6 - Tendo como base o valor dos planos e o plano que cada pessoa usuária cadastrada possui no banco,foi criada uma query para saber mais informações sobre o faturamento da empresa:</summary>

1. A primeira coluna tem o alias "**faturamento_minimo**" e exibe o menor valor de plano existente para uma pessoa usuária.

2. A segunda coluna tem o alias "**faturamento_maximo**" e exibe o maior valor de plano existente para uma pessoa usuária.

3. A terceira coluna tem o alias "**faturamento_medio**" e exibe o valor médio dos planos possuídos por pessoas usuárias até o momento.

4. Por fim, a quarta coluna tem o alias "**faturamento_total**" e exibe o valor total obtido com os planos possuídos por pessoas usuárias.

Para cada um desses dados, por se tratarem de valores monetários, foi arredondado o faturamento usando apenas duas casas decimais.

<details>
  <summary>➕ Informações complementares</summary><br />

| faturamento_minimo | faturamento_maximo | faturamento_medio | faturamento_total |
|--------------------|--------------------|-------------------|-------------------|
| 0.00               | 7.99               | 5.69              | 56.92             |

</details>
</details>

<details>
<summary>Desafio 7 - Foi criada uma query para mostrar uma relação de todos os álbuns produzidos por cada pessoa artista, ordenada pela quantidade de seguidores que ela possui, de acordo com os detalhes a seguir:</summary>

1. A primeira coluna exibe o nome da pessoa artista, com o alias "**artista**".

2. A segunda coluna exibe o nome do álbum, com o alias "**album**".

3. A terceira coluna exibe a quantidade de pessoas seguidoras que aquela pessoa artista possui e possue o alias "**pessoas_seguidoras**".

Os resultados estão ordenados de forma decrescente, baseando-se no número de pessoas seguidoras. Em caso de empate no número de pessoas, os resultados são ordenados pelo nome da pessoa artista em ordem alfabética e caso existam artistas com o mesmo nome, os resultados são ordenados pelo nome do álbum alfabeticamente.

<details>
  <summary>➕ Informações complementares</summary><br />

| artista           | album                | pessoas_seguidoras |
|-------------------|----------------------|--------------------|
| Beyoncé           | Renaissance          | 3                  |
| Elis Regina       | Falso Brilhante      | 3                  |
| Elis Regina       | Vento de Maio        | 3                  |
| Nina Simone       | I Put A Spell On You | 3                  |
| Queen             | Hot Space            | 3                  |
| Queen             | Jazz                 | 3                  |
| Baco Exu do Blues | QVVJFA?              | 1                  |
| Blind Guardian    | Somewhere Far Beyond | 1                  |

</details>
  </details>
  
<details>
<summary>Desafio 8 - Para mostrar uma relação dos álbuns produzidos por uma pessoa artista específica, neste caso `"Elis Regina"`, foi criada uma `QUERY` que retorna as seguintes colunas:</summary>

1. O nome da pessoa artista, com o alias "**artista**".

2. O nome do álbum, com o alias "**album**".

Os resultados são ordenados pelo nome do álbum em ordem alfabética.

<details>
  <summary>➕ Informações complementares</summary><br />

| artista     | album           |
|-------------|-----------------|
| Elis Regina | Falso Brilhante |
| Elis Regina | Vento de Maio   |

</details>
  </details>

<details>
<summary>Desafio 9 - Foi criada uma `QUERY` que exibe a quantidade de músicas que estão presentes atualmente no histórico de reprodução de uma pessoa usuária específica. Para este caso queremos saber quantas músicas estão no histórico da usuária `"Barbara Liskov"` e a consulta deve retornar a coluna **musicas_no_historico**: </summary>

1. O valor da quantidade, com o alias "**musicas_no_historico**".

<details>
  <summary>➕ Informações complementares</summary><br />

| musicas_no_historico |
|----------------------|
| 3                    |

</details>
  </details>
  

## Requisitos Bônus 100%

Foi disponibilizada uma segunda planilha não normalizada que complementa o banco de dados do **SpotifyClone**, que é uma tabela de canções favoritas de cada pessoa usuária:

1. Normalização da planilha, criação a tabela no seu banco de dados local, populá-lo e realização das querys;



<details>
  <summary>Desafio 10 - Parte 1 - Normalize a tabela da planilha SpotifyClone-fav-songs</summary>

<summary>🎲 Planilha SpotifyClone-fav-songs</summary><br />

Abaixo você pode visualizar e baixar uma planilha com a tabela que foi normalizada:

[![Tabela não normalizada "Spotify Clone Fav Songs"](./images/non-normalized-table-fav-songs.png)](./SpotifyClone-Non-NormalizedTable-fav-songs.xlsx)
[Faça o download dela aqui](./SpotifyClone-Non-NormalizedTable-fav-songs.xlsx)


<summary> Parte 2 - Após a normalização, foi criada a tabela no banco de dados</summary>
  </details>

<details>
<summary>Desafio 11 - Foi criada uma `QUERY` que exibe o top 3 de álbuns com as músicas que mais foram favoritadas.</summary>

O resultado possue duas colunas:

1. `album`: O nome do álbum

2. `favoritadas`: Quantas vezes as músicas do álbum foram favoritadas

O resultado está ordenado em ordem decrescente, baseando-se no número de favoritadas. Em caso de empate, os resultados são ordenados pelo nome do álbum em ordem alfabética, com limitede 3 de álbuns com mais músicas favoritadas.

<details>
  <summary>➕ Informações complementares</summary><br />

| album                | favoritadas |
|----------------------|-------------|
| Renaissance          | 5           |
| Jazz                 | 3           |
| I Put A Spell On You | 2           |

</details>
  </details>

<details>
<summary>Desafio 12 - Foi criada uma `QUERY` que exibe um ranking de artistas baseado na quantidade de favoritadas em suas músicas.</summary>

O resultado possue duas colunas:

1. `artista`: O nome da pessoa artista

2. `ranking`: Uma classificação definida pela quantidade de favoritadas as canções da pessoa artista receberam, como segue:

    | ranking | quantidade de favoritadas em canções |
    |---------|--------------------------------------|
    | A       | 5 ou mais                            |
    | B       | 3 - 4                                |
    | C       | 1 - 2                                |
    | -       | 0                                    |

O resultado está ordenado em ordem decrescente, baseando-se no número de favoritadas. Em caso de empate, os resultados são ordenados pelo nome da pessoa artista em ordem alfabética.

<details>
  <summary>➕ Informações complementares</summary><br />

| artista           | ranking |
|-------------------|---------|
| Beyoncé           | A       |
| Elis Regina       | B       |
| Queen             | B       |
| Nina Simone       | C       |
| Baco Exu do Blues | -       |
| Blind Guardian    | -       |

</details>
  </details>

<details>
<summary>Desafio 13 - Foi criada uma `QUERY` que exibe uma relação da quantidade total de pessoas usuárias e favoritadas por faixa etária.</summary>

O resultado possue três colunas:

1. `faixa_etaria`: A faixa etária das pessoas usuárias, sendo elas:
   - `Até 30 anos`
   - `Entre 31 e 60 anos`
   - `Maior de 60 anos`

2. `total_pessoas_usuarias`: O total de pessoas usuárias na respectiva faixa etária

3. `total_favoritadas`: O total de favoritadas realizadas pelas pessoas usuárias da respectiva faixa etária

<details>
  <summary>➕ Informações complementares</summary><br />

| faixa_etaria       | total_pessoas_usuarias | total_favoritadas |
|--------------------|------------------------|-------------------|
| Até 30 anos        | 2                      | 0                 |
| Entre 31 e 60 anos | 6                      | 9                 |
| Maior de 60 anos   | 2                      | 4                 |

</details>
  </details>
