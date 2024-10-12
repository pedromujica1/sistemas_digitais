#!/bin/sh

#Combilar arquivos do Circuito Not de 8 bits
ghdl -a not8bits.vhdl    #
ghdl -a tb_not8bits.vhdl  #Compilar o testbench

#Compilar arquivos do Mux2x8
ghdl -a mux2x8.vhdl
ghdl -a tb_mux2x8.vhdl

#Compilar arquivos do SomadorCompleto
ghdl -a somadorCompleto.vhdl
ghdl -a tb_somadorCompleto.vhdl

#Compilar arquivos do Somador8bits
ghdl -a somador8bits.vhdl
ghdl -a tb_somador8bits.vhdl

# Elaborar o testbench
ghdl -e tb_not8bits       #Nome da entidade do testbench
ghdl -e tb_mux2x8
ghdl -e tb_somadorCompleto
ghdl -e tb_somador8bits

#Executar a simulação e gerar o arquivo ghw
ghdl -r tb_not8bits --stop-time=80ns --wave=ghw_files/tb_not8bits.ghw
ghdl -r tb_mux2x8 --wave=ghw_files/tb_mux2x8.ghw
ghdl -r tb_somadorCompleto --stop-time=80ns --wave=ghw_files/somadorCompleto.ghw
ghdl -r tb_somador8bits --stop-time=80ns --wave=Simulacao01_tb_somador8bits.ghw

#Abrindo o arquivo pelo gtkwave
gtkwave Simulacao01_tb_somador8bits.ghw

