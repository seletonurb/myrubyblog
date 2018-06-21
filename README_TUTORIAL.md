#RUBY ON RAILS Tutorial #

---
#SECTION 1 - Environment Set up and Deployment
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
