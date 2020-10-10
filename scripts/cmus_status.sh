#!/bin/bash

if ps -C cmus > /dev/null; then
    ARTIST=$(cmus-remote -Q | grep -a '^tag artistsort' | awk '{gsub("tag artistsort ", "");print}'  | xargs -0)
    TRACK=$(cmus-remote -Q | grep -a '^tag title' | awk '{gsub("tag title ", "");print}' | xargs -0)
    POSITION=$(cmus-remote -Q | grep -a '^position' | awk '{gsub("position ", "");print}' | xargs -0)
    DURATION=$(cmus-remote -Q | grep -a '^duration' | awk '{gsub("duration ", "");print}' | xargs -0)
    STATUS=$(cmus-remote -Q | grep -a '^status' | awk '{gsub("status ", "");print}' | xargs -0)
    SHUFFLE=$(cmus-remote -Q | grep -a '^set shuffle' | awk '{gsub("set shuffle ", "");print}' | xargs -0)


    if [ "$DURATION" != "" ]; then

      if [ "$STATUS" = "playing" ]; then
        STATUS="▶ "
      else
        STATUS="⏸"
      fi

      if [ "$SHUFFLE" = "true" ]; then
        SHUFFLE=" 🔀"
      else
        SHUFFLE=""
      fi
    
      printf "%s%s %s - %s " "$STATUS" "$ARTIST" "$TRACK"
      printf "%0d:%02d/" $((POSITION%3600/60)) $((POSITION%60))
      printf "%0d:%02d" $((DURATION%3600/60)) $((DURATION%60))

      printf "%s%s\n" "$SHUFFLE"
    else
      printf " "
    fi
else
    printf " "
fi


