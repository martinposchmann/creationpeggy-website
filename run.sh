#!/bin/bash
if [ "$1" == "-d" ]; then
    echo "using docker"
    docker run -v $(pwd):/build -p 4000:4000 -it --rm -e RUBYOPT=-W0 jekyll/jekyll:minimal jekyll serve -s /build/src -d /build/build/_site
else
    jekyll serve -s src -d build/_site
fi