# README
# Reddit on Rails
Learning Goals
* Be able to write auth from scratch without looking at previous solutions
* Know how to use a before_action to manage user access to resources
* Be able to write Rails models, controllers, and views quickly
* Know when to use regular associations and when to use join tables
* Know how to avoid N+1 queries

## Phase 1: Authentication
Write basic auth implementation for: 
* User
    * Schema
        - username          null:false  unique:true
        - session_token     null:false  unique:true
        - password_digest   null:false
* UsersController
    * routes: [:new, :create, :show]
    * methods:
        - SPIRE
        - new, create, show
    * views:
* SessionsController
    * routes: []
    * methods: 
    * views: 
* Application Controller
    * CHRRLLL
