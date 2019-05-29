FROM node

# system update
RUN apt-get update

# hubot install
RUN npm install -g yo generator-hubot

# execute user
RUN useradd my-bot
ENV HOME /home/my-bot
WORKDIR $HOME
RUN chown my-bot $HOME

# set up hubot
USER my-bot
RUN yo hubot --owner="kazuy" --name="my-bot" --description="" --adapter=slack --defaults

# expose ports
EXPOSE 8081

# copy
COPY external-scripts.json $HOME

# execute hubot
CMD bin/hubot --adapter slack

