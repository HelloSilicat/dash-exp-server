name="Micro"

ffmpeg -i $name".mp4" -s 3840x2160 -c:v libx264 -keyint_min 48 -g 48 -sc_threshold 0 -an $name"3840x2160.mp4" -threads 32
ffmpeg -i $name".mp4" -s 2560x1440 -c:v libx264 -keyint_min 48 -g 48 -sc_threshold 0 -an $name"2560x1440.mp4" -threads 32
ffmpeg -i $name".mp4" -s 1920x1080 -c:v libx264 -keyint_min 48 -g 48 -sc_threshold 0 -an $name"1920x1080.mp4" -threads 32
ffmpeg -i $name".mp4" -s 1280x720  -c:v libx264 -keyint_min 48 -g 48 -sc_threshold 0 -an $name"1280x720.mp4"  -threads 32
ffmpeg -i $name".mp4" -s 640x360   -c:v libx264 -keyint_min 48 -g 48 -sc_threshold 0 -an $name"640x360.mp4"   -threads 32

mp4fragment $name"3840x2160.mp4" $name"3840x2160_frag.mp4"
mp4fragment $name"2560x1440.mp4" $name"2560x1440_frag.mp4"
mp4fragment $name"1920x1080.mp4" $name"1920x1080_frag.mp4"
mp4fragment $name"1280x720.mp4"  $name"1280x720_frag.mp4"
mp4fragment $name"640x360.mp4" $name"640x360_frag.mp4"

mp4dash $name"3840x2160_frag.mp4" $name"2560x1440_frag.mp4" $name"1920x1080_frag.mp4" $name"1280x720_frag.mp4" $name"640x360_frag.mp4"

rm -rf ./*_frag.mp4

