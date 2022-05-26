#!/bin/bash

# clean folder
find $1 -maxdepth 1 -daystart -mtime +$2 -exec gio trash {} \;
