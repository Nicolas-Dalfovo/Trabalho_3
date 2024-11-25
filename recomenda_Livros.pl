% Base de Conhecimento
:- dynamic genero/1, interesse/1.

% Livros e seus gêneros
livro('1984', ficcao, politica).
livro('Sapiens', historia, ciencia).
livro('O Pequeno Principe', ficcao, filosofia).
livro('A Sutil Arte de Ligar o F*da-se', autoajuda, psicologia).

% Início do programa
inicio :-
    write('--- Sistema de Recomendacao de Livros ---'), nl,
    perguntar_genero,
    perguntar_interesse,
    listar_recomendacoes,
    limpar_preferencias.

% Perguntar o gênero preferido
perguntar_genero :-
    write('Qual genero você prefere? (ficcao, historia, autoajuda)'), nl,
    read(Genero),
    assertz(genero(Genero)).

% Perguntar o interesse principal
perguntar_interesse :-
    write('Qual o seu principal interesse? (politica, ciencia, filosofia, psicologia)'), nl,
    read(Interesse),
    assertz(interesse(Interesse)).

% Listar recomendações com base nas preferências
listar_recomendacoes :-
    genero(Genero),
    interesse(Interesse),
    findall(Livro, livro(Livro, Genero, Interesse), Recomendados),
    (Recomendados \= [] ->
        format('Recomendacoes de livros: ~w', [Recomendados]), nl;
        write('Nenhum livro encontrado para suas preferencias.'), nl).

% Limpar as preferências do usuário após execução
limpar_preferencias :-
    retractall(genero(_)),
    retractall(interesse(_)).
