#!/bin/bash
SLEEPTIME=60
echo "Sleeping $SLEEPTIME seconds for MySQL service initialization";
sleep $SLEEPTIME;

echo 'Starting web services....';

/entrypoint.sh apache2-foreground;
