FROM mariadb:10.5

ENV MYSQL_ROOT_PASSWORD=root
ENV MYSQL_DATABASE=pratice_board
ENV MYSQL_USER=user
ENV MYSQL_PASSWORD=userpassword

COPY createDB.sql /docker-entrypoint-initdb.d/createDB.sql

EXPOSE 3306

HEALTHCHECK --interval=30s --timeout=10s --start-period=30s --retries=3 \
  CMD mysqladmin ping -h localhost

VOLUME /var/lib/mysql
