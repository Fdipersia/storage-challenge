# README

# DESCRIPTION

This web application stores and displays a set of records related to
goods managed by a storage facility. 

It supports a bulk upload facility to update the status of goods in
the storage.

* Ruby version: '2.4.4'

* Database: PostgreSQL

* Database creation: rails db:create

* Test: rspec

# POSSIBLE IMPROVEMENTS

* Add roles, a user can be an Admin and delete other users and / or goods
  - This could be done with Administrate gem

* Add translations

* Add autocomplete to filter while typing
  - This could be done with Elasticsearch

* Improve style
  - This could be donde with some designing

* Improve test coverage
  - Missing testing controllers
  - Add coverage gem

* Fix all the Rubocop offenses
  - So far they are stored in .rubocop_todo.yml
