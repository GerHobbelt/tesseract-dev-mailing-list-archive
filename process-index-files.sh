#! /bin/bash
#
# This script will go through the tesseract*.md files in this directory, which
# are the "index files" (copy-paste from browser index list view of google group, via Obsidian).
#
# These files list the (URLs of the) messages in the mailing list and that's what we're
# going to use to grab those messages each, followed by:
#
# - HTML cleanup
# - correct inter-linking so this becomes an off-line searchable set
#

# get the relevant URLs from the index files:
cat  tesseract-dev\ mailing\ list\ archive.md | tr '()<> "' '\n' | grep https | sort | uniq | grep -e 'https://groups.google.com/g/tesseract-dev/c/' > ____tmp.url.lst

cat ____tmp.url.lst | head -n 3

rm -rf __RAW

CURL=./curl.exe

$CURL --help

cat ____tmp.url.lst | head -n 300 > ____fetch.url.lst

# $CURL --output-dir __RAW/  --trace - --trace-config --trace - --trace-time  -vvv  --sanitize-with-extreme-prejudice --create-dirs --output-path-mimics-url  --dump-header curl-fetch-headers.txt -L --remote-name --remote-header-name     $( cat ____fetch.url.lst )
$CURL --output-dir __RAW/  --trace-time  -v  -H "Accept-Charset: utf-8;q=0.7,*;q=0.7" --sanitize-with-extreme-prejudice --create-dirs --output-path-mimics-url  --dump-header curl-fetch-headers.txt -L --remote-name --remote-header-name     $( cat ____fetch.url.lst ) | tee ___curl.log


# --verbose --dump-header curl-fetch-headers.txt --output-dir ~/Downloads/pdfs_test2 --create-dirs --output-path-mimics-url --sanitize-with-extreme-prejudice -L --remote-name --remote-header-name    "https://groups.google.com/g/tesseract-dev/c/oEHTjhpdRmo"
 


