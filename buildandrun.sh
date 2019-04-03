#!/bin/bash

export USER_ID=`id -u ${USER}` && export GROUP_ID=`id -g ${USER}` && docker-compose build --no-cache && docker-run -d

