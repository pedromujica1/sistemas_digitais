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
ghdl -r tb_not8bits --stop-time=80ns --wave=tb_not8bits.ghw
ghdl -r tb_mux2x8 --stop-time=80ns --wave=tb_not8bits.ghw
ghdl -r tb_somadorCompleto --stop-time=80ns --wave=somadorCompleto.ghw
ghdl -r tb_somador8bits --stop-time=80ns --wave=SIMULACAO01_tb_somador8bits.ghw

#Gerar o diagrama de blocos
gtkwave tb_somador8bits.ghw


