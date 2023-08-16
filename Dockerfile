ARG APK_INSTALL_OPTIONS="--no-cache"

FROM node:lts-alpine

ARG APK_PACKAGES="git"

WORKDIR /source

RUN echo "**** install binary packages ****" && \
    apk add $APK_INSTALL_OPTIONS $APK_PACKAGES

# Get upstream
RUN git clone https://github.com/Hypfer/ICantBelieveItsNotValetudo /source

WORKDIR /app

COPY package.json /app
COPY package-lock.json /app

RUN npm ci
COPY . /app

CMD ["npm", "start"]
