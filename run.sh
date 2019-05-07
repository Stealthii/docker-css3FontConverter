#!/bin/bash
if [[ $# -eq 0 ]] ; then
    params="*.ttf *.otf"
else
    params=$@
fi
/app/convertFonts.sh ${params}
