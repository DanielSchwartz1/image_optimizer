# image_optimizer
Optimize all images for your self hosted blog (e.g. on Wordpress in folder /wp-content/uploads/)

There are 2 scripts inside the repo. Both with the same functions, but one is checking if the image was already touched before and won't do it twice.
Please note that this script will override the original image.
I always keep a backup of my images in a different place, so I avoid that my images are saved twice.

The script is using the 2 tools:
- pngquant
- jpegoptim

You can install both via "yum install $toolname"

The script searches for all .png, .jpg and .jpeg files in a folder and all subfolders (e.g. /wp-content/uploads/) and will run it through a loop to optimize the images.

The script also changes the grants back to 640 and the owner back to user:user (in the example to apache:apache).
This is needed because the 2 tools change the grants.
