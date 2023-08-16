ARG APK_INSTALL_OPTIONS="--no-cache"

FROM node:lts-alpine

ARG APK_PACKAGES="git"

RUN echo "**** install binary packages ****" && \
    apk add $APK_INSTALL_OPTIONS $APK_PACKAGES

# Get upstream
RUN git clone https://github.com/Hypfer/ICantBelieveItsNotValetudo /source \
    && cd /source

WORKDIR /source

RUN npm ci
COPY . /app

WORKDIR /app

CMD ["npm", "start"]
