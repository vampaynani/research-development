---
layout: post
title:  "Make a multi resolution .ico file from ubuntu with image magick"
date:   2019-06-25 00:00:00 -0600
categories: web development webdev ubuntu favicon ico imagemagick
---
## 1. Install Image Magick in Ubuntu.
```bash
sudo apt install gcc imagemagick
```

## 2. Using your icon design create the source files.
Remember that each size should be a square and you need to make sure to have all this sizes so any device can render it correctly, the files could be .png, .jpg or .bmp.

* icon-512.png
* icon-256.png
* icon-128.png
* icon-64.png
* icon-32.png

Be careful and save all of the icons in the same directory.

## 3. Use Image Magick to generate the favicon.
Move in to the icons directory on your terminal.
```bash
cd /dir/to/my/icons/directory
```
Then run the image magick command to create the favicon based on all of the given icons.
```
convert icon-32.png icon-64.png icon-128.png icon-256.png icon-512.png favicon.ico
```

And there you are, multi resolution favicon ready to go.