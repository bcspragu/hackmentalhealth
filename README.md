# Hack Mental Health Starter Code

This repository contains the starting code for the [Hack Mental Health coding
workshop](https://www.hackmentalhealth.care/coding-workshops).

The project is based on [this chatbot
tutorial](https://medium.freecodecamp.org/what-does-it-take-to-build-a-chatbot-lets-find-out-b4d009ea8cfd),
and the [accompanying code](https://github.com/van100j/tibot). While the
original tutorial focuses on a chatbot that handles time and date questions,
this starter kit includes different modules, for example, for applying
transformations to text (ex. "Reverse the word 'fish'").

## Pre-Work

Prerequisites:
* A working Windows, Mac, or Linux computer.
* 
* (Optional, but useful) Experience with the command-line

All the software used in this tutorial:
* Git
* Yarn
* NPM
* AngularJS
* 

Different sections

* Setting up different accounts
  * DialogFlow
    1. [Sign in with Google](https://console.dialogflow.com/api-client/#/login)
    1. It may require you to do some set-up, follow the instructions.
    1. On the left-hand side, select "Create new agent", this is where we'll
       make our chatbot.
    1. Give your agent a name at the top where it says "Agent name", and leave
       all other settings at their defaults.
    1. Click "Create"
    1. Once it finishes creating, click the gear/settings icon on the left-hand
       side next to your bot's name.
    1. Look near the bottom for a section called "Client access token", and
       record that token somewhere, you'll need it later.
  * Heroku

* Installing Software
  * Two options:
    * Install Docker
    * Install npm, yarn, git, and heroku cli
  * Docker instructions:
    1. Run git clone git@github.com:bcspragu/HackMentalHealth.git
    1. cd HackMentalHealth
    1. ./build-docker-container.sh
    1. It will prompt you for your Heroku credentials, enter them
    1. Copy the 'dev.env.example' file to 'dev.env', and replace
       'INSERT_YOUR_TOKEN_HERE' with your "Client access token" from
       DialogFlow.
    1. In two separate windows, run ./docker-run-server.sh and
       ./docker-build-frontend-dev.sh
    1. In your web browser, navigate to http://localhost:8080. You should see a
       greeting from SampleBot.

* Setting up your environment
