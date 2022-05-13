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

## Phase 2

### Subs
* Sub 
The creator of the sub is the moderator - user_id
A sub has many posts
    * Schema
        - title:string      null:false
        - description:text  null:false
        - user_id:integer   null:false
    * Model
        - validate presence
        - write associations
    * Controller
        - edit
            - moderator is allowed to update title and description
            - before_action
                - prohibit non-mods from editing the sub
    * Routes
        - all 7 routes

### Posts
* Post
    * Schema    
        - title:string      null:false
        - url:string        optional
        - content:text      optional
        - sub_id:integer    null:false, index, unique: true
        - author_id:integer null:false, index, unique: true
    * Model
        - Write validations
        - Write associations
    * Controller
        - no index
        - sub#show will show lists the posts instead
        - only the author can edit their posts (edit and update)
    * Routes
        - 