#Compilar arquivos do tipo VHDL
ghdl -a ffjk.vhdl
ghdl -a ffjkD.vhdl
ghdl -a ffjk.vhdl



# Elaborar o testbench
ghdl -e tb_ffjk      #Nome da entidade do testbench
ghdl -e tb_ffjkD
#ghdl -e tb-ffjk-t


#Executar a simulação e gerar o arquivo ghw
ghdl -r tb_ffjk --stop-time=80ns --wave=tb_ffjk.ghw
ghdl -r tb_ffjkD --stop-time=80ns --wave=tb_ffjkD.ghw