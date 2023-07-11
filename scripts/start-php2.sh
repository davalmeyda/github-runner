#!/bin/bash
/home/docker/actions-runner/_work/_actions/shivammathur/setup-php/v2/src/scripts/run.sh
sudo service apache2 restart
cd /home/docker/actions-runner/_work/ojoceleste.com/ojoceleste.com/ 
pm2 startOrRestart ecosystem.config.js
pm2 save
/home/docker/actions-runner/run.sh & wait $!