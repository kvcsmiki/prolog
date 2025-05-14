megold(K) :-

    K = kotetek(K1,K2,K3,K4,K5),
    nap(K1,hetfo), nap(K2,kedd), nap(K3,szerda), nap(K4,csutortok), nap(K5,pentek),
    kotet(X1, K), ar(X1, 1500),
    kotet(X2, K), ar(X2, 1700),
    kotet(X3, K), ar(X3, 2000),
    kotet(X4, K), ar(X4, 2200),
    kotet(X5, K), ar(X5, 2350),
    kotet(X6, K), cim(X6, csengo),
    kotet(X7, K), cim(X7, dobos_torta),
    kotet(X8, K), cim(X8, marvanyfejek),
    kotet(X9, K), cim(X9, tul_mindenen),
    kotet(X10, K), cim(X10, zene_bona),
    kotet(X11, K), szerk(X11, abafi_bea),
    kotet(X12, K), szerk(X12, dalos_dezso),
    kotet(X13, K), szerk(X13, gemes_imre),
    kotet(X14, K), szerk(X14, joszkin_ede),
    kotet(X15, K), szerk(X15, palos_kata),
    
    % 1. Sem a hétfői, sem a Csengő című könyvet nem nő szerkesztette.
    kotet(A1, K), nap(A1, hetfo), szerk(A1, A1SZ), ferfi(A1SZ),
    kotet(A2, K), cim(A2, csengo), szerk(A2, A2SZ), ferfi(A2SZ),

    % 2. Mindkét fenti könyv olcsóbb, mint Abafi Bea könyve, amely egy nappal Joszkin Ede könyve előtt jelent meg.
    ar(A1, A1AR), ar(A2, A2AR),
    kotet(B1, K), szerk(B1, abafi_bea), nap(B1, B1N), ar(B1, B1AR),
    kotet(B2, K), szerk(B2, joszkin_ede), nap(B2, B2N),
    A1AR < B1AR, A2AR < B1AR,
    egy_nappal_elotte(B2N, B1N),

    % 3. A Túl Mindenen drágább mint Dalos Dezső szerkesztése
    kotet(C1,K), cim(C1,tul_mindenen), ar(C1, C1AR),
    kotet(C2,K), szerk(C2,dalos_dezso), ar(C2, C2AR), C1AR > C2AR,

    % 4. A Márványfejek csütörtök óta kapható
    kotet(D,K), cim(D,marvanyfejek), nap(D,csutortok),

    % 5. 1700 Ft-os könyv szerkesztője Pálos Kata, és előbb jelent meg, mint a Márványfejek
    kotet(E, K), ar(E, 1700), szerk(E, palos_kata), nap(E, _),

    % 6. A szerdai könyv 1500 Ft
    kotet(F,K), nap(F,szerda), ar(F,1500),

    % 7. Dobos torta ára 2350
    kotet(G,K), cim(G,dobos_torta), ar(G,2350),

    % 8. Gémes Imre a Zene-bonát szerkesztette
    kotet(H,K), szerk(H,gemes_imre), cim(H,zene_bona).

nap(k(X,_,_,_),X).
cim(k(_,X,_,_),X).
ar(k(_,_,X,_),X).
szerk(k(_,_,_,X),X).

kotet(X,kotetek(X,_,_,_,_)).
kotet(X,kotetek(_,X,_,_,_)).
kotet(X,kotetek(_,_,X,_,_)).
kotet(X,kotetek(_,_,_,X,_)).
kotet(X,kotetek(_,_,_,_,X)).

% Nemek
ferfi(dalos_dezso).
ferfi(gemes_imre).
ferfi(joszkin_ede).

% Napok sorrendje
nap_elotte(kedd, hetfo).
nap_elotte(szerda, hetfo).
nap_elotte(szerda, kedd).
nap_elotte(csutortok, hetfo).
nap_elotte(csutortok, kedd).
nap_elotte(csutortok, szerda).
nap_elotte(pentek, hetfo).
nap_elotte(pentek, kedd).
nap_elotte(pentek, szerda).
nap_elotte(pentek, csutortok).
       
egy_nappal_elotte(kedd, hetfo).
egy_nappal_elotte(szerda, kedd).
egy_nappal_elotte(csutortok, szerda).
egy_nappal_elotte(pentek, csutortok).
