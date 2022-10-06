#!/bin/bash
cd /home/docker/actions-runner/_work/proyecto-san-german-backend/proyecto-san-german-backend/ 
pm2 startOrRestart ecosystem.config.js
pm2 save
/home/docker/actions-runner/run.sh & wait $!