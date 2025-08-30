#!/bin/sh

# Get current song and status
status=$(mpc status | awk 'NR==2 {print $1}' | tr -d '[]')
song=$(mpc current)

# Format output with icons based on status
case "$status" in
  playing) icon="" ;;  # Play icon
  paused)  icon="" ;;  # Pause icon
  *)       icon="" ;;   # No icon if stopped/unknown
esac

# Truncate long song names
max_len=40
if [ -n "$song" ]; then
  output="${icon} ${song}"
  if [ ${#output} -gt $max_len ]; then
    output="${output:0:$max_len}..."
  fi
  echo "$output"
else
  echo "Memento Mori"
fi
