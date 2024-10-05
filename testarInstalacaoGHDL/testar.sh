#!/bin/sh

ghdl --clean

ghdl -a *.vhdl

ghdl -r tb_porta_2in --wave=tb_porta_2in.ghw --stop-time=40ns

gtkwave -f solConfig.gtkw &


