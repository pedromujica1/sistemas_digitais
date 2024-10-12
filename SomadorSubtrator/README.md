## Somador e Subtrator 8 bits

Alunos: Pedro Miotto Mujica e Gabriel Costa Moraes

Entidades usadas:
- Circuito lógico Not de 8 bits
- Multiplexador 2x8
- Somador 8 bits

Explicação do somador: A realização da adição e da subtração é definido pelo sinal op:
- Caso o sinal op = '0' a soma é realizada entre as palvras X e Y de 8 bits pelo circuito somador de 8 bits com 8 fullAdders
- Caso o sinal op = '1' a subtração é realizada. Contudo realizamos a soma pelo complemento de 2 do subtraendo, como descrito abaixo: 
```
X + (-Y) = X - Y
```
Para isso é necessário negar a palavra Y e direcionar para um Multiplexador que caso o Sinal Seletor seja 1, irá resultar  no ~Y como entrada para o Somador de 8 bits, caso o seletor seja 0 irá encaminhar a palavra Y.
O Cin do somador também se torna 1 dado o sinal op = '1' para assim ser realizada a soma com o complemento de dois.

Mais informações podem ser encontradas no RelatorioSomadorSubtrator.pdf
## Testando o somador e subtrator
 - Para testar com diferentes valores basta alterar os valores dos sinais no arquivo `tb_somador8bits.vhdl`
 - Para rodar a Simulação 01 sem latência de portas lógicas digite os comandos em abaixo no terminal
 ```
chmod +x ./runSimulacao1.sh
 ```
  ```
./runSimulacao1.sh
 ```
 - Para acessar Simulação 02 com latência de portas lógicas execute o arquivo `Simulacao2.ghw`
