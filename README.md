# Little Esty Shop
### Name of Contributors & Github Links
[Garrett Gregor](https://github.com/garrettgregor)<br>
[Julian Beldotti](https://github.com/JCBeldo)<br>
[Jimmy Jurado](https://github.com/jcjurado3)<br>
[Austin Woords](https://github.com/boomclear)<br>
### Description of Project
This project, entitled "Little Esty Shop", is a Turing BE-Mod2 Group Project focusing on designing an e-commerce platform. It's funcitonality would allow merchants as well as admins to manage inventory & fulfill customers orders.
The project was completed using `Ruby on Rails` and `PostgreSQL` for the database, `Render` for app deployment to the web, and `Github Projects` for time and project management.
New concepts learned during the course of this project included:
- implementing `rake tasks` in order to seed data from the `CSV` files into the database;
- working with new gems for additional functionality including `factory_bot_rails`, `faker` and `HTTParty`
- creating complex `ActiveRecord` queries to the database;
- Consumed an external `API` to serve data to our site.
Goals achieved during this project:
- 100% coverage of Model and Feature tests using simplecov.
- Worked with and extracted information from multiple objects using `ActiveRecord` queries.
- 98% completion of all the user stories
- Collaborated together as a group and then in pairs for the dashboard/show pages and then worked async and split the remaining four sections to successfully complete the project.
- Used GitHub projects, milestones, and issues to effectively coordinate all tasks amongst the team.
Summary of Milestones:
- Merchant Dashboard - This page shows details for a particular merchant, including the items that are ready to ship and favorite customers
- Merchant Invoices - This displays an index page for invoices that links to a show page which shows information for the customer on this invoice and a table that shows each item on the invoice including a selector which allows for the user update the status
- Merchant Items - These pages allow a visitor to enable/disable particular items and click into those items to see a description. Additionally it reflects the sales of the top five items that this merchant has sold alongside their sales amount and best date of purchases
- Admin Dashboard - Shows top 5 customers by successful transactions and all incomplete invoices
- Admin Merchants - Merchant index and show pages, with top 5 merchants by revenue, disabled and enabled merchants, and edit merchants functionality
- Admin Invoices - Shows an index page of all IDs in the system and then Shows the details of each individual invoice. Detailed customer, invoice, and item information
- Unsplash API consumption - Adds images to various show pages and a logo to all pages
Potential Refactor Opportunities
- Make one partials (merchant side missing) to display easy access links for a user and admin to navigate between dashboard, items, and invoice pages.
- Update a welcome page and provide links to admin and merchant show pages.
- Style the whole app with CSS.

# Little Esty Shop

## Background and Description

"Little Esty Shop" is a group project that requires students to build a fictitious e-commerce platform where merchants and admins can manage inventory and fulfill customer invoices.

## Learning Goals
- Practice designing a normalized database schema and defining model relationships
- Utilize advanced routing techniques including namespacing to organize and group like functionality together.
- Utilize advanced active record techniques to perform complex database queries
- Practice consuming a public API while utilizing POROs as a way to apply OOP principles to organize code

## Requirements
- Must use Rails 7.0.x, Ruby 3.1.1
- Must use PostgreSQL
- All code must be tested via feature tests and model tests, respectively
- Must use GitHub branching, team code reviews via GitHub PR comments, and either GitHub Projects or a project management tool of your group's choice (Trello, Notion, etc.)
- Must include a thorough README to describe the project
   - README should include a basic description of the project, a summary of the work completed, and some ideas for a potential contributor to work on/refactor next. Also include the names and GitHub links of all student contributors on your project. 
- Must deploy completed code to the internet (using Heroku or Render)
- Continuous Integration / Continuous Deployment is not allowed
- Use of scaffolding is not allowed
- Any gems added to the project must be approved by an instructor
  - Pre-approved gems are `capybara, pry, faker, factory_bot_rails, orderly, simplecov, shoulda-matchers, launchy`

## Setup

* Fork this repository
* Clone your fork
* From the command line, install gems and set up your DB:
    * `bundle`
    * `rails db:create`
* Run the test suite with `bundle exec rspec`.
* Run your development server with `rails s` to see the app in action.

## Phases

1. [Database Setup](./doc/db_setup.md)
1. [User Stories](./doc/user_stories.md)
1. [Extensions](./doc/extensions.md)
1. [Evaluation](./doc/evaluation.md)
