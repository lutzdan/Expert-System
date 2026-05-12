% ================================================
%  SISTEMA EXPERTO - TRASTORNOS DE ANSIEDAD
%  Orientacion academica en psicologia
%  Basado en GUI XPCE para SWI-Prolog
% ================================================

:- use_module(library(pce)).

% ------------------------------------------------
%  RESPUESTAS VALIDAS
% ------------------------------------------------
esrespuesta(si).
esrespuesta(no).

% ------------------------------------------------
%  PREGUNTAS VALIDAS
% ------------------------------------------------
espregunta('Sientes preocupacion constante incluso sin razon clara?', X) :- esrespuesta(X).
espregunta('Tienes pensamientos repetitivos que no puedes controlar?', X) :- esrespuesta(X).
espregunta('Evitas situaciones sociales por miedo a ser juzgado?', X) :- esrespuesta(X).
espregunta('Has tenido ataques repentinos de miedo intenso?', X) :- esrespuesta(X).
espregunta('Realizas acciones repetitivas para sentir alivio?', X) :- esrespuesta(X).
espregunta('Presentas dificultad para dormir por preocupaciones?', X) :- esrespuesta(X).
espregunta('Has vivido un evento traumatico recientemente?', X) :- esrespuesta(X).
espregunta('Tienes recuerdos o pesadillas frecuentes de ese evento?', X) :- esrespuesta(X).
espregunta('Evitas lugares que te recuerdan lo ocurrido?', X) :- esrespuesta(X).
espregunta('Te sientes constantemente alerta o en peligro?', X) :- esrespuesta(X).

% ------------------------------------------------
%  REGLAS DE INFERENCIA
% ------------------------------------------------

% TEPT: evento traumatico + recuerdos/pesadillas
inferir(tept, P1,P2,P3,P4,P5,P6,P7,P8,P9,P10) :-
    espregunta('Has vivido un evento traumatico recientemente?',        P7), P7 = si,
    espregunta('Tienes recuerdos o pesadillas frecuentes de ese evento?', P8), P8 = si,
    espregunta('Evitas lugares que te recuerdan lo ocurrido?',          P9), P9 = si,
    espregunta('Te sientes constantemente alerta o en peligro?',        P10), P10 = si,
    espregunta('Sientes preocupacion constante incluso sin razon clara?', P1), _=P1,
    espregunta('Tienes pensamientos repetitivos que no puedes controlar?', P2), _=P2,
    espregunta('Evitas situaciones sociales por miedo a ser juzgado?',  P3), _=P3,
    espregunta('Has tenido ataques repentinos de miedo intenso?',        P4), _=P4,
    espregunta('Realizas acciones repetitivas para sentir alivio?',      P5), _=P5,
    espregunta('Presentas dificultad para dormir por preocupaciones?',   P6), _=P6.

% TOC: pensamientos repetitivos + acciones compulsivas
inferir(toc, P1,P2,P3,P4,P5,P6,P7,P8,P9,P10) :-
    espregunta('Tienes pensamientos repetitivos que no puedes controlar?', P2), P2 = si,
    espregunta('Realizas acciones repetitivas para sentir alivio?',        P5), P5 = si,
    espregunta('Has vivido un evento traumatico recientemente?',           P7), P7 = no,
    espregunta('Sientes preocupacion constante incluso sin razon clara?',  P1), _=P1,
    espregunta('Evitas situaciones sociales por miedo a ser juzgado?',     P3), _=P3,
    espregunta('Has tenido ataques repentinos de miedo intenso?',          P4), _=P4,
    espregunta('Presentas dificultad para dormir por preocupaciones?',     P6), _=P6,
    espregunta('Tienes recuerdos o pesadillas frecuentes de ese evento?',  P8), _=P8,
    espregunta('Evitas lugares que te recuerdan lo ocurrido?',             P9), _=P9,
    espregunta('Te sientes constantemente alerta o en peligro?',           P10), _=P10.

