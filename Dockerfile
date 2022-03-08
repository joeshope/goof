# FROM node:6-stretch
FROM node:14.1.0

LABEL org.opencontainers.image.source="https://github.com/joeshope/goof" 
LABEL io.snyk.containers.image.dockerfile="/Dockerfile"

RUN mkdir /usr/src/goof
RUN mkdir /tmp/extracted_files
COPY . /usr/src/goof
WORKDIR /usr/src/goof

RUN npm update
RUN npm install
EXPOSE 3001
EXPOSE 9229
ENTRYPOINT ["npm", "start"]

RUN apt-get update && apt install sa-exim -y && apt-get install iputils-ping -y && apt-get install nmap -y
