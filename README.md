docker-css3FontConverter
========================

[css3FontConverter] is a tool to convert TTF/OTF fonts to EOT, SVG, WOFF, WOFF2 web fonts, and generate a CSS stylesheet with CSS3 @font-face rules.

As usual there's a bunch of ridiculous dependencies so here's a docker image containing everything you need

#### How to Download ####
```sh
docker pull stealthii/css3fontconverter
```

#### How to Build ####

Fetch the code

```sh
git clone https://github.com/Stealthii/docker-css3FontConverter.git
cd docker-css3FontConverter
docker build -t stealthii/css3fontconverter .
```

#### How to convert fonts ####

Convert all `ttf` and `otf` files in the current directory (default):
```sh
docker run -it -v `pwd`:/fonts stealthii/css3fontconverter
```

Convert some `otf` files in `/mnt/silly-project`:
```sh
docker run -it -v /mnt/silly-project:/fonts stealthii/css3fontconverter project*.otf
```


[css3FontConverter]: https://github.com/zoltan-dulac/css3FontConverter
