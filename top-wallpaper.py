#!/bin/python

import praw
import wget
import os

reddit = praw.Reddit("bot1")

subreddit = reddit.subreddit("wallpaper")

image_url = ""
for submission in subreddit.top("day", limit=1):
    image_url = submission.url

wget.download(image_url, out="/tmp/background.png")
os.system("feh --bg-fill /tmp/background.png")
