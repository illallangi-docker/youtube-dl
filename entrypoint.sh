#!/usr/bin/env sh

UMASK=$(which umask)
UMASK_SET=${UMASK_SET:-022}

if [[ ! -x $UMASK ]]; then
  echo "umask binary not found"
  exit 1
fi

echo $UMASK "$UMASK_SET"
$UMASK "$UMASK_SET"

YOUTUBE_ARCHIVE=$(which youtube-archive)
if [[ ! -x $YOUTUBE_ARCHIVE ]]; then
  echo "youtube-archive binary not found"
  exit 1
fi

echo ${*:-${YOUTUBE_ARCHIVE}}
exec ${*:-${YOUTUBE_ARCHIVE}}

#  -i \
#  --download-archive /config/$(echo ${1} | sha256sum  | awk '{ print $1 }') \
#  ${1} \
#  -f bestvideo+bestaudio \
#  --merge-output-format mkv \
#  --add-metadata \
#  --embed-subs \
#  --write-thumbnail \
#  --all-subs \
#  -o "/data/%%(uploader)s/%%(upload_date)s-%%(title)s-%%(id)s.%%(ext)s" 