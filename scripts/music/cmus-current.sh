#!/bin/mksh
# Get current artist/song

artist="$(cmus-remote -Q | awk -F 'tag artist ' '/tag artist / {printf $2}')"
song="$(cmus-remote -Q | awk -F 'tag title ' '/tag title / {printf $2}')"

echo "$artist - $song"