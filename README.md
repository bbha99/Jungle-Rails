# Jungle

A mini e-commerce application built with Rails 6.1

## Final Product

!["screenshot of the homepage"](https://github.com/bbha99/Jungle-Rails/blob/master/docs/homepage.png?raw=true)
!["screenshot of adding product to cart"](https://github.com/bbha99/Jungle-Rails/blob/master/docs/add-to-cart.png?raw=true)
!["screenshot of the cart page"](https://github.com/bbha99/Jungle-Rails/blob/master/docs/cart-page.png?raw=true)
!["screenshot of the admin dashboard"](https://github.com/bbha99/Jungle-Rails/blob/master/docs/admin-dashboard-page.png?raw=true)
!["screenshot of the admin product page"](https://github.com/bbha99/Jungle-Rails/blob/master/docs/admin-product-page.png?raw=true)
!["screenshot of the category page"](https://github.com/bbha99/Jungle-Rails/blob/master/docs/admin-category-page.png?raw=true)

## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rails db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Database

If Rails is complaining about authentication to the database, uncomment the user and password fields from `config/database.yml` in the development and test sections, and replace if necessary the user and password `development` to an existing database user.

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

- Rails 6.1 [Rails Guide](http://guides.rubyonrails.org/v6.1/)
- Bootstrap 5
- PostgreSQL 9.x
- Stripe
