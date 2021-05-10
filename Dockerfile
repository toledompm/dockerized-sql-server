FROM mcr.microsoft.com/mssql/server:2019-latest

USER root
WORKDIR /src

COPY attach_db.sh /db_files/
COPY ./Data/*.mdf /db_files/
COPY ./Data/*.ldf /db_files/

RUN chmod +x /db_files/attach_db.sh
RUN (/opt/mssql/bin/sqlservr --accept-eula & ) | grep -q "Service Broker manager has started"

ENTRYPOINT /db_files/attach_db.sh & /opt/mssql/bin/sqlservr
