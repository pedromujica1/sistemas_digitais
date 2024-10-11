## Somador e Subtrator 8 bits

Alunos: Pedro Miotto Mujica e Gabriel Costa Moraes

Entidades usadas:
- Circuito lógico Not de 8 bits
- Multiplexador 2x8
- Somador 8 bits

Explicação do somador: A realização da adição e da subtração é definido pelo sinal op:
- Caso o sinal op = '0' a soma é realizada entre as palvras X e Y de 8 bits
- Caso o sinal op = '1' a subtração é realizada então o sinal op = '1' é direcionado para o SELECT de um Multiplexador que retorna a palavra Y negada. O Cin do somador também se torna 1 para assim ser realizada a soma com o complemento de dois:
Como descrito abaixo
```
X + (-Y) 
```

