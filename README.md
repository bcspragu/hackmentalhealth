# Hack Mental Health Starter Code

This repository contains the starting code for the [Hack Mental Health coding
workshop](https://www.hackmentalhealth.care/coding-workshops). See a live
example of this project [here](https://floating-tor-11853.herokuapp.com/).

The project is based on [this chatbot
tutorial](https://medium.freecodecamp.org/what-does-it-take-to-build-a-chatbot-lets-find-out-b4d009ea8cfd),
and the [accompanying code](https://github.com/van100j/tibot). While the
original tutorial focuses on a chatbot that handles time and date questions,
this starter kit includes different modules, for example, for applying
transformations to text (ex. "Reverse the word 'fish'").

## Pre-Work

The workshop has a lot of ground to cover, and not a lot of time. To maximize
the amount of time we have for learning and hacking, these pre-work
instructions will help you get a working project set up so that you can hit the
ground running. If you have any trouble with these instructions, or are totally
lost, definitely ask questions in the [Slack channel for the
workshop](https://hackmentalhealth.slack.com/messages/C925ATDPG/). I'll also be
at the hackathon in the mentor HQ in Room 303 to answer any questions about
technical set-up for the workshop from 8am - 10am on Saturday.

After following these pre-work instructions, you'll have the sample application
running locally on your computer.

### Prerequisites:
* A working Windows, Mac, or Linux computer.
* Some sort of JavaScript (or CoffeeScript, or TypeScript) experience
* (Optional, but useful) Experience with the Git and the command-line

### All the software used in this tutorial:
* Docker (for setting everything else up)
* Git
* Yarn
* NPM
* AngularJS

### Setting up Accounts

#### DialogFlow

DialogFlow (formerly API.ai) is a system for building chatbot applications via
an easy-to-use API. For our application, we'll specify what types of requests
our chatbot should understand and respond to, and then we'll be able to serve
custom responses based on the chat messages we receive.

1. DialogFlow integrates with Google Cloud, and doesn't require you to create
   an account. Click the "[Sign in with
   Google](https://console.dialogflow.com/api-client/#/login)" button to get
   started.
  * Note: It may require you to do some configuring, like setting up a billing
    account, if you've never used Google Cloud before. Don't worry, it won't
    charge you for anything, the chatbot will be free for everything we do in
    this workshop.
1. On the left-hand side, select "Create new agent", this is where we'll
   make our chatbot.
1. Give your agent a name at the top where it says "Agent name", and leave
   all other settings at their defaults.
1. Click "Create"
1. Once it finishes creating, click the gear/settings icon on the left-hand
   side next to your bot's name.
1. Look near the bottom for a section called "Client access token", and
   record that token somewhere, you'll need it later.

#### Heroku

Heroku is a system for quickly and easily deploying your applications to the
Internet. We'll use Heroku to deploy our application so that other people can
see the awesome bots we've made. The sample bot is deployed on Heroku
[here](https://floating-tor-11853.herokuapp.com/).

1. Create an account [with Heroku](https://signup.heroku.com).
1. Open the confirmation email and click the activation link.
1. Your Heroku account is all ready to deploy apps, and you're ready to start
   working with the project.

### Setting up the Project

The project has a number of dependencies that need to be installed and
configured. This respository contains tools for setting up those dependencies
inside Docker containers. For those unfamiliar,
[Docker](https://www.docker.com/) is a system for managing
[containers](https://www.docker.com/what-container), which you can think of as
mini-computers running in a little sandbox inside your main computer. Here, we
use a container that includes all of the tools you need to build and run your
application. If you want to install the tools directly onto your computer
instead of using containers, there are directions for that too.

#### Downloading the Code

The code you need to run the project is stored in this repository. If you have
Git installed, you can download this repository by running `git clone
https://github.com/bcspragu/hackmentalhealth.git`. If you don't have Git
installed, you can [download a ZIP
file](https://github.com/bcspragu/hackmentalhealth/archive/master.zip) instead.
Now, open the directory you just downloaded in your terminal application.

#### Method #1: Using Docker

1. cd HackMentalHealth
1. ./build-docker-container.sh
1. It will prompt you for your Heroku credentials, enter them
1. Copy the 'dev.env.example' file to 'dev.env', and replace
   'INSERT_YOUR_TOKEN_HERE' with your "Client access token" from
   DialogFlow.


#### Method #2: Direct Installation

  * Two options:
    * Install Docker
    * Install npm, yarn, git, and heroku cli
  * Docker instructions:


### Running the project
1. In two separate windows, run ./docker-run-server.sh and
   ./docker-build-frontend-dev.sh
1. In your web browser, navigate to http://localhost:8080. You should see a
   greeting from SampleBot.

### Deploying the Project


