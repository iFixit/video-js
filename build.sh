#! /bin/sh
# Combines Source Files. In terminal, sh build.sh
# It will put a new video.js file under dist/

# Create dist directory if it doesn't already exist
mkdir -p dist

echo > dist/video.js

FILES=$(cat <<LIST
src/_begin.js
src/core.js
src/lib.js
src/json.js
src/events.js
src/component.js
src/player.js
src/tech.js
src/controls.js
src/tracks.js
tech/html5/html5.js
tech/flash/flash.js
src/setup.js
src/_end.js
LIST
)

for f in $FILES
do
  echo "Processing $f file..."
  echo "
// FILE: $f" >> dist/video.js 
  cat $f >> dist/video.js
done


# Copy Files
cp design/video-js.css dist/video-js.css
cp design/video-js.png dist/video-js.png
#cp flash/video-js.swf dist/video-js.swf

cp dist/video-js.css ./
cp dist/video.js ./

cp build/release-files/README.md dist/README.md
cp build/release-files/demo.html dist/demo.html
cp LGPLv3-LICENSE.txt dist/LGPLv3-LICENSE.txt

java -jar build/lib/yuicompressor-2.4.7.jar dist/video.js -o dist/video.min.js
java -jar build/lib/yuicompressor-2.4.7.jar dist/video-js.css -o dist/video-js.min.css
