# URL Shortener

A Ruby on Rails application for generating short URLs. Uses Devise for user authentication. The database is SQLite3.

Users can sign up and log in to create short URLs. The user's dashboard shows how many times each short URL they've created has been used.

---

## Setting Up

### Versions:
 - Ruby 2.5.1
 - Rails 6.0.3.3

### Running the application:

`git clone git@github.com:hdpuk86/url_shortener.git`

`bundle install`

`yarn install`

`rails s`

## Improvements Needed

- Long URL validation needs refinement
- Mailers have not been checked
- Devise views have no styling
- All styling is basic bootstrap
