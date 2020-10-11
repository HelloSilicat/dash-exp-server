# Preparation

- update apt mirror

- install `nginx`

  ```shell
  sudo apt-get install nginx
  ```

- allow firewall

  ```shell
  sudo ufw allow 'Nginx HTTP'
  ```

- install`ffmpeg`

  ```shell
  sudo apt-get install ffmpeg
  ```

- install `bento4`
  - cmake > 3.10

- Video Split

  ```shell
  ffmpeg -i elephants_dream_1080p24.y4m -s 1920x1080 -c:v libx264 -keyint_min 48 -g 48 -sc_threshold 0 -an ED1920x1080.mp4
  ffmpeg -i elephants_dream_1080p24.y4m -s 1280x720 -c:v libx264 -keyint_min 48 -g 48 -sc_threshold 0 -an ED1280x720.mp4
  ffmpeg -i elephants_dream_1080p24.y4m -s 896x504 -c:v libx264 -keyint_min 48 -g 48 -sc_threshold 0 -an ED896x504.mp4
  ffmpeg -i elephants_dream_1080p24.y4m -s 640x360 -c:v libx264 -keyint_min 48 -g 48 -sc_threshold 0 -an ED640x360.mp4
  ffmpeg -i elephants_dream_1080p24.y4m -s 256x144 -c:v libx264 -keyint_min 48 -g 48 -sc_threshold 0 -an ED256x144.mp4
  ```

- dash output : `dash xxx.mp4 xxx.mp4 ....`

- nginx web server

  ```shell	
  sudo nginx -t -p ./nginx/ -c nginx.conf
  ```