#!/bin/bash

qmake ShaderGen.pro -r -spec macx-clang CONFIG+=x86_64

make clean && make

(cd build && macdeployqt ShaderGen.app -no-plugins)

mkdir dist
cp -r build/ShaderGen.app dist
ln -s /Applications dist/Applications
cp License.txt dist 

hdiutil create \
        -volname "ShaderGen" \
        -srcfolder ./dist \
        -ov \
        ShaderGen-3.3.0.dmg
