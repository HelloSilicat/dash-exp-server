#bitrate="$(awk "BEGIN {print int($2 * 1024 * 1024 * 8 / $(ffprobe \
#    -v error \
#    -show_entries format=duration \
#    -of default=noprint_wrappers=1:nokey=1 \
#    "$1" \
#) / 1000)}")k"
#echo $bitrate
#1. filename 2. bitrate 3. resolution 4.id
ffmpeg \
    -y \
    -i "$1" \
    -c:v libx264 \
    -preset medium \
    -b:v "$2" \
    -pass 1 \
    -an \
    -f mp4 \
    -vf scale=$3 \
    -muxrate $2 \
    -keyint_min 48 \
    -g 48 \
    -sc_threshold 0 \
    -threads 96 \
    $4 \
&& \
ffmpeg \
    -i "$1" \
    -c:v libx264 \
    -preset medium \
    -b:v "$2" \
    -pass 2 \
    -an \
    -f mp4 \
    -vf scale=$3 \
    -keyint_min 48 \
    -g 48 \
    -sc_threshold 0 \
    -threads 96 \
    -muxrate $2 \
