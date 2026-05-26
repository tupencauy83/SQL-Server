#!/bin/bash

/opt/mssql/bin/sqlservr &

echo "Esperando SQL Server..."

for i in {1..60}
do
    /opt/mssql-tools18/bin/sqlcmd \
        -S localhost \
        -U sa \
        -P "$MSSQL_SA_PASSWORD" \
        -No \
        -Q "SELECT 1" > /dev/null 2>&1

    if [ $? -eq 0 ]
    then
        echo "SQL Server iniciado"
        break
    fi

    sleep 2
done

echo "Ejecutando init.sql..."

/opt/mssql-tools18/bin/sqlcmd \
    -S localhost \
    -U sa \
    -P "$MSSQL_SA_PASSWORD" \
    -No \
    -i /usr/config/init.sql

wait