% Panico: ataques repentinos de miedo intenso
inferir(panico, P1,P2,P3,P4,P5,P6,P7,P8,P9,P10) :-
    espregunta('Has tenido ataques repentinos de miedo intenso?',          P4), P4 = si,
    espregunta('Tienes pensamientos repetitivos que no puedes controlar?', P2), P2 = no,
    espregunta('Realizas acciones repetitivas para sentir alivio?',        P5), P5 = no,
    espregunta('Has vivido un evento traumatico recientemente?',           P7), P7 = no,
    espregunta('Sientes preocupacion constante incluso sin razon clara?',  P1), _=P1,
    espregunta('Evitas situaciones sociales por miedo a ser juzgado?',     P3), _=P3,
    espregunta('Presentas dificultad para dormir por preocupaciones?',     P6), _=P6,
    espregunta('Tienes recuerdos o pesadillas frecuentes de ese evento?',  P8), _=P8,
    espregunta('Evitas lugares que te recuerdan lo ocurrido?',             P9), _=P9,
    espregunta('Te sientes constantemente alerta o en peligro?',           P10), _=P10.

% Ansiedad Social: evita situaciones sociales + miedo a ser juzgado
inferir(social, P1,P2,P3,P4,P5,P6,P7,P8,P9,P10) :-
    espregunta('Evitas situaciones sociales por miedo a ser juzgado?',     P3), P3 = si,
    espregunta('Has tenido ataques repentinos de miedo intenso?',          P4), P4 = no,
    espregunta('Tienes pensamientos repetitivos que no puedes controlar?', P2), P2 = no,
    espregunta('Has vivido un evento traumatico recientemente?',           P7), P7 = no,
    espregunta('Sientes preocupacion constante incluso sin razon clara?',  P1), _=P1,
    espregunta('Realizas acciones repetitivas para sentir alivio?',        P5), _=P5,
    espregunta('Presentas dificultad para dormir por preocupaciones?',     P6), _=P6,
    espregunta('Tienes recuerdos o pesadillas frecuentes de ese evento?',  P8), _=P8,
    espregunta('Evitas lugares que te recuerdan lo ocurrido?',             P9), _=P9,
    espregunta('Te sientes constantemente alerta o en peligro?',           P10), _=P10.

% TAG: preocupacion constante + dificultad para dormir
inferir(tag, P1,P2,P3,P4,P5,P6,P7,P8,P9,P10) :-
    espregunta('Sientes preocupacion constante incluso sin razon clara?',  P1), P1 = si,
    espregunta('Presentas dificultad para dormir por preocupaciones?',     P6), P6 = si,
    espregunta('Has tenido ataques repentinos de miedo intenso?',          P4), P4 = no,
    espregunta('Tienes pensamientos repetitivos que no puedes controlar?', P2), P2 = no,
    espregunta('Evitas situaciones sociales por miedo a ser juzgado?',     P3), _=P3,
    espregunta('Realizas acciones repetitivas para sentir alivio?',        P5), _=P5,
    espregunta('Has vivido un evento traumatico recientemente?',           P7), _=P7,
    espregunta('Tienes recuerdos o pesadillas frecuentes de ese evento?',  P8), _=P8,
    espregunta('Evitas lugares que te recuerdan lo ocurrido?',             P9), _=P9,
    espregunta('Te sientes constantemente alerta o en peligro?',           P10), _=P10.

% Sin coincidencia clara (cláusula de fallo)
inferir(ninguno, _,_,_,_,_,_,_,_,_,_).

% ------------------------------------------------
%  DESCRIPCION DE LOS DIAGNOSTICOS
% ------------------------------------------------
descripcion(tag,
    'TRASTORNO DE ANSIEDAD GENERALIZADA (TAG)',
    'Preocupacion excesiva y persistente sobre situaciones cotidianas,',
    'incluso sin razon clara o proporcional para ello.',
    'Sintomas frecuentes: inquietud, tension muscular, fatiga,',
    'dificultad para concentrarse, irritabilidad y problemas para dormir.').

