#! /bin/bash

head /dev/random > data.txt
git add data.txt
git commit -m "most useful commit so far"
git push
