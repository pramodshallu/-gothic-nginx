FROM docker.io/library/nginx:latest
COPY ./html/index.html /usr/share/nginx/html
EXPOSE 8081
CMD ["nginx", "-g", "daemon off;"]