descripcion(toc,
    'TRASTORNO OBSESIVO-COMPULSIVO (TOC)',
    'Pensamientos intrusivos involuntarios (obsesiones) que generan ansiedad,',
    'y rituales repetitivos (compulsiones) para reducir esa angustia.',
    'Sintomas frecuentes: rituales de orden, comprobacion constante,',
    'necesidad de simetria y pensamientos no deseados persistentes.').

descripcion(panico,
    'TRASTORNO DE PANICO',
    'Ataques de panico repentinos, intensos y recurrentes con sensacion',
    'extrema de miedo o peligro acompanados de sintomas fisicos.',
    'Sintomas frecuentes: taquicardia, dificultad para respirar,',
    'sudoracion, mareos y sensacion de perdida de control.').

descripcion(social,
    'TRASTORNO DE ANSIEDAD SOCIAL',
    'Miedo o ansiedad intensa ante situaciones donde la persona puede',
    'sentirse observada, evaluada o juzgada por los demas.',
    'Sintomas frecuentes: evitacion social, nerviosismo extremo,',
    'sudoracion, temblores y temor a hacer el ridiculo o ser rechazado.').

descripcion(tept,
    'TRASTORNO DE ESTRES POSTRAUMATICO (TEPT)',
    'Se desarrolla tras vivir o presenciar un evento traumatico.',
    'La persona revive constantemente la experiencia con gran ansiedad.',
    'Sintomas frecuentes: recuerdos invasivos, pesadillas, hipervigilancia,',
    'evitacion del trauma y dificultad para dormir.').

descripcion(ninguno,
    'SIN COINCIDENCIA CLARA',
    'Los sintomas reportados no permiten identificar un trastorno especifico.',
    'Esto no significa que no exista algun padecimiento.',
    'Se recomienda una evaluacion completa con un profesional de salud',
    'mental para obtener un diagnostico certero y un plan de atencion.').

% ------------------------------------------------
%  VENTANA PRINCIPAL
% ------------------------------------------------
main :-
    new(D, dialog('SISTEMA EXPERTO - ORIENTACION EN PSICOLOGIA')),
    send(D, size, size(580, 380)),

    new(T1, label(t1,
        'SISTEMA EXPERTO DE PSICOLOGIA',
        font(helvetica, bold, 18))),
    new(T2, label(t2,
        'Orientacion academica sobre Trastornos de Ansiedad',
        font(helvetica, bold, 13))),
    new(Sep, label(sep, '------------------------------------------------------------', font(helvetica, roman, 10))),
    new(I1, label(i1, 'Este sistema realiza una orientacion BASICA a partir de', font(helvetica, roman, 11))),
    new(I2, label(i2, 'los sintomas reportados por el usuario.', font(helvetica, roman, 11))),
    new(I3, label(i3, 'NO reemplaza el diagnostico de un profesional de salud mental.', font(helvetica, bold, 11))),
    new(Sep2, label(sep2, ' ', font(helvetica, roman, 10))),
    new(I4, label(i4, 'Posibles diagnosticos que el sistema puede identificar:', font(helvetica, roman, 11))),
    new(I5, label(i5, ' * Trastorno de Ansiedad Generalizada (TAG)', font(helvetica, roman, 10))),
    new(I6, label(i6, ' * Trastorno Obsesivo-Compulsivo (TOC)', font(helvetica, roman, 10))),
    new(I7, label(i7, ' * Trastorno de Panico', font(helvetica, roman, 10))),
    new(I8, label(i8, ' * Trastorno de Ansiedad Social', font(helvetica, roman, 10))),
    new(I9, label(i9, ' * Trastorno de Estres Postraumatico (TEPT)', font(helvetica, roman, 10))),
    new(Sep3, label(sep3, ' ', font(helvetica, roman, 10))),

    new(BIniciar, button(iniciar,
        message(@prolog, abrir_preguntas))),
    new(BSalir, button('  SALIR  ',
        message(D, destroy))),

    send(D, append, T1),
    send(D, append, T2),
    send(D, append, Sep),
    send(D, append, I1),
    send(D, append, I2),
    send(D, append, I3),
    send(D, append, Sep2),
    send(D, append, I4),
    send(D, append, I5),
    send(D, append, I6),
    send(D, append, I7),
    send(D, append, I8),
    send(D, append, I9),
    send(D, append, Sep3),
    send(D, append, BIniciar),
    send(D, append, BSalir),
    send(D, label, 'INICIAR EVALUACION'),
    send(D, default_button, inciar),
    send(D, open, point(220, 130)).

