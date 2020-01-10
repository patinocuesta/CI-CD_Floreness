FROM nginx
ADD ./ /usr/share/nginx/html/
EXPOSE 5000/TCP
