# mpv-config-video-image-viewer
Config, .desktop files and other modifications in order to use mpv as a video and image viewer.

Keep in mind these are my own configs, tailored to suit my needs and hardware. Your needs and hardware are likely different. So change the code accordingly.
Also, these settings are written with Linux in mind. Some changes will be required to use in Windows/Mac.

Copy the mpvi and mpv to inside ~/.config. mpv is for mpv as video player. mpvi for mpv as image viewer.

The function mpvmusic in .bash_ aliases is to play song/music from youtube. Only audio and no video. alias mpvi is for mpvi from the terminal. .desktop file for usage from inside filemanager/other apps.

mpvi can be called from terminal to play either a directory containing multiple images as a slideshow or a single image.
Playing a single image will automatically add entries to playlist using autoload.lua. status-line.lua shows filename and image dimentions. height-profiles-img.lua loads profiles set in mpv.conf based on image height.

FSRCNNX is used to upscale luma by 2X, Krigbilateral to upscale chroma plane by 2X and SSimDownscaler to produce good downscaled images.

Note: The FSRCNNX_x2_8-0-4-1.glsl file has been modified to enable upscaling if image height/width is less than or equal to 5/3 times the display height/width.
Reason behind this is I want to force FSRCNNX even when image height is slightly larger than display height. I personally find it increases quality. Some, I'm certain, would disagree.
But since image quality is highly subjective, you are welcome to your opinion. FSRCNNX_x2_16-0-4-1.glsl is beyond the limited power of my GPU. Use it if you own  a good GPU and Hi-Res Monitor/TV. FSRCNNX_x2_16-0-4-1.glsl has also been modified to force upscaling for images with height/width less than display height/width divided by 1.005. Change it to your own liking if you want.

Keep in mind the human eye is far less sensitive to choma/color than luma. To quote wikipedia, human eye has upto 20 times as many rod cells as cone. So a decent chroma upscaler and a great luma upscaler should be the priority when hardware is limited.

In mpv as video player, I have 2 lua scripts. height-profiles.lua loads conditional profiles based on video height. UD = 2K/4K+ videos. FHD = height < 1440 and => 1080. HD = < 1080 and >= 720 and finally, SD = all else meaning < 720. Change the lua file to suit your needs. Profiles are defined in mpv.conf. live-filters.lua can insert arbitrary ffmpeg filters on the fly. Use the key '`' to call it. In the little line that appears at the bottom of the scrren, type in the ffmpeg filter of your choice ( without adding vf or lavfi ).

The input.conf has 2 lines for mpvi. 2nd line to copy the current image to ~/Pictures. Change /home/username/Pictures to reflect your username. A general solution would've been preferable but ~/Pictures didn't work. Full pathname is required ($USER) didn't work either. 1st line deletes the currently playing file. Change or add actions if you like. Follow the syntax.

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
