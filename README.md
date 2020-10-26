# DMOTE in Docker

Build environment for
[DMOTE](https://github.com/veikman/dactyl-keyboard) in a Docker container.

## Build
```
DOCKER_BUILDKIT=1 docker build -t dmote .
```
To build with OpenSCAD
```
DOCKER_BUILDKIT=1 docker build -t dmote:openscad --build-arg WITH=openscad .
```
If you use the Classic builder you'll get OpenSCAD whether you want it or not
:)

## Run
```
cd $HOME/src
git clone https://github.com/veikman/dactyl-keyboard.git
docker run -v $HOME/src/dactyl-keyboard:/opt -e UID=`id -u` -e GID=`id -g` --rm -it deekue/dmote make
```
See the [DMOTE Execution
guide](https://github.com/veikman/dactyl-keyboard/blob/master/doc/execution.md) for commands.  Default is a BASH shell inside the container.
