# Rais frontend for EtherCIS

This is an openEHR based rails application using EhterCIS as its backend.

## Ruby version
 2.5 or later


## System dependencies

EtherCIS can be installed via docker compose from the following site.

https://github.com/alessfg/docker-ethercis


Ruby 2.5.0 and Rails 5.1.x should be intalled.
Tentatively database system is sqlite3, but other databases would be available.

## Configuration

The EtherCIS configuration file is /conf/ethercis.yml.
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

The following script completets database migration and seeding 50 pepole with dummy data.

```
# bin/rails db:setup
```

## How to run the test suite
```
# bin/rails rspec
```
## Current issues

 * remove magic numbers
 * management session id
 * visualize!
