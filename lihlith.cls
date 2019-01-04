\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{lihlith}
              
\DeclareOption*{\PassOptionToClass{\CurrentOption}{article}}
% Execute the code of the options:
\ProcessOptions
\LoadClass[12pt,twoside,openwight,a4paper]{article}

% Some includes and definitions
\usepackage{a4wide}
\usepackage{lastpage}
\usepackage{fancyhdr}
\usepackage{amssymb}
\usepackage{xspace}
\usepackage[final]{graphicx}
\usepackage{url}
\usepackage{colortbl}
\usepackage{setspace}
\usepackage{named}
\usepackage{fancyhdr}
\usepackage{tcolorbox}
\usepackage{color}
\definecolor{myorange}{RGB}{250,142,47}
\usepackage[OT1]{fontenc}
\usepackage{type1cm}


\newcommand{\DocTitle}[1]   {\renewcommand{\DH@title}{#1}}
\newcommand{\DocDate}[1]    {\renewcommand{\DH@date}{#1}}
\newcommand{\DocNumber}[1]  {\renewcommand{\DH@number}{#1}}
\newcommand{\DocVersion}[1] {\renewcommand{\DH@version}{#1}}
\newcommand{\DH@title}{}
\newcommand{\DH@date}{}
\newcommand{\DH@number}{}
\newcommand{\DH@version}{}
\@onlypreamble{\DocTitle}
\@onlypreamble{\DocDate}
\@onlypreamble{\DocNumber}
\@onlypreamble{\DocVersion}

\setlength{\headheight}{3\baselineskip}
\setlength{\headsep}{3em}

\fancyhf{}
\lhead{LIHLITH}
\rhead{\DeliverableNumShort: \DH@title}
\rfoot{\thepage}

\pagestyle{fancy}

% %%%%%%%%%%%%%%%%%%%%
% Definition of the revisions environment
% %%%%%%%%%%%%%%%%%%%%
%
% Revision number of the document
%
\newcommand{\@nwrrevisionnum}{XX.YY}
\newcommand{\nwrrevisionnum}[1]{\renewcommand{\@nwrrevisionnum}{#1}}
% write the
\newcommand{\@nwrrevnumwriteaux}[1]{%
\def\@ccciempty{}%
\def\@cccciempty{#1}%
\ifx\@ccciempty\@cccciempty
 \@ccciempty
\else
% notice the use of \gdef to make the defined symbol global. Otherwise
% it is local and the default value is used.
 \protected@write\@auxout{}{\string\gdef\string\@nwrrevisionnum{#1}}
\fi
}
%
% Revision macro: \nwrrevision{version}{date}{description}{by}{affected}
%
\newcommand{\nwrrevision}[5]{#1 \@nwrrevnumwriteaux{#1} & #2 & #3 & #4 & #5 \\\hline}
%
% Revisions environment
%
\newenvironment{nwrrevisions}{%
\section*{Table of Revisions}
%\addtocontents{toc}{\protect\contentsline{section}{{Table of Revisions}}{\thepage}}
%
\begin{footnotesize}
\renewcommand{\arraystretch}{1.2}
\begin{tabular}{|>{\columncolor[gray]{.94}}l|l|p{0.4\textwidth}|p{0.2\textwidth}|p{0.1\textwidth}|}\hline%
\rowcolor[gray]{.94}
\textbf{Version} & \textbf{Date} & \textbf{Description and reason} & \textbf{By} & \textbf{Affected sections} \\ \hline
}{%
\end{tabular}%
\end{footnotesize}
}