% ------------------------------------------------
%  DIALOGO DE PREGUNTAS (10 preguntas si/no)
% ------------------------------------------------
abrir_preguntas :-
    new(D, dialog('EVALUACION DE SINTOMAS')),
    send(D, size, size(680, 550)),

    new(TT, label(tt,
        'Responda SI o NO a cada pregunta segun su experiencia reciente:',
        font(helvetica, bold, 12))),
    send(D, append, TT),

    % Preguntas
    new(Q1, menu('Sientes preocupacion constante incluso sin razon clara?')),
    send_list(Q1, append, [si, no]),

    new(Q2, menu('Tienes pensamientos repetitivos que no puedes controlar?')),
    send_list(Q2, append, [si, no]),

    new(Q3, menu('Evitas situaciones sociales por miedo a ser juzgado?')),
    send_list(Q3, append, [si, no]),

    new(Q4, menu('Has tenido ataques repentinos de miedo intenso?')),
    send_list(Q4, append, [si, no]),

    new(Q5, menu('Realizas acciones repetitivas para sentir alivio?')),
    send_list(Q5, append, [si, no]),

    new(Q6, menu('Presentas dificultad para dormir por preocupaciones?')),
    send_list(Q6, append, [si, no]),

    new(Q7, menu('Has vivido un evento traumatico recientemente?')),
    send_list(Q7, append, [si, no]),

    new(Q8, menu('Tienes recuerdos o pesadillas frecuentes de ese evento?')),
    send_list(Q8, append, [si, no]),

    new(Q9, menu('Evitas lugares que te recuerdan lo ocurrido?')),
    send_list(Q9, append, [si, no]),

    new(Q10, menu('Te sientes constantemente alerta o en peligro?')),
    send_list(Q10, append, [si, no]),

    send(D, append, Q1),
    send(D, append, Q2),
    send(D, append, Q3),
    send(D, append, Q4),
    send(D, append, Q5),
    send(D, append, Q6),
    send(D, append, Q7),
    send(D, append, Q8),
    send(D, append, Q9),
    send(D, append, Q10),

    new(BSep, label(bsep, ' ', font(helvetica, roman, 10))),
    send(D, append, BSep),

    new(BDiag, button('  VER DIAGNOSTICO  ',
        and(
            message(@prolog, procesar,
                Q1?selection, Q2?selection, Q3?selection, Q4?selection, Q5?selection,
                Q6?selection, Q7?selection, Q8?selection, Q9?selection, Q10?selection),
            message(D, destroy)
        )
    )),
    new(BAtras, button('  REGRESAR  ',
        and(message(@prolog, main), message(D, destroy)))),

    send(D, append, BDiag),
    send(D, append, BAtras),
    send(D, default_button, 'VER DIAGNOSTICO'),
    send(D, open, point(150, 80)).

% ------------------------------------------------
%  PROCESAMIENTO - MOTOR DE INFERENCIA
% ------------------------------------------------
procesar(P1,P2,P3,P4,P5,P6,P7,P8,P9,P10) :-
    (   inferir(tept,   P1,P2,P3,P4,P5,P6,P7,P8,P9,P10) -> Dx = tept
    ;   inferir(toc,    P1,P2,P3,P4,P5,P6,P7,P8,P9,P10) -> Dx = toc
    ;   inferir(panico, P1,P2,P3,P4,P5,P6,P7,P8,P9,P10) -> Dx = panico
    ;   inferir(social, P1,P2,P3,P4,P5,P6,P7,P8,P9,P10) -> Dx = social
    ;   inferir(tag,    P1,P2,P3,P4,P5,P6,P7,P8,P9,P10) -> Dx = tag
    ;   Dx = ninguno
    ),
    mostrar_resultado(Dx, P1,P2,P3,P4,P5,P6,P7,P8,P9,P10).

