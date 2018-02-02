# Rais frontend for EtherCIS

This is a rails application to use EhterCIS as its backend.

## Ruby version
 2.5 or later


## System dependencies

EtherCIS can be installed via docker compose.

```
https://github.com/alessfg/docker-ethercis
```

Ruby 2.5.0 and Rails 5.1.x should be intalled.
Database system is sqlite3.

## Configuration

Tentatively, EtherCIS server is supposed to http://localhost:8888/

##  Run system

Running Server is conventional rails way.

```
# bin/rails s
```

Access to person list: http://localhost:3000/people
Access to templates: http://localhost:3000/templates

##  Database creation
The database is sqlite3. 
```
# bin/rails db:create
```

##  Database initialization

database seed file creates 50 peple files
```
# bin/rails db:seed
```

## How to run the test suite
```
# bin/rails rspec
```
## Current issues

 * remove magic numbers
 * management session id

