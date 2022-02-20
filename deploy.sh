#!/usr/bin/env bash

# Usage: shoarma [-h] [-q] [-v] [-f] [-x] [-l <log_dir>] [-t <tmp_dir>] [-c <country>] [-b <root_dir>] [-i <img_relative>] [-m <md_relative>] [-t <template>] <action> <source?>
# Flags, options and parameters:
#    -x|--clean       : [flag] remove existing .md files from output folder [default: off]
#    -l|--log_dir <?> : [option] folder for log files   [default: /Users/pforret/log/shoarma]
#    -t|--tmp_dir <?> : [option] folder for temp files  [default: /tmp/shoarma]
#    -c|--country <?> : [option] default country  [default: belgium]
#    -b|--root_dir <?>: [option] root folder of output website  [default: .]
#    -i|--img_relative <?>: [option] filename for output img files  [default: /images/{img_year}/{img_base}]
#    -m|--md_relative <?>: [option] filename for output MD files  [default: /_posts/{img_year}/{img_date}-{img_slug}-{img_hash}.md]
#    -t|--template <?>: [option] markdown template for posts/pages  [default: /Users/pforret/.basher/cellar/packages/pforret/shoarma/templates/post.md]
#    <action>         : [parameter] action to perform: generate
#    <source>         : [parameter] input folder with images (optional)

git add wp-content/gallery

shoarma -X -T wp-content/post.md generate wp-content/gallery
git add _posts
git add images

jekyll_taxonomy -c generate category
git add category

jekyll_taxonomy -w -c generate tag
git add tag

setver push
setver new patch