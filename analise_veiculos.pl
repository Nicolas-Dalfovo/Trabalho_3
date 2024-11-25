% Fatos dinâmicos para sintomas de veículos
:- dynamic motor_nao_liga/0, luzes_fracas/0, barulho_ao_frear/0, vazamento_oleo/0.

% Regras de diagnóstico
problema(bateria_fraca) :- motor_nao_liga, luzes_fracas.
problema(freio_desgastado) :- barulho_ao_frear.
problema(vazamento_no_motor) :- vazamento_oleo.

% Início do sistema
inicio :-
    write('--- Sistema de Diagnostico de Veiculos ---'), nl,
    perguntar_sintomas_veiculo,
    diagnosticar_problema.

% Perguntar sobre os sintomas
perguntar_sintomas_veiculo :-
    perguntar('O motor nao liga?', motor_nao_liga),
    perguntar('As luzes estao fracas?', luzes_fracas),
    perguntar('Ha barulho ao frear?', barulho_ao_frear),
    perguntar('Ha vazamento de oleo?', vazamento_oleo).

% Perguntar e registrar sintomas
perguntar(Pergunta, Sintoma) :-
    write(Pergunta), nl,
    read(Resposta),
    (Resposta == sim -> assertz(Sintoma); true).

% Diagnosticar problema
diagnosticar_problema :-
    (problema(Problema) ->
        format('Diagnostico identificado: ~w.', [Problema]), nl;
        write('Nao foi possível identificar o problema. Consulte um mecanico.'), nl),
    limpar_sintomas.

% Limpar sintomas registrados após execução
limpar_sintomas :-
    retractall(motor_nao_liga),
    retractall(luzes_fracas),
    retractall(barulho_ao_frear),
    retractall(vazamento_oleo).
