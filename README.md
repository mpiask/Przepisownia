# README

Przepisownia is a simple application. Its issue is to add and store kitchen recipes. The recipes are divided into categories, which user can create.
Each user has his own list of recipes that he or admin can edit or delete and other users can read and vote up or down. I used following gems:
- will_paginate to divide lists into pages with specified amount of elements
- devise to provide registration, login and authentication
- devise_bootstrap_view and twitter_bootstrap_rails to make a basic layout
- rubocop to help refactoring the code
- acts_as_votable for rating the recipes.

It's made on Rails 5.2.1.
