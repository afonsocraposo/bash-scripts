#!/bin/python

import praw
import wget
import os

reddit = praw.Reddit("bot1")

subreddit = reddit.subreddit("wallpaper")

image_url = ""
for submission in subreddit.top("day", limit=1):
    if "gallery" in submission.url:
        for item in sorted(submission.gallery_data["items"], key=lambda x: x["id"]):
            media_id = item["media_id"]
            meta = submission.media_metadata[media_id]
            if meta["e"] == "Image":
                image_url = meta["s"]["u"]
                break
    else:
        image_url = submission.url

if image_url != "":
    os.system("rm /tmp/background.png 2> /dev/null")
    wget.download(image_url, out="/tmp/background.png")
    os.system("rm /home/robot/.cache/wal/schemes/_tmp_background_png*")
    os.system("feh --bg-fill /tmp/background.png")
    os.system("wal -i /tmp/background.png --saturate 0.7 -b '#111111' -q")
