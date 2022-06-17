#!/bin/python

import sys
import requests
import bibtexparser
from scidownl import scihub_download
import os


def download(doi):
    r = requests.get(
        doi, headers={"Accept": "text/bibliography; style=bibtex"}, allow_redirects=True
    )
    bib_database = bibtexparser.loads(r.text)
    entry = bib_database.entries[0]
    author = entry["author"]
    ID = f'{author[: author.index(",")]}{entry["year"]}'
    filename = f'{ID} - {entry["title"]}'
    filename_bib = filename.replace(":", "\\:")
    bib_database.entries[0]["ID"] = ID

    if "OUT" in os.environ:
        out_dir = os.environ["OUT"]
        out = f"{out_dir}/{filename}.pdf"
    else:
        out_dir = None
        out = f"./{filename}.pdf"

    try:
        scihub_download(doi, paper_type="doi", out=out)
        bib_database.entries[0]["file"] = f":{filename_bib}.pdf:PDF"
    except:
        print("Failed to download paper")

    if out_dir and "phd" in out_dir:
        with open(f"{out_dir}/references.bib", "a") as f:
            f.write(f"\n{bibtexparser.dumps(bib_database)}\n")


if __name__ == "__main__":
    if len(sys.argv) > 1:
        doi = sys.argv[1]
        download(doi)
    else:
        print(
            """
 ____   ____ ___    _    ____  ____  
/ ___| / ___|_ _|  / \  |  _ \|  _ \ 
\___ \| |    | |  / _ \ | | | | | | |
 ___) | |___ | | / ___ \| |_| | |_| |
|____/ \____|___/_/   \_\____/|____/ 
                                     
"""
        )
        while True:
            try:
                doi = input("DOI: ")
                download(doi.strip())
            except KeyboardInterrupt:
                exit(0)
