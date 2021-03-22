#!/bin/bash

# clean old screenshots
find $1 -daystart -mtime +$2 -exec rm -r {} \;
