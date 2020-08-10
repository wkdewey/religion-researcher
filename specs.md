# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project

Yes, it uses the Rails modules like ActiveRecord

- [x] Include at least one has_many relationship (x has_many y; e.g. User has_many Recipes) 

Researcher has_many projects

- [x] Include at least one belongs_to relationship (x belongs_to y; e.g. Post belongs_to User)

project belongs_to researcher

- [x] Include at least two has_many through relationships (x has_many y through z; e.g. Recipe has_many Items through Ingredients)

ReligiousTradition has_many Texts through Authors
Project has_many Authors through Texts

- [x] Include at least one many-to-many relationship (x has_many y through z, y has_many x through z; e.g. Recipe has_many Items through Ingredients, Item has_many Recipes through Ingredients)

Project has_many Texts through Notes, Text has_many Projects through Notes

- [x] The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user (attribute_name e.g. ingredients.quantity)

Notes have :content, so that users can write a note associated with a project and text

- [x] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)

I have validations on most models that they must have a title/name, also researchers must have unique name and password


- [x] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)

I created :written scope to filter notes that actually had content from those that didn't

- [x] Include signup

see researchers#new and #create and researchers/new.html.erb

- [x] Include login

see sessions#new and #create and sessions/new.html.erb

- [x] Include logout

see sessions#destroy

- [x] Include third party signup/login (how e.g. Devise/OmniAuth)

see sessions#create_omniauth (linked from welcome page). Logs in via Github

- [x] Include nested resource show or index (URL e.g. users/2/recipes)

Texts nested within projects

- [x] Include nested resource "new" form (URL e.g. recipes/1/ingredients/new)

I included this, it will create a new text associated with a project

- [x] Include form display of validation errors (form URL e.g. /recipes/new)

see the _errors partial which is included on all of the forms

Confirm:
- [X] The application is pretty DRY

I've created a number of helper methods, partials, etc. to avoid repeition

- [x] Limited logic in controllers

I tried my best here, including the use of model class methods, but I'm open to suggestions how I could refactor my code further

- [x] Views use helper methods if appropriate

author_id_field so that users can select an author for a text
also current_researcher for the current user

- [x] Views use partials if appropriate

partials for forms, errors, and text details