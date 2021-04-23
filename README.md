# RecipeOnRails Backend 

This project serves as the group Consultancy Project for Module 3 of Turing School of Software & Design's Back-End program.

Our challenge was to create a student-led web application from idea to inception. Project requirements included: authentication with a third-party service, consuming an API, and solving a real-world problem.

You can find our other repositories here:
- [Frontend](https://github.com/RecipesOnRails/ROR-Front-End)
- [Spoonacular Microservice](https://github.com/RecipesOnRails/ROR_recipe_microservice)
- [Kroger Microservice](https://github.com/RecipesOnRails/ROR_shopping_microservice)

## Getting Started

### Prerequisites
Ruby 2.5.3  
Rails 5.2.5

### Installing
#### Step One:
On your local terminal, use this command to clone down the repository on your local machine.

    `git clone git@github.com:RecipesOnRails/ROR-Backend.git` 

#### Step Two
Once that is done, go into that repository and run this command to install the gems locally. 

    `bundle install` 

#### Step Three
Setup Local Database with this command. 

    `rails db:{create, migrate, seed}`

## Running the tests
This application uses RSpec for it's test suite.  

To run the entire test suite, use the command: 

    `bundle exec rspec` 
  
To run specific tests, run..

    `bundle exec rspec` 
    
with the folder it lives in afterwards. EX: 

    `bundle exec rspec spec/models/meal_plan_recipe_spec.rb`

## Deployment
Any pull requests merged into the main branch on GitHub will first be tested by TravisCI.
Once passed by TravisCI, it will automatically deployed to the Heroku website.
https://nameless-plains-48795.herokuapp.com/ is where it lives on production level.

## Built With
* [Ruby on Rails](https://guides.rubyonrails.org/v5.2/) -  Web Framework Used
* [TravisCI](https://docs.travis-ci.com/) - Continuous Integration Service Used
* [Heroku](https://devcenter.heroku.com/categories/reference) - Cloud Platform Service Used

## Contributing
Please read [CONTRIBUTING.md](https://gist.github.com/PurpleBooth/b24679402957c63ec426) for details on our code of conduct, and the process for submitting pull requests to us.

## Versioning
We use [SemVer](http://semver.org/) for versioning. For the versions available, see the [tags on this repository](https://github.com/your/project/tags).

## Authors
* **Megan Gonzales** -- [GitHub](https://github.com/MGonzales26) |
  [LinkedIn](https://www.linkedin.com/in/megan-e-gonzales/)
* **Jacob Arellano** -- [GitHub](https://github.com/jakejakearell) |
  [LinkedIn](https://www.linkedin.com/in/jacob-arellano-ab2890207/)
* **Arika Blenker** -- [GitHub](https://github.com/arikalea) |
  [LinkedIn](https://www.linkedin.com/in/arika-blenker/)
* **Harrison Blake** -- [GitHub](https://github.com/harrison-blake) |
  [LinkedIn](https://www.linkedin.com/in/harrison-blake-802094200/)
* **Hope McGee** -- [GitHub](https://github.com/hopesgit) |
  [LinkedIn](https://www.linkedin.com/in/hope-mcgee/)
* **Trevor Robinson** -- [GitHub](https://github.com/Trevor-Robinson) |
  [LinkedIn](https://www.linkedin.com/in/trevor-robinson-0bb251207/)
* **Jeremiah Michlitsch** -- [GitHub](https://github.com/jmichlitsch) |
  [LinkedIn](https://www.linkedin.com/in/jeremiah-michlitsch-49048a206/)
  
See also the list of [contributors](https://github.com/RecipesOnRails/ROR-Front-End/graphs/contributors)
