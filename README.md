# A python development environment for Beamline Software Group (SOL)

* This version contains :
    * python 3.5
    * pyqt 5.7
    * pydm 1.6
    * py4syn
    * scan-utils

* Also includes:
    * epics 3.15
    * designer (qt5.7)

## User and folder

* This container will run using your user, and will map your home (from host) 
on ~/work

* It will map the folder .ssh

## How to run

### 1) Go to the root directory of this project:
```
cd dev-python
```

### 2) Create/restart services (containers) and make them run in background:
```
./buildandrun.sh
```

* **PS:** In case you wish to (re)build the container without using any cache, use the command bellow:

```
./buildandrun-no-cache.sh
```

It builds the container from the scratch, remaking all commands. This is an alternative when you already have built the container, but want to fully update it.

### 4) Check status of created services:
```
docker-compose ps
```

### 5) Enter container:
```
docker-compose exec dev_python bash
```

### 6) Exit container:
```
exit
```
