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

1) Generate a new posts controller:

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

5) Create Category controller (will be used later):
```
> rails generate controller categories index edit new show
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
> rake routes
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

## Database Models

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

3) Create a new posts database model.

```
> rails g model post title:string body:text category_id:integer author_id:integer
    invoke  active_record
    create    db/migrate/20180704151740_create_posts.rb
    create    app/models/post.rb
    invoke    test_unit
    create      test/models/post_test.rb
    create      test/fixtures/posts.yml
```

4) Migrate generated model tables to the database

```
> rake db:migrate

== 20180704151740 CreatePosts: migrating ======================================
-- create_table(:posts)
   -> 0.0185s
== 20180704151740 CreatePosts: migrated (0.0190s) =============================

```

5) Creating Table Associations

There are six types of associations:

- belongs_to
- has_one
- has_many
- has_many :through
- has_one :through
- has_and_belongs_to_many

```ruby
class Post < ApplicationRecord
  belongs_to :category
end

class Category < ApplicationRecord
  has_many :posts
end
```

## Database Models operations using Rails console

Open the terminal console, browse to the project folder and then open rails console:

```
> rails console
```

1) CREATION

```ruby
category = Category.new(:name => "News") # returns an object with a nil id
# save in the database
category.save
```

The save method call from the model will output the query:
```
> category.save
     (1.0ms)  BEGIN
    SQL (3.0ms)  INSERT INTO "categories" ("name", "created_at", "updated_at") VAL
  UES ($1, $2, $3) RETURNING "id"  [["name", "News"], ["created_at", "2018-07-04 1
  7:23:29.732988"], ["updated_at", "2018-07-04 17:23:29.732988"]]
     (2.0ms)  COMMIT
  => true
```
Alternatively, a creation can be done using the create command:

```ruby
category = Category.create(:name => "Tutorials") # returns an object with an id
```

Creating a new Post
```ruby
post = Post.create(:title => "My First Post", :body => "This is the first post sample test", :category_id => 1, :author_id => nil) # returns an object with an id, association with News category
post = Post.create(:title => "My Second Post", :body => "This is the second post sample test", :category_id => 2, :author_id => nil) # returns an object with an id, association with News category
```

2) READ

2.1) All method
```
> Category.all
    Category Load (1.0ms)  SELECT  "categories".* FROM "categories" LIMIT $1  [["L
  IMIT", 11]]
  => #<ActiveRecord::Relation [#<Category id: 1, name: "News", created_at: "2018-0
  7-04 17:23:29", updated_at: "2018-07-04 17:23:29">, #<Category id: 2, name: "Tut
  orials", created_at: "2018-07-04 17:26:51", updated_at: "2018-07-04 17:26:51">,
  #<Category id: 3, name: "Programming", created_at: "2018-07-04 17:27:01", update
  d_at: "2018-07-04 17:27:01">, #<Category id: 4, name: "Design", created_at: "201
  8-07-04 17:27:08", updated_at: "2018-07-04 17:27:08">]>
```

2.2) Find method
```
> Post.find(1)
    Post Load (1.0ms)  SELECT  "posts".* FROM "posts" WHERE "posts"."id" = $1 LIMI
  T $2  [["id", 1], ["LIMIT", 1]]
  => #<Post id: 1, title: "My First Post", body: "This is the first post sample te
  st", category_id: 1, author_id: nil, created_at: "2018-07-04 18:01:26", updated_
  at: "2018-07-04 18:01:26">
```

3) UPDATE
```
> post.title= "This is another title"
> post.save
```

Alternatively, a creation can be done using the create command:

```
> post.update_attribute(:title, "Update title")
  (0.0ms)  BEGIN
  SQL (1.0ms)  UPDATE "posts" SET "title" = $1, "updated_at" = $2 WHERE "posts".
  "id" = $3  [["title", "Update title"], ["updated_at", "2018-07-04 18:06:45.30244
  6"], ["id", 1]]
  (2.0ms)  COMMIT
  => true
```

4) DELETE
```
> post.destroy
  (0.0ms)  BEGIN
  SQL (1.0ms)  DELETE FROM "posts" WHERE "posts"."id" = $1  [["id", 1]]
  (2.0ms)  COMMIT
  => #<Post id: 1, title: "Update title", body: "This is the first post sample tes
  t", category_id: 1, author_id: nil, created_at: "2018-07-04 18:01:26", updated_a
  t: "2018-07-04 18:06:45">
```

## Database Reading

Update the posts_controller.rb with an instance variable
```ruby
def index
  @posts = Post.all
end
```
Update the index.html.erb with a reference to the instance variable to create a posts loop
```html
<h1> Blog Posts </h1>
<% @posts.each do |post| %>
  <h3><%= post.title %></h3>
  <p><%= post.body %></p>
  <hr />
<% end %>
```
The same is done for the show route.

## Database Creation

Update the posts_controller.rb create and new methods
```ruby
def new
  @post = Post.new
  @categories = Category.all
end
def post_params
  params.require(:post).permit(:title, :body, :category_id, :author_id)
end
def create
  @post = Post.new(post_params)
  if @post.save
    redirect_to posts_path, :notice => "Your post has been saved"
  else
    render "new"
  end
end
```

Update the new.html.erb with a form for the new post
```html
<h1>Add New Post</h1>
<%= form_for @post do |f| %>
	<p>
		<%= f.label :title %><br />
		<%= f.text_field :title %><br />
	</p>
	<p>
		<%= f.label :body %><br />
		<%= f.text_area :body %><br />
	</p>
	<p>
		<%= f.select :category_id, Category.all.collect {|x| [x.name, x.id]}, {:include_blank => "Select One"} %><br />
	</p>
	<p>
		<%= f.submit "Add Post" %>
	</p>
<% end %>
```

## Database Update

Update the posts_controller.rb edit and update methods
```ruby
def edit
  @post = Post.find(params[:id])
end
def update
  @post = Post.find(params[:id])

  if @post.update_attributes(post_params)
    redirect_to post_path, :notice => "Your post has been updated"
  else
    render "edit"
  end
end
```

Update the edit.html.erb with a form for to update the post
```html
<h1> Edit Post </h1>
<%= form_for @post do |f| %>
	<p>
		<%= f.label :title %><br />
		<%= f.text_field :title %><br />
	</p>
	<p>
		<%= f.label :body %><br />
		<%= f.text_area :body %><br />
	</p>
	<p>
		<%= f.select :category_id, Category.all.collect {|x| [x.name, x.id]}, {:include_blank => "Select One"} %><br />
	</p>
	<p>
		<%= f.submit "Update Post" %>
	</p>
<% end %>
<%= link_to "Go Back", post_path %>
```

## Database Delete

Update the posts_controller.rb destroy method
```ruby
def destroy
  @post = Post.find(params[:id])
  @post.destroy
  redirect_to posts_path, :notice => "Your post has been deleted"
end
```

Update the show.html.erb with a link to delete the post
```html
<h1><%= @post.title %></h1>
<small><%= @post.created_at.strftime("%b %d. %Y") %></small>
<p><%= @post.body %></p>
<%= link_to "Edit Post", edit_post_path %> | <%= link_to "Delete", @post, :confirm => "Are you sure you want to delete?", :method => :delete %>
```

---
# SECTION 4 - Scaffolding and Active Admin
---

## Scaffolding in Rails

Scaffolding in rails will basically create everything related to a model: the controller, the model, the view, the database migration, the unit tests, the styles and helpers.

```
> rails g scaffold category name:string

    invoke  active_record
    create    db/migrate/20180707215319_create_categories.rb
    create    app/models/category.rb
    invoke    test_unit
    create      test/models/category_test.rb
    create      test/fixtures/categories.yml
    invoke  resource_route
     route    resources :categories
    invoke  scaffold_controller
    create    app/controllers/categories_controller.rb
    invoke    erb
    create      app/views/categories
    create      app/views/categories/index.html.erb
    create      app/views/categories/edit.html.erb
    create      app/views/categories/show.html.erb
    create      app/views/categories/new.html.erb
    create      app/views/categories/_form.html.erb
    invoke    test_unit
    create      test/controllers/categories_controller_test.rb
    invoke    helper
    create      app/helpers/categories_helper.rb
    invoke      test_unit
    invoke    jbuilder
    create      app/views/categories/index.json.jbuilder
    create      app/views/categories/show.json.jbuilder
    create      app/views/categories/_category.json.jbuilder
    invoke  test_unit
    create    test/system/categories_test.rb
    invoke  assets
    invoke    coffee
    create      app/assets/javascripts/categories.coffee
    invoke    scss
    create      app/assets/stylesheets/categories.scss
    invoke  scss
    create    app/assets/stylesheets/scaffolds.scss
```

## Active Admin

### Install gem

Add  activeadmin and devise gem to Gemfile and save: `gem 'activeadmin' gem 'devise'`
Run the following commands:
```
> bundle install
> rails generate active_admin:install

      invoke  devise
      generate    devise:install
      create    config/initializers/devise.rb
      create    config/locales/devise.en.yml
      ==============================================================================
      =

      Some setup you must do manually if you haven't yet:

      1. Ensure you have defined default url options in your environments files. Here is an example of default_url_options appropriate for a development environm ent in config/environments/development.rb:

       config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }

      In production, :host should be set to the actual host of your application.

      2. Ensure you have defined root_url to *something* in your config/routes.rb. For example:
       root to: "home#index"

      3. Ensure you have flash messages in app/views/layouts/application.html.erb. For example:

       <p class="notice"><%= notice %></p>
       <p class="alert"><%= alert %></p>

      4. You can copy Devise views (for customization) to your app by running:

       rails g devise:views

      ===============================================================================
      invoke    active_record
      create      db/migrate/20180709131843_devise_create_admin_users.rb
      create      app/models/admin_user.rb
      invoke      test_unit
      create        test/models/admin_user_test.rb
      create        test/fixtures/admin_users.yml
      insert      app/models/admin_user.rb
       route    devise_for :admin_users
        gsub    app/models/admin_user.rb
        gsub    config/routes.rb
      append    db/seeds.rb
      create  config/initializers/active_admin.rb
      create  app/admin
      create  app/admin/dashboard.rb
      create  app/admin/admin_users.rb
      insert  config/routes.rb
      generate  active_admin:assets
      create  app/assets/javascripts/active_admin.js.coffee
      create  app/assets/stylesheets/active_admin.scss
      create  db/migrate/20180709131853_create_active_admin_comments.rb
```

The previous commands will generate some migration files. So next run db migrate to create the new admin tables:
```
> rake db:migrate

== 20180709131843 DeviseCreateAdminUsers: migrating ===========================
-- create_table(:admin_users)
   -> 0.0613s
-- add_index(:admin_users, :email, {:unique=>true})
   -> 0.0129s
-- add_index(:admin_users, :reset_password_token, {:unique=>true})
   -> 0.0074s
== 20180709131843 DeviseCreateAdminUsers: migrated (0.0832s) ==================

== 20180709131853 CreateActiveAdminComments: migrating ========================
-- create_table(:active_admin_comments)
   -> 0.0301s
-- add_index(:active_admin_comments, [:namespace])
   -> 0.0058s
== 20180709131853 CreateActiveAdminComments: migrated (0.0367s) ===============
```

Then run db seed to add initial data after a database is created:
```
> rake db:seed
```

### Run server and access Active Admin area

Start server and go to `http://localhost:3000/admin/login`. Enter the default user `admin@example.com` and password `password`.

### Posts and Category from Active Admin

Generate the resources for Active Admin to manage Categories and Posts from Active Admin:
```
> rails generate active_admin:resource Category
> rails generate active_admin:resource Post
```
Rails will create all the necessary routes to manage posts and categories

```
http://localhost:3000/admin/categories
http://localhost:3000/admin/posts
```

### Allow Active Admin resource edition with permit params

Go to app -> admin -> categories.rb and edit:
```ruby
ActiveAdmin.register Post do
  menu :label => "Blog Posts"
end
```

### Create Active Admin dashboard

Go to app -> admin -> dashboard.rb and edit:
```ruby
ActiveAdmin.register_page "Dashboard" do
  content do
    section "Categories" do
      table_for Category.order("id desc").limit(15) do
        column :id
        column "Category Name",:name do |category|
          link_to category.name, [:admin,category]
        end
        column :created_at
      end
      strong {link_to "Show all Categories", :admin_categories}
    end
    section "Recent Posts" do
      table_for Post.order("id desc").limit(15) do
        column :id
        column "Post Title",:title do |post|
          link_to post.title, [:admin,post]
        end
        column :category,:sortable => :category
        column :created_at
      end
      strong {link_to "Show all Posts", :admin_posts}
    end
  end
end
```

Go to `http://localhost:3000/admin/dashboard` and access your new dashboard

---
# SECTION 5 - Layout, Presentation and Testing
---

## Static Pages

Generate a 'pages' controller with a 'about', 'contact' and resources view
```
> rails g controller pages about, contact resources
    create  app/controllers/pages_controller.rb
     route  get 'pages/resources'
     route  get 'pages/contact'
     route  get 'pages/about,'
    invoke  erb
    create    app/views/pages
    create    app/views/pages/about,.html.erb
    create    app/views/pages/contact.html.erb
    create    app/views/pages/resources.html.erb
    invoke  test_unit
    create    test/controllers/pages_controller_test.rb
    invoke  helper
    create    app/helpers/pages_helper.rb
    invoke    test_unit
    invoke  assets
    invoke    coffee
    create      app/assets/javascripts/pages.coffee
    invoke    scss
    create      app/assets/stylesheets/pages.scss
```

On routes.rb, adjust the static page route to the corresponding view if you want to change the default routes from:
```ruby
  get 'pages/about'
  get 'pages/contact'
  get 'pages/resources'
```
To the new routes:
```ruby
  get 'about' => 'pages#about'
  get 'contact' => 'pages#contact'
  get 'resources' => 'pages#resources'
```

## Integrating and Rendering HTML and CSS

1. Add all the applicatoin style : create `application.css` file in `app/assets/stylesheets`
2. Update root application file with new html: update `application.html.erb` file in `app/views/layouts`
3. Update all existing views files that are being referenced by the root file: update `html.erb` files in `app/views/home`, `app/views/pages` and `app/views/posts`


# References

1. [RoR routing](http://guides.rubyonrails.org/routing.html)
2. [RoR Associations](http://guides.rubyonrails.org/association_basics.html)
3. [RoR Active Admin](https://activeadmin.info/documentation.html)
4. [RoR Layouts and Rendering](http://guides.rubyonrails.org/layouts_and_rendering.html#structuring-layouts)
