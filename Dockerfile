FROM mcr.microsoft.com/mssql/server:2022-latest

USER root

RUN mkdir -p /var/opt/mssql/.system \
 && mkdir -p /var/opt/mssql/log \
 && mkdir -p /var/opt/mssql/data \
 && chown -R mssql:mssql /var/opt/mssql

USER mssql
