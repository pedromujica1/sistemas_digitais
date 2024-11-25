#!/bin/sh


ghdl -a ffjk.vhdl    
ghdl -a ffjkD.vhdl
ghdl -a ffjkT.vhdl
ghdl -a tb_ffjk.vhdl    
ghdl -a tb_ffjkD.vhdl
ghdl -a tb_ffjkT.vhdl

#Gerar testbench
ghdl -e tb_ffjk 
ghdl -e tb_ffjkD
ghdl -e tb_ffjkT

ghdl -r tb_ffjk --stop-time=80ns --wave=tb_ffjk.ghw
ghdl -r tb_ffjkD --stop-time=80ns --wave=tb_ffjkD.ghw
ghdl -r tb_ffjkT --stop-time=80ns --wave=tb_ffjkT.ghw

