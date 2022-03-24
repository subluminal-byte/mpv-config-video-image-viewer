# mpv-config-video-image-viewer
Config, .desktop files and other modifications in order to use mpv as a video and image viewer.

Now you might be asking yourself this: There are plenty of great image viewers, both CLI and GUI, out there. Why would bother with this, especially when it requires a bit of work setting up? Well, feh and nomacs would be 2 good examples. Both great image viewers. I use them also. mpvi is nowhere as fast as feh and nomacs is far better looking. But if your primary goal is image quality, mpvi is superior to both. Having said that, in order to appreciate the upliftment in quality, you would ideally need a Hi-Res Monitor and/or the image you're trying to view would have to be low-res, say below 600p. In these cases, difference in quality is quite marked. Mainly becasue of the glsl shaders.

Keep in mind these are my own configs, tailored to suit my needs and hardware. Your needs and hardware are likely different. So change the code accordingly.

Also, these settings are written with Linux in mind. Some changes will be required to use in Windows/Mac. Mainly related to config file locations. For windows:
https://mpv.io/manual/master/#files-on-windows

Requirements:
mpv with lua enabled, youtube-dl installed and in PATH. For OS Linux is preferred but most of these settings can be tweaked and used in Windows/Mac. ffmpeg should also be installed. And GIMP if you want to use the custom keybindings in mpvi/input.conf. I'm sure I'm forgetting something. It'll come to me when I'm asleep.

Copy the mpvi and mpv to inside ~/.config. mpv is for mpv as video player. mpvi for mpv as image viewer.

The function mpvmusic in .bash_ aliases is to play song/music from youtube. Only audio and no video. alias mpvi is for mpvi from the terminal. .desktop file for usage from inside filemanager/other apps.

mpvi can be called from terminal to play either a directory containing multiple images as a slideshow or a single image.
Playing a single image will automatically add entries to playlist using autoload.lua. Playback starts paused. Press space to start slideshow from the current image. Or simply comment out or delete the 'pause=yes' option in mpvi/mpv.conf. status-line.lua shows filename and image dimentions.

FSRCNNX is used to upscale luma by 2X, Krigbilateral to upscale chroma plane by 2X and SSimDownscaler to produce good downscaled images.

Note: The FSRCNNX_x2_8-0-4-1.glsl file has been modified to enable upscaling if image height/width is less than or equal to 5/3 times the display height/width.
Reason behind this is I want to force FSRCNNX even when image height is slightly larger than display height. I personally find it increases quality. Some, I'm certain, would disagree.
But since image quality is highly subjective, you are welcome to your opinion. FSRCNNX_x2_16-0-4-1.glsl is beyond the limited power of my GPU. Use it if you own  a good GPU and Hi-Res Monitor/TV. FSRCNNX_x2_16-0-4-1.glsl has also been modified to force upscaling for images with height/width less than display height/width divided by 1.005. Change it to your own liking if you want.

Keep in mind the human eye is far less sensitive to choma/color than luma. To quote wikipedia, human eye has upto 20 times as many rod cells as cone. So a decent chroma upscaler and a great luma upscaler should be the priority when hardware is limited.

In mpv as video player, I have 2 lua scripts. height-profiles.lua loads conditional profiles based on video height. UD = 2K/4K+ videos. FHD = height < 1440 and => 1080. HD = < 1080 and >= 720 and finally, SD = all else meaning < 720. Change the lua file to suit your needs. Profiles are defined in mpv.conf. live-filters.lua can insert arbitrary ffmpeg filters on the fly. Use the key '`' to call it. In the little line that appears at the bottom of the scrren, type in the ffmpeg filter of your choice ( without adding vf or lavfi ).

The input.conf for mpvi has several lines. 2nd line to copy the current image to ~/Pictures. Change /home/username/Pictures to reflect your username. A general solution would've been preferable but ~/Pictures didn't work. Full pathname is required ($USER) didn't work either. 1st line deletes the currently playing file. Change or add actions if you like. Follow the syntax. 3rd line lets the user open current file in GIMP. Others are for zoom. Pretty self-explanatory.

Altough I personally don't use them, there are a few Anime4K shaders inside the shaders directory. Useful if you are viewing Anime. For Real-life content, ravu and SSimSuperRes produce better quality videos/images. FSRCNNX is even better but requires a more powerful GPU. The SSSR params.txt file contains values for parameters for different scalers (Robidoux, mitchell, catmull_rom etc). These are for scalers to be used with SSimSuperRes.glsl.

There are some video/audio filters set up in input.conf. Read the remarks. Also quite a few video filters in mpv.conf. Experiment to your heart's content.


Special thanks to:

https://github.com/occivink/mpv-image-viewer

https://github.com/hdb/mpv-live-filters

https://github.com/igv/FSRCNN-TensorFlow/releases

https://gist.github.com/igv

https://github.com/bjin/mpv-prescalers

https://github.com/bloc97/Anime4K/blob/master/GLSL_Instructions.md

And of course:

https://github.com/mpv-player/mpv

https://github.com/yt-dlp/yt-dlp


To Do List:

Figure out 2 Monitor setup where landscape orientation images play in widescreen monitor and portrait orientation images automatically switch to vertical monitor. The height-profiles lua scripts also would need adjustment then. 
