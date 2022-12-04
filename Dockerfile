FROM mariadb:10.5.17
ENV MYSQL_ROOT_PASSWORD test1357
ENV MYSQL_DATABASE mydb
COPY ./data /var/lib/mysql
EXPOSE 3306
ENTRYPOINT [ "mysqld", "--user=root" ]
