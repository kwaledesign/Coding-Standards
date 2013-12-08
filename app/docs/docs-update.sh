#!/bin/bash
 
echo "Updating docs..."
 
cd ../sass                              && \
cp -rf base         ../docs/sass        && \
cp -rf objects      ../docs/sass        && \
cp -rf components   ../docs/sass        && \
cp -rf layout       ../docs/sass        && \
cp -rf temp         ../docs/sass        && \
 
echo "Docs successfully updated!"       && \
 
cd ../docs                              && \
git status
  
