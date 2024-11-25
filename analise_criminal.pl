% Base de Conhecimento
:- dynamic impressao_digital/1, motivo/1, testemunha/1, relacao/1.

% Regras de Análise
suspeito(Suspeito) :- 
    impressao_digital(Suspeito), 
    motivo(Suspeito).

teoria(crime_passional) :- 
    testemunha(Testemunha), 
    relacao(Testemunha).

% Início do programa
inicio :-
    write('--- Sistema de Analise Criminal ---'), nl,
    perguntar_evidencias,
    analisar_crime,
    limpar_evidencias.

% Perguntar as evidências
perguntar_evidencias :-
    perguntar('Ha impressoes digitais no local do crime? (Digite o nome ou "nao")', impressao_digital),
    perguntar('Ha um motivo financeiro para o crime? (Digite o nome ou "nao")', motivo),
    perguntar('Ha uma testemunha ocular? (Digite o nome ou "nao")', testemunha),
    perguntar('Havia uma relacao intima com a vitima? (Digite o nome ou "nao")', relacao).

% Perguntar e registrar as evidências
perguntar(Pergunta, Predicado) :-
    write(Pergunta), nl,
    read(Resposta),
    (Resposta \= nao -> assertz(Predicado(Resposta)); true).

% Analisar as evidências
analisar_crime :-
    (suspeito(Suspeito) ->
        format('Suspeito identificado: ~w.', [Suspeito]), nl;
        write('Nenhum suspeito identificado com as evidencias atuais.'), nl),
    (teoria(crime_passional) ->
        write('Teoria identificada: Crime Passional.'), nl;
        write('Nenhuma teoria foi identificada com base nas evidencias atuais.'), nl).

% Limpar as evidências após a execução
limpar_evidencias :-
    retractall(impressao_digital(_)),
    retractall(motivo(_)),
    retractall(testemunha(_)),
    retractall(relacao(_)).
