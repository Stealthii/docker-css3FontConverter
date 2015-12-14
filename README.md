docker-css3FontConverter
========================

[css3FontConverter] is a tool to convert TTF/OTF fonts to EOT, SVG, WOFF, WOFF2 web fonts, and generate a CSS stylesheet with CSS3 @font-face rules.

As usual there's a bunch of ridiculous dependencies so here's a docker image containing everything you need

**NOTE**: I know WOFF2 generation is broken right now, bear with me.

#### How to Download ####
```sh
docker pull stealthii/css3-font-converter
```

#### How to Build ####

Fetch the code

```sh
git clone https://github.com/Stealthii/docker-css3FontConverter.git
cd docker-css3FontConverter
docker build -t omarev/css3-font-converter .
```

#### How to convert fonts ####

Convert all `ttf` files in the current directory:
```sh
docker run -it -v `pwd`:/fonts stealthii/css3-font-converter
```

Convert some `otf` files in `/mnt/silly-project`:
```sh
docker run -it -v /mnt/silly-project:/fonts stealthii/css3-font-converter *.otf
```


[css3FontConverter]: https://github.com/zoltan-dulac/css3FontConverter
