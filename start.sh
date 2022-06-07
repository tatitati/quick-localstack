#!/bin/bash

#requirements:
#pip install awscli
#pip install awscli-local

# while we run the server and see the output, which is blocking the console, we open a new pane in iterm where we run some other commands, so we
# dont need to wait for the server to stop

source ./cli/virtualenv-activate.sh

docker pull mysql:latest
docker pull localstack/localstack-full

osascript \
-e 'tell application "iTerm" to activate' \
-e 'tell application "System Events" to tell process "iTerm" to keystroke "d" using command down' \
-e 'tell application "System Events" to tell process "iTerm" to keystroke "sleep 4"' \
-e 'tell application "System Events" to tell process "iTerm" to key code 52' \
-e 'tell application "System Events" to tell process "iTerm" to keystroke "awslocal cloudformation deploy --stack-name mystack --template-file local-cf.yml"' \
-e 'tell application "System Events" to tell process "iTerm" to key code 52' \
-e 'tell application "System Events" to tell process "iTerm" to keystroke "open http://127.0.0.1:8000/docs"' \
-e 'tell application "System Events" to tell process "iTerm" to key code 52' \
-e 'tell application "System Events" to tell process "iTerm" to keystroke "exit"' \
-e 'tell application "System Events" to tell process "iTerm" to key code 52'

docker-compose up --build
