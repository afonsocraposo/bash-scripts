#!/bin/python

import sys
import praw
import wget
import os

if __name__ == "__main__":

    if len(sys.argv) > 1:
        index = int(sys.argv[1])
    else:
        index = 0

    reddit = praw.Reddit("bot1")

    subreddit = reddit.subreddit("wallpaper")

    image_url = ""
    i = 0
    for submission in subreddit.top("day", limit=index+1):
        if i == index:
            if "gallery" in submission.url:
                for item in sorted(
                    submission.gallery_data["items"], key=lambda x: x["id"]
                ):
                    media_id = item["media_id"]
                    meta = submission.media_metadata[media_id]
                    if meta["e"] == "Image":
                        image_url = meta["s"]["u"]
                        break
            else:
                image_url = submission.url
        i += 1

    if image_url != "":
        os.system("rm /tmp/background.png 2> /dev/null")
        wget.download(image_url, out="/tmp/background.png")
        exit(0)
    else:
        exit(-1)
