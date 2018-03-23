# Pet Predictor Web App

The web application prompts the user for his/her height and weight then guesses whether the person prefers dogs or cats.  

**Prerequisite:** This app uses the Pet Predictor Service.  See the *petpredictor-service* repository for setup instructions.

### How to setup on your local environment:

  * Ruby version: 2.4.1

  * Rails Configuration. Switch to the application folder and run the following terminal commands:
    - `bundle install`
    - `bundle exec figaro install`
      - this creates config/application.yml
      - edit config/application.yml and add new entry that uses the petpredictor-service:
        ```
        predictorservice_api_host: http://api.ac-dev.com:3010
        ```

  * How to run the test suite
    - app is using Minitest
    ```
    rake
    ```

  * Start the service
    ```
    rails s
    ```

### Launch the web app on your browser

  * Using your favorite browser goto `http://localhost:3000/petpredictor`

  * Enter your height and weight and see whether it knows if you are a DOG or CAT person.  Enjoy!
