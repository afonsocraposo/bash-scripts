#!/bin/bash

# clean old screenshots
find $1 -mtime +$2 -type f -delete
