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

\pagestyle{fancy}
%\newgeometry{}


\fancyhead[RE,LO]{\includegraphics[height=1cm]{bachelor-school-slim}}
\fancyhead[LE,RO]{\@ifconfidential}

\fancypagestyle{plain}{
    \fancyhead[RE,LO]{\includegraphics[height=1cm]{bachelor-school-slim}}
    \fancyhead[LE,RO]{\@ifconfidential}
}

% define \title{TB title}
%\let\titleoriginal\title
\renewcommand{\title}[2][]{
    \ifthenelse{\equal{#1}{}}{\def\@shorttitle{#2}}{\def\@shorttitle{#1}}%
    \def\@title{#2}
}

% define \illustrationdir[file]
\newif\if@illustration \@illustrationfalse
\newcommand{\illustration}[1][illustration]{
    \def\@illustration{#1}
    \@illustrationtrue
}

% define \author{Student name}
%\let\authororiginal\author
\renewcommand{\author}[2][]{
    \ifthenelse{\equal{#1}{}}{\def\@shortauthor{#2}}{\def\@shortauthor{#1}}%
    \def\@author{#2}
}
\newif\if@authorgenderfem \@authorgenderfemfalse
\newcommand{\authormasc}{\@authorgenderfemfalse}
\newcommand{\authorfem}{\@authorgenderfemtrue}


%define \date
% Date du rendu
%\let\dateoriginal\date
%\renewcommand{\date}[1]{\dateoriginal{#1}\def\@date{#1}}
%\date{\today}

%define \school{School acronym}
\newcommand{\school}[2][]{
    \ifthenelse{\equal{#1}{}}{\def\@shortschool{#2}}{\def\@shortschool{#1}}%
    \def\@school{#2}
}

%define \department{Department acronym}
\newcommand{\department}[2][]{
    \ifthenelse{\equal{#1}{}}{\def\@shortdepartment{#2}}{\def\@shortdepartment{#1}}%
    \def\@department{#2}
}

%define \faculty{Faculty name}
\newcommand{\faculty}[2][]{
    \ifthenelse{\equal{#1}{}}{\def\@shortfaculty{#2}}{\def\@shortfaculty{#1}}%
    \def\@faculty{#2}
}

%define \orientation{Orientation name}
\newcommand{\orientation}[2][]{
    \ifthenelse{\equal{#1}{}}{\def\@shortorientation{#2}}{\def\@shortorientation{#1}}%
    \def\@orientation{#2}
}

%define \bachelorof{Type of Bachelor}
\newcommand{\bachelorof}[1]{\def\@bachelorof{#1}}

%define \confidential
\newif\if@confidential \@confidentialfalse
\newcommand{\confidential}{\@confidentialtrue}
\newcommand{\@confidential}{\if@confidential \confidentialname \else \nonconfidentialname \fi}
\newcommand{\@ifconfidential}{\if@confidential \confidentialname \fi}

%define \proposedby{Person name}{institution}{adress}
\newif\if@proposedby \@proposedbyfalse
\newcommand{\proposedby}[3]{
    \@proposedbytrue
    \def\@proposedbyname{#1}
    \def\@proposedbyinst{#2}
    \def\@proposedbyadress{#3}
}

%define \teacher{teacher name}
\newcommand{\teacher}[2][]{
    \ifthenelse{\equal{#1}{}}{\def\@shortteacher{#2}}{\def\@shortteacher{#1}}%
    \def\@teacher{#2}
}
\newif\if@teachergenderfem \@teachergenderfemfalse
\newcommand{\teachermasc}{\@teachergenderfemfalse}
\newcommand{\teacherfem}{\@teachergenderfemtrue}

%define \schoolyear{from year-to year}
\newcommand{\schoolyear}[1]{\def\@schoolyear{#1}}

%define \location{city}
\newcommand{\location}[1]{\def\@location{#1}}

%define \abstract{abstract}
%\newcommand{\abstract}[1]{\def\@abstract{#1}}

\newcommand{\summary}[1][1]{\shorttableofcontents{\summaryname}{#1}}

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


\renewcommand\maketitle{
    \newgeometry{margin=2cm}
    \begin{titlepage}%
        \let\footnotesize\small
        \let\footnoterule\relax
        \let \footnote \thanks
        \noindent
        \begin{tabularx}{\linewidth}{Xr}
            \multirow{3}{*}{\includegraphics[height=4em]{bachelor-school}} & \departmentname\ \@shortdepartment \\
            & \facultyname\ \@faculty            \\
            & \orientationname\ \@orientation
        \end{tabularx}
        \vskip 60\p@
        \begin{center}%
        {\LARGE \bachelorname \par}%
            \vskip 2em%
                {\Large \@title \\ \@confidential \par}%
            \vskip 2em%
            \if@illustration
            \includegraphics[height=27em]{images/illustration.jpg}
            \else
            \vskip 10em
            \fi
            \vskip 2em
            \begin{tabularx}{\linewidth}{lX}
                \textbf{\studentname~:}            & \textbf{\@author}                \\
                \if@proposedby
                \textbf{\proposedbyname~:}         & \@proposedbyname                 \\
                ~                                  & \@proposedbyinst                 \\
                ~                                  & \makecell[l]{\@proposedbyadress} \\
                \fi
                \textbf{\responsibleteachername~:} & \@teacher                        \\
                \textbf{\academicyearname~:}       & \@schoolyear                     \\
            \end{tabularx}
            \if@illustration
            \vskip 3em
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
\@author                 & \hrulefill     & \hrulefill  \\[1em]
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


\endinput
