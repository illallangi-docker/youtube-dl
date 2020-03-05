#!/usr/bin/env sh

UMASK=$(which umask)
UMASK_SET=${UMASK_SET:-022}

if [[ ! -x $UMASK ]]; then
  echo "umask binary not found"
  exit 1
fi

echo $UMASK "$UMASK_SET"
$UMASK "$UMASK_SET"

YOUTUBE_DL=$(which youtube-dl)
if [[ ! -x $YOUTUBE_DL ]]; then
  echo "youtube-dl binary not found"
  exit 1
fi

echo ${*:-${YOUTUBE_DL}}
exec ${*:-${YOUTUBE_DL}}

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