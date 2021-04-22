# RecipeOnRails Backend 

One Paragraph of project description goes here

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

### Prerequisites

What things you need to install the software and how to install them

```
Give examples
```

### Installing

A step by step series of examples that tell you how to get a development env running

Say what the step will be

```
Give the example
```

And repeat

```
until finished
```

End with an example of getting some data out of the system or using it for a little demo

## Running the tests

Explain how to run the automated tests for this system

### Break down into end to end tests

Explain what these tests test and why

```
Give an example
```

### And coding style tests

Explain what these tests test and why

```
Give an example
```
## Endpoints

### Recipe search

   Passes params from user on recipe search page to spoonacular microservice.
   Returns standard JSON for Frontend views.
   
   ```{
       "data": {
        "id": Integer
        "type": String,
        "attributes": {
            "Title": String,
            "Cuisine": [ { } ],
            "Calories": { },
         }
       }
     }
```
## Deployment

Add additional notes about how to deploy this on a live system

## Built With

* [Dropwizard](http://www.dropwizard.io/1.0.2/docs/) - The web framework used
* [Maven](https://maven.apache.org/) - Dependency Management
* [ROME](https://rometools.github.io/rome/) - Used to generate RSS Feeds

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
## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgments

* Hat tip to anyone whose code was used
* Inspiration
* etc
