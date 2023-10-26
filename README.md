# Automation Test for optimy

This project contains a robot script for automating the submission of a new application on a optimy portal. 

## Prerequisites

Before running the script, ensure that you have the following prerequisites installed:

- [Python](https://www.python.org/downloads/)
- [Robot Framework](https://robotframework.org/)
- [SeleniumLibrary](https://robotframework.org/SeleniumLibrary/SeleniumLibrary.html)
- Chrome WebDriver

## Setup

1. Clone this repository to your local machine:

2. Install the required Python dependencies: 

robotframework==6.0.2
robotframework-seleniumlibrary==6.1.1

3. Download and place the Chrome WebDriver executable in a directory included in your system's PATH. You can download it from [here](https://chromedriver.chromium.org/downloads).

4. Update the test script variables in the `tests.robot` file with your specific credentials, userdata and file paths.

## Running the Test

Execute the test using Robot Framework:

robot -d results/ tests.robot
