#!/bin/sh

#Combilar arquivos 
ghdl -a *.vhdl

ghdl -a tb_regcarga.vhdl
ghdl -a tb_regcarga8bits.vhdl
#ghdl -a ffjk_tb8bits.vhdl

# Elaborar o testbench
ghdl -e tb_regcarga       #Nome da entidade do testbench
ghdl -e tb_regcarga8bits

#Executar a simulação e gerar o arquivo ghw
ghdl -r tb_regcarga --stop-time=140ns --wave=tb_regcarga.ghw
ghdl -r tb_regcarga8bits --stop-time=140ns --wave=tb_regcarga8bits.ghw



