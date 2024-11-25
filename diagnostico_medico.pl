% Declaração de fatos dinâmicos para sintomas
:- dynamic febre/0, dor_de_cabeca/0, tosse/0, dor_de_garganta/0, dor_muscular/0, cansaco/0.

% Regras para diagnóstico
doenca(gripe) :- febre, tosse, cansaco.
doenca(infeccao_viral) :- febre, dor_de_garganta, dor_muscular.
doenca(enxaqueca) :- dor_de_cabeca, cansaco.

% Alerta caso nenhum diagnóstico seja encontrado
alerta_consulta :- \+ doenca(_).

% Interação principal com o usuário
inicio :-
    write('--- Sistema de Diagnostico Medico ---'), nl,
    write('Informe os sintomas respondendo com "sim." ou "nao.".'), nl,
    perguntar_sintomas,
    diagnostico.

% Perguntar sobre os sintomas
perguntar_sintomas :-
    perguntar('Voce tem febre?', febre),
    perguntar('Voce tem dor de cabeca?', dor_de_cabeca),
    perguntar('Voce tem tosse?', tosse),
    perguntar('Voce tem dor de garganta?', dor_de_garganta),
    perguntar('Voce tem dor muscular?', dor_muscular),
    perguntar('Voce tem cansaco?', cansaco).

% Perguntar e registrar os sintomas
perguntar(Pergunta, Sintoma) :-
    write(Pergunta), nl,
    read(Resposta),
    (Resposta == sim -> assertz(Sintoma); true).

% Diagnostico baseado nos sintomas fornecidos
diagnostico :-
    (doenca(Doenca) ->
        format('Diagnostico identificado: ~w.', [Doenca]), nl;
        write('Nenhum diagnostico foi identificado. Consulte um medico.'), nl),
    limpar_sintomas.

% Limpar sintomas registrados após a execução
limpar_sintomas :-
    retractall(febre),
    retractall(dor_de_cabeca),
    retractall(tosse),
    retractall(dor_de_garganta),
    retractall(dor_muscular),
    retractall(cansaco).
