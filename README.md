
```markdown
# Ruby on Rails Login/Signup Backend

This repository contains the backend code for a login/signup form implemented using Ruby on Rails.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites

- Ruby version: 2.7.0p0 
- Rails version: 7.0.6


### Installation

1. Clone the repository
   ```
   git clone   https://github.com/Adesoji1/rails-login-signup.git
   ```
2. Navigate into the directory
   ```
   cd your-repo-name
   ```
3. Install all dependencies
   ```
   bundle install
   ```
look below

**Backend (Ruby on Rails)**

First, let's set up a new Rails API application. Open your terminal and run:

```bash
rails new myapp --api -T --database=postgresql
cd myapp
```

This will create a new Rails API application with PostgreSQL as the database. The `-T` flag is used to skip the default Test::Unit installation.

Next, add the following gems to your Gemfile:

```ruby
gem 'devise'
gem 'devise-jwt'
gem 'rack-cors'
```

Then run `bundle install` to install the gems.

Now, let's set up Devise. Run:

```bash
rails generate devise:install
rails generate devise User
```

This will generate a User model with Devise modules. Open the generated model file and make sure it includes `:validatable` and `:registerable`:

```ruby
class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
```

Next, migrate the database:

```bash
rails db:create db:migrate
```

Now, let's set up `devise-jwt`. In `config/initializers/devise.rb`, add:

```ruby
config.jwt do |jwt|
  jwt.secret = ENV['DEVISE_JWT_SECRET_KEY']
  jwt.dispatch_requests = [['POST', %r{^/login$}]]
  jwt.revocation_requests = [['DELETE', %r{^/logout$}]]
end
```

This will set up JWT to be dispatched on login and revoked on logout.

Next, set up CORS. In `config/initializers/cors.rb`, add:

```ruby
Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins '*'
    resource '*',
      headers: :any,
      methods: [:get, :post, :put, :patch, :delete, :options, :head],
      expose: ['Authorization']
  end
end
```



4. Set up the database
   ```
   rails db:create db:migrate
   ```
5. Start the server
   ```
   rails server
   ```

## Usage

This backend provides API endpoints for user registration and login. 

- POST `/signup`: Endpoint for user registration. Expects parameters: `email`, `password`.
- POST `/login`: Endpoint for user login. Expects parameters: `email`, `password`.

## Contributing

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

## License

[MIT](https://choosealicense.com/licenses/mit/)
```


# Rails Authentication Backend

This repository contains a Rails backend application that handles user authentication, including login and signup functionalities.

## Project Structure

The project follows the standard Rails application structure and includes the following key components:

- `app/controllers`: This directory contains the controllers for the application. Controllers handle the web requests that come into the application.

  - `users_controller.rb`: Handles user-related requests, such as creating a new user (signup).
  - `sessions_controller.rb`: Manages sessions for users, including logging in and logging out.

- `app/models`: This directory contains the models for the application. Models represent the data in the application and the rules to manipulate that data.

  - `user.rb`: Represents a user in the application. It includes validations for user attributes.

- `app/views`: This directory contains the views for the application. Views are what the user sees and interacts with in the browser.

  - `sessions`: Contains the views for logging in and logging out.
  - `users`: Contains the views for user-related actions, such as signup.

- `config/routes.rb`: Defines the routes of the application. This is where URLs are mapped to controller actions.

- `db/migrate`: Contains database migration files. Migrations are a way to alter the structure of the database.

- `db/schema.rb`: Represents the current state of the database.

## Functionality

The application provides two main functionalities:

1. **Signup**: New users can create an account by providing their email and password. The `create` action in the `UsersController` handles the signup process. Passwords are securely hashed before being stored in the database.

2. **Login**: Existing users can log in by providing their email and password. The `create` action in the `SessionsController` handles the login process. Upon successful login, a new session is created for the user.

## Setup and Usage

To get started with the application, clone the repository and install the required gems:

```bash
git clone <repository-url>
cd <repository-name>
bundle install
```

Next, create and migrate the database:

```bash
rails db:create db:migrate
```

Finally, start the Rails server:

```bash
rails server
```

The application will be available at `http://localhost:3000`.

To use the application, navigate to `/signup` to create a new account, and `/login` to log in.

## Contributing

Contributions are welcome. Please feel free to open a pull request or branch from this project.

## 
