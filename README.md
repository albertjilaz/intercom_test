# Intercom Test

This is just an assessment in Ruby.

## Installation
### Requirements
* Ruby 2.3 or higher

### Instructions
1. Clone the repo to your local machine.

    ```git clone https://github.com/albertjilaz/intercom_test.git```
2. Build the gem

    ```cd intercom_test && gem build intercom_test.gemspec```
3. Install the gem

    ```gem install ./intercom_test-0.0.1.gem```


## Running the program
To run the program just execute:

  `intercom_test`

The output will appear in the console.
### Options
If you don't provide any option, the default input provided by Intercom for the assessment will be used.

| Option                |     Description        |
|-----------------------|:-----------------------|
| -h, --help            | Show hekp information |
| -f, --file [FILE]     | Route to a file with a list of customers in JSON format (each row is a customer) |
| -r, --radius [RADIUS] | Indicate the distance from Intercom offices which customers should be within, must be a valid number (default 100.0) |

## Running Tests

* To run the tests:
  ```sh
  $ rake spec
  ```

  or

  ```sh
  $ rspec
  ```




