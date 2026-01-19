% heh-amc.sty — Package LaTeX pour examens AMC à la HEH
% Copyright (c) 2025 — Licence à définir
%
% Ce package centralise le chargement des dépendances pour les examens
% Auto Multiple Choice (AMC) conformes à la charte graphique HEH.

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{heh-amc}[2025/12/29 v0.1.0 Classe AMC pour la HEH]

% --- Vérification du moteur de compilation ---
% Le package requiert LuaLaTeX pour fontspec et les polices OpenType
\RequirePackage{ifluatex}
\ifluatex\else
    \ClassError{heh-amc}{%
        Ce package nécessite LuaLaTeX.%
    }{%
        Vous utilisez un moteur LaTeX incompatible.^^J%
        Veuillez compiler votre document avec LuaLaTeX~:^^J%
        ^^J%
        \space\space lualatex votre-fichier.tex^^J%
        ^^J%
        Les moteurs pdfLaTeX et XeLaTeX ne sont pas supportés.%
    }
\fi

% --- Options du package ---
% Booléens pour contrôler le comportement d'AMC
\newif\ifhehamc@catalog      \hehamc@catalogfalse
\newif\ifhehamc@noshuffle    \hehamc@noshufflefalse

% Déclaration des options
\DeclareOption{catalog}{\hehamc@catalogtrue}
\DeclareOption{noshuffle}{\hehamc@noshuffletrue}

% Avertissement pour options inconnues
\DeclareOption*{%
    \ClassWarning{heh-amc}{Option inconnue~: '\CurrentOption'}%
}

% Traitement des options
\ProcessOptions\relax

% Charge la classe de base article
\LoadClass[12pt,a4paper]{article}

% --- Packages de base ---
% Formatage du document et langue
\RequirePackage{amsmath}   % Capacités mathématiques étendues
\RequirePackage[french]{babel}     % Support multilingue
\RequirePackage{booktabs}  % Tableaux de meilleure qualité
\RequirePackage{enumitem}  % Listes personnalisables
\RequirePackage{graphicx}  % Gestion des images
\RequirePackage{multicol}  % Colonnes multiples
\RequirePackage{setspace}  % Espacement des lignes
\RequirePackage{siunitx}   % Unités SI
\RequirePackage{tcolorbox} % Boîtes colorées

% --- Configuration TikZ ---
\RequirePackage{tikz}
\usetikzlibrary{calc}

% --- Typographie ---
% \RequirePackage[sfdefault]{roboto}     % Police sans-serif
% \RequirePackage{roboto-mono}           % Police monospace
% \RequirePackage[mathrm=sym]{unicode-math} % Gestion des polices mathématiques
% \setmathfont{Fira Math}                % Police mathématique
\RequirePackage{fontspec}           % Sélection de polices pour LuaLaTeX
\RequirePackage{luciole-math}       % Police mathématique Luciole
\setmainfont{Luciole}
\renewcommand{\sffamily}{\rmfamily}
\RequirePackage{realscripts}        % Amélioration des indices et exposants
\setmonofont{IntoneMonoNerdFont}    % Police monospace

% --- Configuration des unités SI ---
\sisetup{
    locale=FR,                     % Locale française (séparateur décimal virgule)
    per-mode=fraction              % Utiliser des fractions pour les unités
}

% --- Formatage du texte ---
\onehalfspacing{}                  % Espacement 1,5 ligne
\setlength{\parindent}{0pt}        % Pas d'indentation de paragraphe

% --- Chargement d'Auto Multiple Choice ---
% Construction dynamique des options AMC
\newcommand{\hehamc@amcoptions}{asbox,box,lang=FR,separateanswersheet}

% Ajout conditionnel des options
\ifhehamc@catalog
    \edef\hehamc@amcoptions{\hehamc@amcoptions,catalog}
\fi
\ifhehamc@noshuffle
    \edef\hehamc@amcoptions{\hehamc@amcoptions,noshuffle,noshufflegroups}
\fi

% Chargement du package AMC avec les options construites
\expandafter\RequirePackage\expandafter[\hehamc@amcoptions]{automultiplechoice}

% --- Configuration AMC par défaut ---
\AMCboxStyle{shape=square,size=2ex,down=.3ex}   % Taille des cases à cocher
\AMCsetFoot{\thepage{}}            % Numéro de page en pied de page
\AMCsetScoreZoneAnswerSheet{position=margins} % Position de la zone de score
\setdefaultgroupmode{withoutreplacement} % Mode de sélection des questions

