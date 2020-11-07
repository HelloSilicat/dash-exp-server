name="Micro"

#ffmpeg -i $name".mp4" -s 3840x2160 -c:v libx264 -keyint_min 48 -g 48 -sc_threshold 0 -an $name"3840x2160.mp4" -threads 64
#ffmpeg -i $name".mp4" -s 2560x1440 -c:v libx264 -keyint_min 48 -g 48 -sc_threshold 0 -an $name"2560x1440.mp4" -threads 32
#ffmpeg -i $name".mp4" -s 1920x1080 -c:v libx264 -keyint_min 48 -g 48 -sc_threshold 0 -an $name"1920x1080.mp4" -threads 32
#ffmpeg -i $name".mp4" -s 1280x720  -c:v libx264 -keyint_min 48 -g 48 -sc_threshold 0 -an $name"1280x720.mp4"  -threads 32
#ffmpeg -i $name".mp4" -s 640x360   -c:v libx264 -keyint_min 48 -g 48 -sc_threshold 0 -an $name"640x360.mp4"   -threads 32

#./transform_cbr.sh $name".mp4" 27000K 3840x2160 "3840x2160_T.mp4"
#./transform_cbr.sh $name".mp4" 12000K 2560:1440 "2560x1440_T.mp4"
#./transform_cbr.sh $name".mp4" 7200K  1920:1080 "1920x1080_T.mp4"
#./transform_cbr.sh $name".mp4" 3600K  1280:720  "1280x720_T.mp4"
#./transform_cbr.sh $name".mp4" 1200K  640:360   "640x360_T.mp4"

mp4fragment "3840x2160_T.mp4" $name"3840x2160_frag.mp4" --fragment-duration 1602
mp4fragment "2560x1440_T.mp4" $name"2560x1440_frag.mp4" --fragment-duration 1602
mp4fragment "1920x1080_T.mp4" $name"1920x1080_frag.mp4" --fragment-duration 1602
mp4fragment "1280x720_T.mp4"  $name"1280x720_frag.mp4"  --fragment-duration 1602
mp4fragment "640x360_T.mp4"   $name"640x360_frag.mp4"   --fragment-duration 1602

mp4dash $name"3840x2160_frag.mp4" $name"2560x1440_frag.mp4" $name"1920x1080_frag.mp4" $name"1280x720_frag.mp4" $name"640x360_frag.mp4"

rm -rf ./*_frag.mp4
rm -rf ./*.log*

