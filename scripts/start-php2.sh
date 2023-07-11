#!/bin/bash
/home/docker/actions-runner/_work/_actions/shivammathur/setup-php/v2/src/scripts/run.sh
sudo service apache2 restart
/home/docker/actions-runner/run.sh & wait $!