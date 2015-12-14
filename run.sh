#!/bin/bash
if [[ $# -eq 0 ]] ; then
    params="*.ttf"
else
    params=$@
fi
/app/convertFonts.sh ${params}
