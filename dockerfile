FROM nginx:alpine
WORKDIR /home/ubuntu/docker/jenkins_pipe_docker/
COPY /usr/share/nginx/html/
