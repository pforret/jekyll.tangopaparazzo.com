#!/usr/bin/env bash

shoarma -x -i wp-content/gallery -o _posts generate
jekyll_taxonomy -c generate category
jekyll_taxonomy -c generate tag
setver push
setver new patch