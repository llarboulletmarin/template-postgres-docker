# Template docker-compose pour PostgreSQL
Création d'un conteneur PostgreSQL avec Docker Compose.

## Prérequis
- Docker
- Docker Compose

## Installation
```bash
docker-compose up -d 
```
Vérifier que le conteneur est bien démarré :
```bash
docker ps
```

## Utilisation

### Connexion à la base de données
Pour se connecter à la base de données avec l'interface psql :
```bash
docker-compose exec -it postgres psql -U <user> -d <database>
```
Pour afficher le fichier de configuration :
```bash
docker exec -it postgres cat /etc/postgresql/postgresql.conf
```
Pour afficher les logs :
```bash
docker logs postgres
```

### Commandes utiles
Quelques commandes utiles pour PostgreSQL :
- `\l` : Liste les bases de données
- `\du` : Liste les utilisateurs
- `\c <database>` : Se connecter à une base de données
- `\c <database> <user>` : Se connecter à une base de données avec un utilisateur
- `\dn+` : Liste les schémas
- `\dt <schema>.*` : Liste les tables d'un schéma
- `\d <table>` : Afficher les colonnes d'une table
- `\q` : Quitter l'interface psql

### Création d'une base de données
```sql
CREATE DATABASE db1;
```

### Création d'un schéma
```sql
CREATE SCHEMA schema1;
```
### Création d'une table
```sql
CREATE TABLE schema1.table1 (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);
INSERT INTO schema1.table1 (name) VALUES ('Toto');
```

### Création d'utilisateurs
#### Avec tous les privilèges
```sql
CREATE USER user1 WITH ENCRYPTED PASSWORD 'password1';
GRANT ALL PRIVILEGES ON DATABASE db1 TO user1;
GRANT ALL PRIVILEGES ON SCHEMA schema1 TO user1;
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA schema1 TO user1;
GRANT USAGE ON ALL SEQUENCES IN SCHEMA schema1 TO user1;
```

#### Avec des privilèges limités (lecture seule)
```sql
CREATE USER user2 WITH ENCRYPTED PASSWORD 'password2';
GRANT USAGE ON SCHEMA schema1 TO user2;
GRANT SELECT ON ALL TABLES IN SCHEMA schema1 TO user2;
```