# Dockerized SQL-Server 2019
Mounts .mdf databases in a dockerized sql-server instance.

## Run it
### 1 - Place .mdf and .ldf files in Data directory.
Important notes:
  - **database name will be based on .mdf file name**.
  - **exepected log filename to follow *mdf_file_name*_log.ldf**

example:

``` bash
Data
  | - foo_log.ldf
  | - foo.mdf
```

will generate a database named **Foo**

## Dockerfile
The original article explained very well how to get up and running with a Dockerfile build, if you intend to go with that route I recomend you check them out.

## Dockercompose
### 2 - Build image and bring containers up.

``` bash
$ docker-compose up
```

### 3 - Run the attach script.

*Wait for server to be brought up*
Open another shell and run:
``` bash
$ make attach
```

## Based on resources from the following article:
[Run your SQL Server MDF file inside a linux Docker Container](https://www.mobilize.net/blog/run-your-sql-server-mdf-file-inside-a-linux-docker-container)
The core of this repository was taken from the article. Changes consists in generalizing attach_db script and wrapping Dockerfile in a compose file.