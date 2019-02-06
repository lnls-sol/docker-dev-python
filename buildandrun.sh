#!/bin/bash

export USER_ID=`id -u ${USER}` && export GROUP_ID=`id -g ${USER}` && docker-compose up -d --build

