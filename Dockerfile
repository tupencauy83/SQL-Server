FROM mcr.microsoft.com/mssql/server:2022-latest

USER root

RUN mkdir -p /.system && \
    chown -R mssql:root /.system && \
    chmod -R 775 /.system

RUN mkdir -p /usr/config

COPY init.sql /usr/config/init.sql
COPY entrypoint.sh /usr/config/entrypoint.sh

RUN chmod +x /usr/config/entrypoint.sh

USER mssql

CMD ["/bin/bash", "/usr/config/entrypoint.sh"]
