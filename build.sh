#!/bin/bash

# dpys-swapfile setup
# dpys-swapfile swapon

#apt-get install libfonconfig-dev fontconfig

MAKEOPTS='TARGETOS=linux SOURCES=src/mame/drivers/x1.cpp,src/mame/drivers/pc6001.cpp,src/mame/drivers/pc8001.cpp,src/mame/drivers/fm7.cpp,src/mame/drivers/msx.cpp,src/mame/drivers/mz700.cpp,src/mame/drivers/pc9801.cpp,src/mame/drivers/gb.cpp,src/mame/drivers/nes.cpp NO_X11=1 NOWERROR=1 NO_USE_XINPUT=1 NO_USE_XINPUT_WII_LIGHTGUN_HACK=1 NO_OPENGL=1 USE_QTDEBUG=0 DEBUG=0 REGENIE=1 NO_BGFX=1 FORCE_DRC_C_BACKEND=1 NO_USE_PORTAUDIO=1'

make $MAKEOPTS
