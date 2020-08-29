FROM node:10.11.0-alpine
ENV NODE_ENV=production

LABEL "com.github.actions.name"="Release Notifier Action"
LABEL "com.github.actions.description"="Notifies developers on release with changelog via e-mail"
LABEL "com.github.actions.icon"="send"
LABEL "com.github.actions.color"="yellow"
LABEL "repository"="https://github.com/addie/email-release-notification"
LABEL "homepage"="http://github.com/addie"
LABEL "maintainer"="addie.bendory@uber.com"

WORKDIR /opt/notify
COPY package.json package-lock.json ./
COPY src ./src
RUN npm install --production

ENTRYPOINT ["node", "/opt/notify/src/notify.js"]