% --- Formatage des questions ---
\newlength{\hehamc@questionnumberlength}
\settowidth{\hehamc@questionnumberlength}{\textbf{99. }}
\renewcommand{\AMCformQuestion}[1]{\makebox[\hehamc@questionnumberlength][r]{\textbf{#1.}}}
\ifhehamc@catalog
    \renewcommand{\AMCbeginQuestion}[2]{\noindent\textbf{#1}}
\else
    \renewcommand{\AMCbeginQuestion}[2]{\noindent\makebox[\hehamc@questionnumberlength][l]{\textbf{#1.}}}
\fi

% --- Commandes personnalisées ---

\newcommand{\hehamc@examtitle}{}
\newcommand{\ExamTitle}[1]{\renewcommand{\hehamc@examtitle}{#1}}

\newcommand{\hehamc@cohort}{}
\newcommand{\Cohort}[1]{\renewcommand{\hehamc@cohort}{#1}}

\newcommand{\hehamc@duration}{}
\newcommand{\Duration}[1]{\renewcommand{\hehamc@duration}{#1}}

\newcommand{\hehamc@durationextra}{}
\newcommand{\DurationExtra}[1]{\renewcommand{\hehamc@durationextra}{#1}}

% Page de couverture
\definecolor{hehamc@red1}{HTML}{911a1a}
\definecolor{hehamc@red2}{HTML}{aa1d1e}
\definecolor{hehamc@red3}{HTML}{c5221f}
\definecolor{hehamc@red4}{HTML}{de2226}
\definecolor{hehamc@red5}{HTML}{cf2223}
\definecolor{hehamc@dark}{HTML}{383838}
\newfontfamily\robotofont{Roboto}

\newcommand{\HEHLogo}{%
    \begin{tikzpicture}

        % HEH
        \fill[hehamc@red1] (0,0) |- ++(.23,1.14) |- ++(.46,-.46) |- ++(.23,.46) |- ++(-.23,-1.14) |- ++(-.46,.46) -- ++(0,-.46) -- cycle;
        \begin{scope}[fill=hehamc@red2]
            \clip (3.66,.23) circle[radius=2.97];
            \fill (0,0) |- ++(.23,1.14) |- ++(.46,-.46) |- ++(.23,.46) |- ++(-.23,-1.14) |- ++(-.46,.46) -- ++(0,-.46) -- cycle;
            \fill (1.14,0) rectangle ++(.91,.23);
            \fill (1.14,.46) rectangle ++(.69,.23);
            \fill (1.14,.91) rectangle ++(.91,.23);
        \end{scope}
        \begin{scope}[fill=hehamc@red3]
            \clip (3.66,.23) circle[radius=2.06];
            \fill (1.14,0) rectangle ++(.91,.23);
            \fill (1.14,.46) rectangle ++(.69,.23);
            \fill (1.14,.91) rectangle ++(.91,.23);
            \fill (2.29,0) |- ++(.23,1.14) |- ++(.46,-.46) |- ++(.23,.46) |- ++(-.23,-1.14) |- ++(-.46,.46) -- ++(0,-.46) -- cycle;
        \end{scope}
        \begin{scope}[fill=hehamc@red4]
            \clip (3.66,.23) circle[radius=1.26];
            \fill (2.29,0) |- ++(.23,1.14) |- ++(.46,-.46) |- ++(.23,.46) |- ++(-.23,-1.14) |- ++(-.46,.46) -- ++(0,-.46) -- cycle;
        \end{scope}

        % be
        \fill[hehamc@dark] (3.43,.46) rectangle ++(.07,.69);
        \fill[hehamc@dark] (3.66,.69) circle[radius=.23];
        \fill[white] (3.66,.69) circle[radius=.16];
        \fill[white] (3.51,.54) circle[radius=.17];
        \fill[hehamc@red5] (3.51,.54) circle[radius=.09];
        \fill[hehamc@dark] (4.43,.69) arc[radius=.23,start angle=0,end angle=315] -- (4.2,.69) -- cycle;
        \fill[white] (4.2,.69) circle[radius=.16];
        \begin{scope}[fill=hehamc@dark]
            \clip (4.2,.69) circle[radius=.23];
            \fill (3.97,.65) rectangle ++(.46,.07);
        \end{scope}

        % Département des Sciences et Technologies
        \node[anchor=base west,inner sep=0pt,node font=\robotofont,text=hehamc@dark] at (3.43,0) {Sciences};
        \node[anchor=base west,inner sep=0pt,node font=\robotofont,text=hehamc@dark] (techno) at (3.43,-.36) {et technologies};

        \pgfresetboundingbox
        \useasboundingbox (0,1.14) rectangle (techno.south east);
    \end{tikzpicture}
}

\newcommand{\Instructions}{%
    \begin{itemize}[itemsep=0.5em]
        \item \textbf{Durée maximale~:}
              \begin{itemize}[noitemsep]
                  \item \hehamc@duration{}.
                  \item \hehamc@durationextra{} si tiers temps inclus dans le PAI. % chktex 13
              \end{itemize}
        \item \textbf{Notation~:}
              \begin{itemize}[noitemsep]
                  \item Chaque réponse correcte = \textbf{1~point}.
                  \item Pas de point négatif pour les erreurs.
              \end{itemize}
        \item \textbf{Format des questions~:}
              \begin{itemize}[noitemsep]
                  \item 4 propositions spécifiques et 2 propositions générales.
                  \item Une seule réponse correcte par question.
              \end{itemize}
        \item \textbf{Propositions générales~:}
              \begin{itemize}[noitemsep]
                  \item \textbf{aucune} = aucune proposition spécifique n'est correcte.
                  \item \textbf{toutes} = toutes les propositions spécifiques sont correctes.
              \end{itemize}
        \item \textbf{Remise~:}
              \begin{itemize}[noitemsep]
                  \item Remettez toutes les feuilles de l'examen.
                  \item Seule la feuille de réponse sera corrigée.
                  \item Utilisez les feuilles de question comme brouillon.
              \end{itemize}
    \end{itemize}
}

\newcommand{\CoverPage}{%
    \setcounter{figure}{0} % Remet à zéro le compteur de figures
    \HEHLogo{}

    \vspace{1em}

    \textbf{\hehamc@examtitle{} \hfill{} \hehamc@cohort{}}

    \vspace{1em}

    \section*{Consignes}

    \begin{tcolorbox}
        \textbf{Ne tournez pas cette page avant d'en avoir reçu l'autorisation.}
    \end{tcolorbox}

    \Instructions{}

    \clearpage{}
} % Fin de la commande \CoverPage

\newcommand{\AnswerSheet}{%
    \AMCformBegin{}%
    \textbf{\hehamc@examtitle{} \hfill{} \hehamc@cohort{}}

    \vspace{1em}

    \begin{tabular}{@{}ll@{}}
        \namefield{\tcbox[colback=white,title=Nom et prénom,title filled]{\begin{minipage}{.50\linewidth}%
                                                                                      \vspace{1cm}\namefielddots{}%
                                                                                      \vspace*{1mm}%
                                                                                  \end{minipage}}} &
        \tcbox[bottomtitle=3pt,colback=white,title=Date,title filled]{\begin{minipage}{.325\linewidth}%
                                                                              \vspace{1cm}\dotfill{}%
                                                                              \vspace*{1mm}%
                                                                          \end{minipage}}
    \end{tabular}

    \section*{Réponses}

    \begin{tcolorbox}
        \begin{itemize}[left=0pt,noitemsep]
            \item \textbf{Encodage des réponses pour faciliter la lecture optique~:}
                  \begin{itemize}[nosep]
                      \item Utilisez un stylo-bille \textbf{bleu} standard ou \textbf{noir}, non-effaçable.
                      \item Noircissez complètement la case de votre choix.
                  \end{itemize}
            \item \textbf{Modification de vos réponses~:}
                  \begin{itemize}[nosep]
                      \item Utilisez du correcteur liquide ou en ruban.
                      \item Ne redessinez pas les cases.
                  \end{itemize}
        \end{itemize}
    \end{tcolorbox}

    \begin{multicols}{2}
        \AMCform{}
    \end{multicols}
} % Fin de la commande \AnswerSheet

\newcommand{\DraftPage}{\clearpage{}\section*{Feuille de brouillon}\clearpage{}} % Crée une page de brouillon
\newcommand{\FillIn}{\makebox[6em]{\hrulefill{}}} % Commande pour les espaces à remplir

