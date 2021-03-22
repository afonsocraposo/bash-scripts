#!/bin/python

import praw
import wget
import os

reddit = praw.Reddit("bot1")

subreddit = reddit.subreddit("wallpaper")

image_url = ""
for submission in subreddit.top("day", limit=1):
    image_url = submission.url

os.system("rm /tmp/background.png 2> /dev/null")
wget.download(image_url, out="/tmp/background.png")
os.system("wal -i /tmp/background.png --saturate 0.7 -b '#000000' -q")
# os.system("feh --bg-fill /tmp/background.png")
