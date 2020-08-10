  
FROM node:12-slim

LABEL version="1.0.0"
LABEL repository="https://github.com/SuprGames/suprgames.serverless-github-action"
LABEL homepage="https://github.com/SuprGames/suprgames.serverless-github-action"
LABEL maintainer="Diego Marzo"

LABEL "com.github.actions.name"="Serverless 1.77 + Node 12"
LABEL "com.github.actions.description"="This actions wraps the latest version of Serverless Framework with Node 12"
LABEL "com.github.actions.icon"="zap"
LABEL "com.github.actions.color"="orange"

RUN npm i -g serverless@1.77
ENTRYPOINT ["serverless"]
