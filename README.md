# Farmers Market Database 
A Ruby on Rails web application built by [Briana Eng](https://www.github.com/brianaeng) and [Alyssa Hursh](https://www.github.com/alyssahursh). Our first Rails application, with a SQLite database seeded by CSV import. Interact with it [here](https://farmar-app.herokuapp.com). (This application is deployed on Heroku, so you may need to give the site a minute to wake up the server.)

![Farmar screen shots](/FarmarSS.png?raw=true "Farmar screen shots")


## Technologies
* Primary language: Ruby 2.3.1
* Framework: Rails 4.7.2
* Database: SQLite
* Database seeding from CSV import
* HTML/CSS
* Deployed on Heroku.

## Successes
* We worked very well together, splitting up front-end and back-end work to avoid merge conflicts and maintain project velocity. We were able to break the project into micro tasks and checked in with each other frequently. Well-matched communications styles made this project especially enjoyable.
* We created a mock login feature, redirecting to a "logged in" view from certain ingresses (we hadn't yet learned user authentication).
* The layout and design turned out quite well (especially given that this was our second project with substantial HTML/CSS).

## User Stories Implemented

### Overall
- As a user, when I visit "/", I can choose whether I want to act as a Market or a Vendor
- As a user, I can view all Markets
- As a user, I can view a specific Market, viewing its attributes as well as a list of its vendors

### Market
- As a market, I can create or edit my Market
- As a market, I can create, edit, or delete any Vendors

### Vendor
- As a vendor, I can create, edit, or delete my Products
- As a vendor, I can create a Sale for one of my Products

### Admin
- As an admin, I can add add Markets
