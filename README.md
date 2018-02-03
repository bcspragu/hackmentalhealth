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
1. If you want your bot to respond to things like "Hello" and "How are you
   doing today?", select "Small talk" from the left-hand side, select "Enable",
   and then hit "Save".

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

The code you need to run the project is stored in this repository. You can
[download a ZIP
file](https://github.com/bcspragu/hackmentalhealth/archive/master.zip), or run
`git clone https://github.com/bcspragu/hackmentalhealth.git` in your terminal
if you have Git installed. Once downloaded, open the directory in a terminal.
If you're unfamiliar with the terminal, ask for help in the [Slack channel
for the workshop](https://hackmentalhealth.slack.com/messages/C925ATDPG/), or
check in with me before the workshops the day of.

#### Method #1: Using Docker

1. If you already have Docker installed, you can skip this step. If you don't
   have Docker installed, Docker has [installation
   instructions](https://docs.docker.com/install/) for all common platforms,
   including [Windows](https://docs.docker.com/docker-for-windows/install/),
   [Mac](https://docs.docker.com/docker-for-mac/install/), and
   [Ubuntu](https://docs.docker.com/install/linux/docker-ce/ubuntu/). Install
   the 'Stable channel' version of 'Docker CE'.
1. Once Docker is installed, go into the project directory and run
   `./build-docker-container.sh`
    * This will use the Dockerfile in this directory to make an image
      containing all the tools we need, like NodeJS, NPM, Yarn, Git, and the
      Heroku command-line tool. It will then run a setup script that installs
      the frontend and backend dependencies, and logs you into your new Heroku
      account.
1. Enter your Heroku credentials when prompted.


#### Method #2: Direct Installation

Instead of running everything in a Docker container, you can install all of the
necessary software directly onto your computer.

1. The main piece of software you'll need is NodeJS, you can find installers
   for all major platforms [here](https://nodejs.org/en/download/). NodeJS
   comes with [NPM](https://www.npmjs.com/), the system for managing packages
   and libraries in JavaScript.
1. Now you'll need to open up a terminal, navigate to the downloaded project
   code, and run the following commands:

   In Bash (Mac/Linux):
    ```bash
    # Install Yarn, which we use to manage our dependencies, and the Heroku
    # CLI, which we'll use to deploy our project.
    npm install --global yarn heroku-cli

    # Install our backend dependencies.
    yarn

    # Go into our frontend directory.
    cd frontend
    # Install our frontend dependencies.
    npm install

    # Go back to the project directory.
    cd ..
    # Log in to Heroku.
    heroku login
    ```

    In Windows Shell:
    ```bat
    :: Install Yarn, which we use to manage our dependencies, and the Heroku
    :: CLI, which we'll use to deploy our project.
    npm install --global yarn heroku-cli

    :: Install our backend dependencies.
    yarn

    :: Go into our frontend directory.
    cd frontend
    :: Install our frontend dependencies.
    npm install

    :: Go back to the project directory.
    cd..
    :: Log in to Heroku.
    heroku login
    ```

### Running the Project

At this point, your environment should be all set up and ready to go. Now we'll
try to run the project and see if your setup is working.

1. Copy the `dev.env.example` file to `dev.env`, and replace
   `INSERT_YOUR_TOKEN_HERE` with your "Client access token" that you got from
   DialogFlow.
1. Open a terminal in the project directory.
    * If you're using Docker, run: `./docker-run-server.sh`
    * If not, run: `yarn exec nodemon index.js`
    * This will run the backend server, which handles talking to DialogFlow for
      getting chatbot responses. It also handles the real-time communication
      with the browser via WebSockets. Additionally, it will restart the server
      every time it detects changes to server files.
1. Open another terminal in the project directory.
    * If you're using Docker, run `./docker-build-frontend-dev.sh`
    * If not, run `yarn exec ng build -- --watch`
    * This will build static HTML, CSS, and JavaScript files from the `src/`
      directory, and place them into the `dist/` directory. It will also watch
      for changes to the files and rebuild the files when it detects changes.
1. Once both commands are running, navigate to http://localhost:8080 in your
   web browser. You should see a greeting from SampleBot. Say "Hi!" and see how
   he responds.

### Deploying the Project

This isn't part of the pre-work, but you're welcome to do it beforehand if you
like!

1. To deploy the project, we first need to create a project with Heroku. If you
   followed the Docker instructions above, run `./docker-shell.sh` from within
   the project to get access to the Heroku command-line tool.
1. Once in the container (you should see `/project $`), run `heroku create`.
   This will create a new project on Heroku to deploy your application to. Make
   note of the project name and URL.
1. Exit the container, then go into the `frontend/src/environments` directory.
   Copy the `environment.prod.ts.example` file to `environment.prod.ts`, and replace
   `YOUR_HEROKU_ENDPOINT` with the URL you got from `heroku create`.
    * This is how we point the frontend to our application running on Heroku.
1. Copy `dev.env` to `prod.env`, and change line that says
   `NODE_ENV=development` to `NODE_ENV=production`.
    * This serves the role of telling the application that it is running on
      Heroku, and that it should change its behavior.
1.  Run `./docker-deploy-heroku.sh`. This will build your application for
    production, push it to Heroku, and then clean up the artifacts.
