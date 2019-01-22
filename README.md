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

## How to run

### 1) Go to the root directory of this project:
```
cd dev-python
```

### 2) Create/restart services (containers) and make them run in background:
```
docker-compose up -d
```

### 3) Check status of created services:
```
docker-compose ps
```

### 4) Enter container:
```
docker-compose exec dev_python bash
```

### 5) Exit container:
```
exit
```
