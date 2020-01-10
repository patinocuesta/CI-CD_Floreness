FROM nginx
WORKDIR /home/ubuntu/docker
COPY /jenkins_pipe_docker/ /usr/share/nginx/html/
EXPOSE 5000/TCP
