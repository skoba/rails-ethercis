# Rais frontend for EtherCIS

This is a rails application to use EhterCIS as its backend.

* Ruby version
Developing on Ruby 2.5

* System dependencies
EtherCIS can be installed via docker compose.
https://github.com/alessfg/docker-ethercis


* Configuration
Tentatively, EtherCIS server is supposed to http://localhost:8888/

* Database creation
# bin/rails db:create

* Database initialization
database setup creates 50 peple files
# bin/rails db:setup

* How to run the test suite

# bin rails rspec

* Current issues

# remove magic numbers
# management session id