FROM nginx:alpine
WORKDIR /home/ubuntu/docker
COPY jenkins_pipe_docker/ /usr/share/nginx/html/
