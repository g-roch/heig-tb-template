%! Class = heig-bachelor
%! Author = Gaby Roch
%! Date = 15.10.21

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{heig-bachelor}[2020/10/15 Unofficial template for bachelor on HEIG-VD]

% if I need compteur: chap. 4.12, p.61

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessOptions\relax

\LoadClass{book}

\RequirePackage{xifthen}
\RequirePackage{tabularx}
\RequirePackage{babel}
\RequirePackage{graphicx}
\RequirePackage{multirow}
\RequirePackage{makecell}
\RequirePackage{fancyhdr}
%\RequirePackage[headings]{fullpage}
\RequirePackage[a4paper,margin=1.5cm,top=2.25cm,bottom=2.25cm]{geometry}
\RequirePackage{emptypage}
\RequirePackage{shorttoc}
\RequirePackage{color}
\RequirePackage[colorlinks,unicode]{hyperref}
\RequirePackage[most]{tcolorbox}
\RequirePackage{fancyvrb}
\RequirePackage{listingsutf8}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% en-tête
%
\pagestyle{fancy}
%\newgeometry{}

\fancyhead[RE,LO]{\includegraphics[height=1cm]{bachelor-school-slim}}
\fancyhead[LE,RO]{\@ifconfidential}

\fancypagestyle{plain}{
    \fancyhead[RE,LO]{\includegraphics[height=1cm]{bachelor-school-slim}}
    \fancyhead[LE,RO]{\@ifconfidential}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% définition des setters
%
% \title[Short title]{TB title}
\renewcommand{\title}[2][]{
    \ifthenelse{\equal{#1}{}}{\def\@shorttitle{#2}}{\def\@shorttitle{#1}}%
    \def\@title{#2}
    \hypersetup{pdftitle={\@shorttitle}}
}

% \illustrationdir[filename=illustration]
\newif\if@illustration \@illustrationfalse
\newcommand{\illustration}[1][illustration]{
    \def\@illustration{#1}
    \@illustrationtrue
}

% \author[initial]{Student name}
\renewcommand{\author}[2][]{
    \ifthenelse{\equal{#1}{}}{\def\@shortauthor{#2}}{\def\@shortauthor{#1}}%
    \def\@author{#2}
    \hypersetup{pdfauthor={\@author}}
}

% \authormasc & \authorfem
\newif\if@authorgenderfem \@authorgenderfemfalse
\newcommand{\authormasc}{\@authorgenderfemfalse}
\newcommand{\authorfem}{\@authorgenderfemtrue}

% \date not modified

% \school[acronym]{School acronym}
\newcommand{\school}[2][]{
    \ifthenelse{\equal{#1}{}}{\def\@shortschool{#2}}{\def\@shortschool{#1}}%
    \def\@school{#2}
}

% \department[acronym]{Department acronym}
\newcommand{\department}[2][]{
    \ifthenelse{\equal{#1}{}}{\def\@shortdepartment{#2}}{\def\@shortdepartment{#1}}%
    \def\@department{#2}
}

% \faculty[acronym]{Faculty name}
\newcommand{\faculty}[2][]{
    \ifthenelse{\equal{#1}{}}{\def\@shortfaculty{#2}}{\def\@shortfaculty{#1}}%
    \def\@faculty{#2}
}

% \orientation[acronym]{Orientation name}
\newcommand{\orientation}[2][]{
    \ifthenelse{\equal{#1}{}}{\def\@shortorientation{#2}}{\def\@shortorientation{#1}}%
    \def\@orientation{#2}
}

% \bachelorof{Type of Bachelor}
\newcommand{\bachelorof}[1]{\def\@bachelorof{#1}}

% \confidential
\newif\if@confidential \@confidentialfalse
\newcommand{\confidential}{\@confidentialtrue}
\newcommand{\@confidential}{\if@confidential \confidentialname \else \nonconfidentialname \fi}
\newcommand{\@ifconfidential}{\if@confidential \confidentialname \fi}

% \proposedby{Person name}{institution}{adress}
\newif\if@proposedby \@proposedbyfalse
\newcommand{\proposedby}[3]{
    \@proposedbytrue
    \def\@proposedbyname{#1}
    \def\@proposedbyinst{#2}
    \def\@proposedbyadress{#3}
}

% \teacher{teacher name}
\newcommand{\teacher}[2][]{
    \ifthenelse{\equal{#1}{}}{\def\@shortteacher{#2}}{\def\@shortteacher{#1}}%
    \def\@teacher{#2}
}

% \teachermasc & \teacherfem
\newif\if@teachergenderfem \@teachergenderfemfalse
\newcommand{\teachermasc}{\@teachergenderfemfalse}
\newcommand{\teacherfem}{\@teachergenderfemtrue}

% \schoolyear{20xx--20xx}
\newcommand{\schoolyear}[1]{\def\@schoolyear{#1}}

% \location{city}
\newcommand{\location}[1]{\def\@location{#1}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% String d'affichage
%
\newcommand{\bachelorname}{Bachelor thesis}
\newcommand{\confidentialname}{Confidential}
\newcommand{\nonconfidentialname}{Non-confidential}
\newcommand{\thedatename}{}
\newcommand{\departmentname}{Department}
\newcommand{\facultyname}{Faculty}
\newcommand{\orientationname}{Orientation}
\newcommand{\proposedbyname}{Work proposed by}
\newcommand{\studentname}{Studant}
\newcommand{\responsibleteachername}{Responsible teacher}
\newcommand{\academicyearname}{Academic year}
\newcommand{\publishablesummaryname}{Publishable summary}
\newcommand{\summaryname}{Summary}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% traduction française
%
\addto\captionsfrench{
    \renewcommand{\bachelorname}{Travail de Bachelor}
    \renewcommand{\confidentialname}{Confidentiel}
    \renewcommand{\nonconfidentialname}{Non confidentiel}
    \renewcommand{\thedatename}{le\ }
    \renewcommand{\departmentname}{Département}
    \renewcommand{\facultyname}{Filière}
    \renewcommand{\orientationname}{Orientation}
    \renewcommand{\proposedbyname}{Travail proposé par}
    \renewcommand{\studentname}{Étudiant\if@authorgenderfem e\fi}
    \renewcommand{\responsibleteachername}{Enseignant\if@teachergenderfem e\fi\ responsable}
    \renewcommand{\academicyearname}{Année académique}
    \renewcommand{\publishablesummaryname}{Résumé publiable}
    \renewcommand{\summaryname}{Sommaire}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% définition commande de rendu
%
% \summary[profondeur=1] -- Affiche un sommaire de profondeur `profondeur`
\newcommand{\summary}[1][1]{\shorttableofcontents{\summaryname}{#1}}

% \maketitle -- Affiche la page de titre
\renewcommand\maketitle{
    \newgeometry{margin=2cm}
    \begin{titlepage}%
        \let\footnotesize\small
        \let\footnoterule\relax
        \let \footnote \thanks
        \noindent
        \begin{tabularx}{\linewidth}{Xr}
          \multirow{3}{*}{\includegraphics[height=4em]{bachelor-school}} & \departmentname\ \@shortdepartment \\[0.5em]
            & \facultyname\ \@faculty            \\[0.5em]
            & \orientationname\ \@orientation
        \end{tabularx}
        \vskip 60\p@
        \begin{center}%
        {\LARGE \bachelorname \par}%
            \vskip 2em%
                {\Large \@title \\ \@confidential \par}%
            \vskip 2em%
            \if@illustration
            \includegraphics[height=25em]{images/illustration.jpg}
            \else
            \vskip 10em
            \fi
            \vskip 2em
            \begin{tabularx}{\linewidth}{lX}
              \textbf{\studentname~:}            & \textbf{\@author}                \\[0.5em]
                \if@proposedby
                \textbf{\proposedbyname~:}         & \@proposedbyname                 \\[0.5em]
                ~                                  & \@proposedbyinst                 \\[0.5em]
                ~                                  & \makecell[l]{\@proposedbyadress} \\[0.5em]
                \fi % TODO: change vspace for allow newlign in value
                \textbf{\responsibleteachername~:} & \@teacher                        \\[0.5em]
                \textbf{\academicyearname~:}       & \@schoolyear                     \\[0.5em]
            \end{tabularx}
            \if@illustration
            \vskip 2em
            \else
            \vskip 10em
            \fi
            \global\let\@tmpvskip\@empty
            \vfil
            \begin{flushright}
                \@location, \thedatename\@date
            \end{flushright}
        \end{center}\par
        \@thanks
        \vfil\null
    \end{titlepage}%
    \setcounter{footnote}{0}%
    \restoregeometry
}


\newenvironment{abstract}{
    \cleardoublepage
    \begin{flushright}\small
        \departmentname\ \@shortdepartment   \\[0.5em]
        \facultyname\ \@faculty         \\[0.5em]
        \orientationname\ \@orientation \\[0.5em]
        \studentname\ \@author \\[0.5em]
        \responsibleteachername\ \@teacher\\[0.5em]
    \end{flushright}
\begin{center}
\vskip 3em
{\large \bachelorname\ }\@schoolyear\\[0.5em]
\@title\\[1em]
\hrulefill\\
\end{center}
\vspace*{\fill}
\noindent\textbf{\large \publishablesummaryname}\vskip 1em
}{
\par\vspace*{\fill}
\noindent
\begin{tabularx}{\linewidth}{XXX}
Étudiant :               & Date et lieu : & Signature : \\[0.5em]
\@author                 & \hrulefill     & \hrulefill  \\[1em]  % TODO baiser la ligne
Enseignant responsable : & Date et lieu : & Signature : \\[0.5em]
\@teacher                & \hrulefill     & \hrulefill  \\[1em]
\if@proposedby
\@proposedbyinst :       & Date et lieu : & Signature : \\[0.5em]
\@proposedbyname         & \hrulefill     & \hrulefill  \\[1em]
\fi
\end{tabularx}
}



\newenvironment{signedpage}[4]{
\def\@signedpageAuthor{#2}
\def\@signedpageLocation{#3}
\def\@signedpageDate{#4}
\cleardoublepage
\vspace*{\fill}
\begin{center}
\noindent{\huge \bfseries #1}\par\vskip 2em
\end{center}
\begin{quote}
}{
\end{quote}
\par
\vskip 5em
\noindent\begin{tabularx}{\linewidth}{XX}
~ & \makecell[l]{\@signedpageAuthor}
\end{tabularx}
\par
\vskip 10em
\begin{quote}
\@signedpageLocation, \thedatename \@signedpageDate \\
\end{quote}
\vspace*{\fill}
}

\newlength{\largeurnota}
\newlength{\paddingnota}
\newlength{\indentationnota}
\newlength{\largeurlignenota}

\setlength{\largeurnota}{3.8em}
\setlength{\paddingnota}{0.3em}

% From https://framabook.org/tout-sur-latex/ on Art Libre (http://artlibre.org/)
\newenvironment{pictonote}[1]{%
\begin{list}{}{%
\setlength{\labelsep}{0pt}%
\setlength{\rightmargin}{15pt}}
\item%
\setlength{\indentationnota}{%
\@totalleftmargin+\largeurnota+\paddingnota}%
\setlength{\largeurlignenota}{%
\linewidth-\largeurnota-\paddingnota}%
\parshape=4%
\indentationnota\largeurlignenota%
\indentationnota\largeurlignenota%
\indentationnota\largeurlignenota%
\@totalleftmargin\linewidth%
\raisebox{-\largeurnota+2.2ex}[0pt][0pt]{%
\makebox[0pt][r]{%
\includegraphics[width=\largeurnota]{#1}%
\hspace{\paddingnota}}}%
\ignorespaces}{%
\end{list}}

\newenvironment{nota}{\begin{pictonote}{notice}
}{\end{pictonote}}
\newenvironment{question}{\begin{pictonote}{question}
}{\end{pictonote}}
\newenvironment{important}{\begin{pictonote}{important}
}{\end{pictonote}}
\newenvironment{warning}{\begin{pictonote}{warning}
}{\end{pictonote}}

\lstset{literate=
  {á}{{\'a}}1 {é}{{\'e}}1 {í}{{\'i}}1 {ó}{{\'o}}1 {ú}{{\'u}}1
  {Á}{{\'A}}1 {É}{{\'E}}1 {Í}{{\'I}}1 {Ó}{{\'O}}1 {Ú}{{\'U}}1
  {à}{{\`a}}1 {è}{{\`e}}1 {ì}{{\`i}}1 {ò}{{\`o}}1 {ù}{{\`u}}1
  {À}{{\`A}}1 {È}{{\'E}}1 {Ì}{{\`I}}1 {Ò}{{\`O}}1 {Ù}{{\`U}}1
  {ä}{{\"a}}1 {ë}{{\"e}}1 {ï}{{\"i}}1 {ö}{{\"o}}1 {ü}{{\"u}}1
  {Ä}{{\"A}}1 {Ë}{{\"E}}1 {Ï}{{\"I}}1 {Ö}{{\"O}}1 {Ü}{{\"U}}1
  {â}{{\^a}}1 {ê}{{\^e}}1 {î}{{\^i}}1 {ô}{{\^o}}1 {û}{{\^u}}1
  {Â}{{\^A}}1 {Ê}{{\^E}}1 {Î}{{\^I}}1 {Ô}{{\^O}}1 {Û}{{\^U}}1
  {ã}{{\~a}}1 {ẽ}{{\~e}}1 {ĩ}{{\~i}}1 {õ}{{\~o}}1 {ũ}{{\~u}}1
  {Ã}{{\~A}}1 {Ẽ}{{\~E}}1 {Ĩ}{{\~I}}1 {Õ}{{\~O}}1 {Ũ}{{\~U}}1
  {œ}{{\oe}}1 {Œ}{{\OE}}1 {æ}{{\ae}}1 {Æ}{{\AE}}1 {ß}{{\ss}}1
  {ű}{{\H{u}}}1 {Ű}{{\H{U}}}1 {ő}{{\H{o}}}1 {Ő}{{\H{O}}}1
  {ç}{{\c c}}1 {Ç}{{\c C}}1 {ø}{{\o}}1 {å}{{\r a}}1 {Å}{{\r A}}1
  {€}{{\euro}}1 {£}{{\pounds}}1 {«}{{\guillemotleft}}1
  {»}{{\guillemotright}}1 {ñ}{{\~n}}1 {Ñ}{{\~N}}1 {¿}{{?`}}1 {¡}{{!`}}1 
}


\endinput
