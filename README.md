# DMOTE in Docker

## Build
```
docker build -t docker-dmote .
```

## Run
```
docker run -v $HOME/src/dactyl-keyboard:/opt -e UID=`id -u` -e GID=`id -g` --rm -it docker-dmote
```
See the [DMOTE Execution
guide](https://github.com/veikman/dactyl-keyboard/blob/master/doc/execution.md) for commands.  Default is a BASH shell inside the container.
