#Combilar arquivos 
ghdl -a *.vhdl

ghdl -a tb_contador.vhdl

#Gerar entidade testebench
#ghdl -e tb_contador


#Executar a simulação e gerar o arquivo ghw
ghdl -r tb_contador --stop-time=140ns --wave=tb_contador.ghw