#!/bin/sh



ghdl -a not8bits.vhdl    # Compilar a entidade not8bits
ghdl -a tb_not8bits.vhdl  # Compilar o testbench

# Elaborar o testbench
ghdl -e tb_not8bits       # Nome da entidade do testbench, não o nome do arquivo

# Executar a simulação e gerar o arquivo de onda
ghdl -r tb_not8bits --stop-time=80ns --wave=tb_not8bits.ghw

ghdl -r tb_mux2x8 --stop-time=80ns --wave=tb_not8bits.ghw


