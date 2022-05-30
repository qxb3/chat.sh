#!/bin/bash

ls a | fzf \
  --bind "enter:execute-silent(curl -s -X POST http://localhost:8080/send -H 'Content-Type: text/plain' -d '{q}')+clear-query+preview(curl -s -X GET http://localhost:8080/fetch)" \
  --bind "ctrl-r:preview(curl -s -X GET http://localhost:8080/fetch)" \
  --preview "curl -s -X GET http://localhost:8080/fetch" \
  --preview-window=up,99% \
  --header "Press Ctrl-R to reload" \
  --reverse \
  --disabled \
  --border=rounded \
  --margin 5% \
  --prompt="Send ❯ " \
  --color="spinner:yellow,border:bright-white"
