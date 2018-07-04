# RUBY ON RAILS Tutorial #

---
# SECTION 1 - Environment Set up and Deployment
---

1) Create an app:

```
> rails new app-name
```

Obs.: Most important generated folders:
- app : where most of the work in the MVC app will be done
- db : database migration
- public: files from the client app

2) Start Server:

```
> 'rails s' or 'rails server'
```

3) Go to http://localhost:3000

Generated Server Log:

```
Started GET "/" for 127.0.0.1 at 2018-05-29 23:42:58 -0300
Processing by Rails::WelcomeController#index as HTML
  Rendering C:/RailsInstaller/Ruby2.3.3/lib/ruby/gems/2.3.0/gems/railties-5.1.6/
lib/rails/templates/rails/welcome/index.html.erb
  Rendered C:/RailsInstaller/Ruby2.3.3/lib/ruby/gems/2.3.0/gems/railties-5.1.6/l
ib/rails/templates/rails/welcome/index.html.erb (4.0ms)
Completed 200 OK in 86ms (Views: 46.7ms)
```

4) Generate a controller (home) and a view (index):

```
> rails generate controller home index

      create  app/controllers/home_controller.rb
       route  get 'home/index'
      invoke  erb
      create    app/views/home
      create    app/views/home/index.html.erb
      invoke  test_unit
      create    test/controllers/home_controller_test.rb
      invoke  helper
      create    app/helpers/home_helper.rb
      invoke    test_unit
      invoke  assets
      invoke    coffee
      create      app/assets/javascripts/home.coffee
      invoke    scss
      create      app/assets/stylesheets/home.scss
```


6) Configure database. Install Postgres:

```
> gem install pg
```

In Gemfile, add line: gem 'pg'

```
> bundle install
```

7) Install Heroku CLI

```
> gem install heroku
> bundle install
```

---
# SECTION 2 - Controller Views and Routes
---

## Generating Controllers and Views

1) Generate a nw posts controller:

```
> rails generate controller posts

      create  app/controllers/posts_controller.rb
      invoke  erb
      create    app/views/posts
      invoke  test_unit
      create    test/controllers/posts_controller_test.rb
      invoke  helper
      create    app/helpers/posts_helper.rb
      invoke    test_unit
      invoke  assets
      invoke    coffee
      create      app/assets/javascripts/posts.coffee
      invoke    scss
      create      app/assets/stylesheets/posts.scss
```

2) Define an action in the Posts Controller. First of them is 'index' (aka root). There are seven actions in RoR controllers that will be discussed in the *Action Controllers & Routes* section (next section). On posts_controller.rb:

```ruby
class PostsController < ApplicationController
  def index
  end
end
```

3) Create a index.html.erb file inside posts folder in view folder

```html
<h1> Blog Posts </h1>
<h3>Sample Post One </h3>
<p> This is some text for our awesome Ruby blog</p>
<hr />
<h3>Sample Post Two </h3>
<p> This is another text for our awesome Ruby blog</p>
```

4) Updates routes.rb under root line with the new posts resource (path <hostname>/posts):

```ruby
root 'home#index'
    resources :posts
```

## Action Controllers & Routes

Possible actions for RoR controllers:

| Controller#Action | HTTP Verb	| Description |
|:-----------------:|:---------:|:-----------:|
|index              |GET        | display a list of resources|
|new                |GET        | return an HTML form for creating a new resource|
|create             |POST       | create a new resource|
|show               |GET        | display a specific resource|
|edit               |GET        | return an HTML form for editing a resource|
|update             |PATCH/PUT  | update a specific resource|
|destroy            |DELETE     | delete a specific resource|


1) Command to show all the possible routes for my controllers

```
>rake routes
   Prefix Verb   URI Pattern               Controller#Action
     root GET    /                         home#index
    posts GET    /posts(.:format)          posts#index
          POST   /posts(.:format)          posts#create
 new_post GET    /posts/new(.:format)      posts#new
edit_post GET    /posts/:id/edit(.:format) posts#edit
     post GET    /posts/:id(.:format)      posts#show
          PATCH  /posts/:id(.:format)      posts#update
          PUT    /posts/:id(.:format)      posts#update
          DELETE /posts/:id(.:format)      posts#destroy
```

2) Define methods for all posts routes. On posts_controller.rb:

```ruby
class PostsController < ApplicationController
  def index
  end
  def new
  end
  def create
  end
  def edit
  end
  def update
  end
  def show
  end
  def destroy
  end
end
```

3) Create views for 'index', 'new', 'show' and 'edit' posts routes (the ones that can have views associated with it). New html files in app/views/posts:

edit.html.erb
index.html.erb
new.html.erb
show.html.erb

4) Define a variable in the controller and make a reference to it in the view:

On posts_controller.rb:

```ruby
class PostsController < ApplicationController
  def index
    @content_first = 'This is some text for our awesome Ruby blog'
    @content_second = 'This is another text for our awesome Ruby blog'
  end

  ...

end
```

On index.html.rb:

```html
<h1> Blog Posts </h1>
<h3>Sample Post One </h3>
<p><%= @content_first %></p>
<hr />
<h3>Sample Post Two </h3>
<p><%= @content_second %></p>
```

---
# SECTION 3 - Working with Models and Databases
---

1) Create a new database model.

Let's generate a category model with fields:

```
> rails g model category name:string

    invoke  active_record
    create    db/migrate/20180704145759_create_categories.rb
    create    app/models/category.rb
    invoke    test_unit
    create      test/models/category_test.rb
    create      test/fixtures/categories.yml

```
2) Migrate generated model tables to the database

To migrate the category table to the database, execute the following command:

```
> rake db:migrate

== 20180704145759 CreateCategories: migrating =================================
-- create_table(:categories)
   -> 0.0204s
== 20180704145759 CreateCategories: migrated (0.0214s) ========================

```

To check the new CATEGORY table, open pgAdmin tool (installed previously)
On the left side menu, go to: Servers -> PostgresSQL -> Databases -> myrubyblog -> Schemas -> Publid -> Tables -> categories

# References

1. [RoR routing](http://guides.rubyonrails.org/routing.html)
