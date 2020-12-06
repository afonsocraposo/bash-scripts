#!/bin/bash

# clean old screenshots
find $1 -mtime +15 -type f -delete