% ------------------------------------------------
%  DIALOGO DE RESULTADOS
% ------------------------------------------------
mostrar_resultado(Dx, P1,P2,P3,P4,P5,P6,P7,P8,P9,P10) :-
    descripcion(Dx, Titulo, D1, D2, D3, D4, D5),
    new(D, dialog('RESULTADO DEL DIAGNOSTICO')),
    send(D, size, size(680, 450)),

    new(LTit,  label(lt,  Titulo, font(helvetica, bold, 16))),
    new(LSep,  label(ls,  '============================================', font(helvetica, roman, 10))),
    new(LDesc1, label(ld1, D1,   font(helvetica, roman, 12))),
    new(LDesc2, label(ld2, D2,   font(helvetica, roman, 12))),
    new(LDesc3, label(ld3, D3,   font(helvetica, roman, 12))),
    new(LDesc4, label(ld4, D4,   font(helvetica, roman, 12))),
    new(LDesc5, label(ld5, D5,   font(helvetica, roman, 12))),
    new(LSep2, label(ls2, '--------------------------------------------', font(helvetica, roman, 10))),
    new(LTit2, label(lt2, 'Respuestas registradas:', font(helvetica, bold, 11))),

    % Resumen de respuestas
    atomic_list_concat(
        ['Preocupacion constante: ', P1, '  |  Pensamientos repetitivos: ', P2,
         '  |  Evita situaciones sociales: ', P3], ResR1),
    atomic_list_concat(
        ['Ataques de miedo: ', P4, '  |  Acciones repetitivas: ', P5,
         '  |  Dificultad para dormir: ', P6], ResR2),
    atomic_list_concat(
        ['Evento traumatico: ', P7, '  |  Recuerdos/pesadillas: ', P8,
         '  |  Evita lugares: ', P9, '  |  Alerta constante: ', P10], ResR3),

    new(LR1, label(r1, ResR1, font(courier, roman, 10))),
    new(LR2, label(r2, ResR2, font(courier, roman, 10))),
    new(LR3, label(r3, ResR3, font(courier, roman, 10))),

    new(LSep3, label(ls3, ' ', font(helvetica, roman, 8))),
    new(LAviso, label(lav,
        'AVISO: Este sistema ofrece orientacion academica, NO reemplaza',
        font(helvetica, bold, 10))),
    new(LAviso2, label(lav2,
        'la evaluacion de un profesional de salud mental certificado.',
        font(helvetica, bold, 10))),

    new(BNueva, button('  NUEVA EVALUACION  ',
        and(message(D, destroy), message(@prolog, abrir_preguntas)))),
    new(BSalir, button('  SALIR  ',
        message(D, destroy))),

    send(D, append, LTit),
    send(D, append, LSep),
    send(D, append, LDesc1),
    send(D, append, LDesc2),
    send(D, append, LDesc3),
    send(D, append, LDesc4),
    send(D, append, LDesc5),
    send(D, append, LSep2),
    send(D, append, LTit2),
    send(D, append, LR1),
    send(D, append, LR2),
    send(D, append, LR3),
    send(D, append, LSep3),
    send(D, append, LAviso),
    send(D, append, LAviso2),
    send(D, append, BNueva),
    send(D, append, BSalir),
    send(D, default_button, 'NUEVA EVALUACION'),
    send(D, open, point(160, 100)).

% ------------------------------------------------
%  PUNTO DE ENTRADA
% ------------------------------------------------
:- initialization(main, main).
