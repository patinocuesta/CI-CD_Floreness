FROM nginx
ADD jenkins_pipe_docker/ /usr/share/nginx/html/
EXPOSE 5000/TCP
