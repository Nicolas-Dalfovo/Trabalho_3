# Trabalho_3

# Sistema Especialista em Prolog

## Funcionamento
O sistema foi construído com base na lógica de programação funcional, utilizando fatos, regras e consultas para gerar respostas. A interação com o usuário é feita via perguntas e respostas, e as inferências são realizadas com base nos dados fornecidos.

Cada módulo implementa um conjunto específico de regras e fatos para resolver problemas dentro de um contexto, como diagnósticos médicos, análise de veículos, recomendações de livros, treinos de academia e investigação criminal.

# Exemplos de Entrada e Saída

## Diagnóstico Médico
- Entrada:
  
  ```bash
  ?- inicio.
  Você apresenta febre? (sim/nao): sim
  Você apresenta tosse? (sim/nao): sim.

- Saída:

  ```bash
  Diagnóstico identificado: gripe.

## Recomendação de Livros
- Entrada:
  ```bash
  ?- inicio.
  Qual gênero você prefere? (ficcao, historia, autoajuda): ficcao.
  Qual o seu principal interesse? (politica, ciencia, filosofia, psicologia): filosofia.

- Saída:
  ```bash
  Recomendações de livros: ['O Pequeno Príncipe'].

# Como rodar o programa

1. Instale o SWI-Prolog:

    Baixe e instale o SWI-Prolog em https://www.swi-prolog.org/.

2. Baixe o Arquivo:

    Salve o código em arquivos separados para cada módulo, como diagnostico_medico.pl, recomendacao_livros.pl, etc.

   3. Abra o SWI-Prolog:

    No terminal, inicie o SWI-Prolog digitando:
     ```bash
     swipl

4. Carregue o Arquivo:

    Carregue o módulo desejado:
     ```bash
     ?- [nome_do_arquivo].
5. Execute o Programa:

    Execute o programa principal com:
      ```bash
      ?- inicio.
