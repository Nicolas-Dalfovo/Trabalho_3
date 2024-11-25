% Base de Conhecimento
:- dynamic objetivo/1, experiencia/1, disponibilidade/1.

% Treinos e seus objetivos
treino('Hipertrofia', 'Treino de força com pesos pesados, 3x por semana') :-
    objetivo(ganhar_massa),
    experiencia(intermediario).

treino('Perda de Peso', 'Treino funcional de alta intensidade, 5x por semana') :-
    objetivo(emagrecer),
    disponibilidade(tempo_limitado).

treino('Condicionamento', 'Treino aeróbico moderado, 4x por semana') :-
    objetivo(condicionamento).

% Início do programa
inicio :-
    write('--- Sistema de Recomendacao de Treinos de Academia ---'), nl,
    perguntar_objetivo,
    perguntar_experiencia,
    perguntar_disponibilidade,
    listar_recomendacoes,
    limpar_preferencias.

% Perguntar o objetivo do usuário
perguntar_objetivo :-
    write('Qual e o seu objetivo? (ganhar_massa, emagrecer, condicionamento)'), nl,
    read(Objetivo),
    assertz(objetivo(Objetivo)).

% Perguntar a experiência do usuário
perguntar_experiencia :-
    write('Qual e o seu nivel de experiencia? (iniciante, intermediario, avancado)'), nl,
    read(Experiencia),
    assertz(experiencia(Experiencia)).

% Perguntar sobre disponibilidade de tempo
perguntar_disponibilidade :-
    write('Voce tem tempo limitado para treinar? (sim/nao)'), nl,
    read(Resposta),
    (Resposta == sim -> assertz(disponibilidade(tempo_limitado)); true).

% Listar as recomendações com base nas preferências
listar_recomendacoes :-
    findall(Treino, treino(Nome, Treino), Recomendados),
    (Recomendados \= [] ->
        format('Treinos recomendados: ~w', [Recomendados]), nl;
        write('Nenhum treino encontrado para suas preferencias.'), nl).

% Limpar as preferências do usuário após a execução
limpar_preferencias :-
    retractall(objetivo(_)),
    retractall(experiencia(_)),
    retractall(disponibilidade(_)).
