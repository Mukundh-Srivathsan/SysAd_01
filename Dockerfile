FROM ubuntu:latest

RUN mkdir /home/Jay_Jay/docker_server

WORKDIR /home/Jay_Jay/docker.server

COPY /home/Jay_Jay/server .

CMD ["main.bash", "start"]

CMD ["genUser.bash", "start"]


CMD ["permit.bash", "start"]


CMD ["schedule.bash", "start"]


CMD ["attendance.bash", "start"]