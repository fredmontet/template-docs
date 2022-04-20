% ==================================================
% Thesis LaTeX Report v1.0
% ==================================================

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{report}[2017/01/01 Report v1.0]

% Options
% ==================================================
\newif\ifconfidential
\DeclareOption{confidential}{\global\confidentialtrue}

\ProcessOptions

% Class and package loading
% ==================================================

\LoadClass[a4paper, 10pt, fleqn, oneside]{book}

\RequirePackage[top=37mm, bottom=42mm, left=36mm, right=29mm, headheight=14pt]{geometry}
\RequirePackage[T1]{fontenc}
\RequirePackage[utf8]{inputenc}
\RequirePackage[english]{babel}
\RequirePackage{ifxetex}
\RequirePackage{fancyhdr}
\RequirePackage{listings}
\RequirePackage{graphicx} % To insert images
\RequirePackage{titlesec}
\RequirePackage{hyperref} % For cross-references
\RequirePackage[export]{adjustbox} % To add frame around figures
\RequirePackage{float} % To put figure or tables where you want
\RequirePackage[usenames,dvipsnames]{color} % For custom colors
\RequirePackage[table]{xcolor} 
\RequirePackage{microtype} % Typographic improvements
\RequirePackage{setspace} % increase interline spacing slightly
\RequirePackage{booktabs} % For nicer tables
\RequirePackage{lipsum} % To easily add lorem ipsum
\RequirePackage{url}
\RequirePackage{amsmath}
\RequirePackage[final]{pdfpages} % To import pdf
\RequirePackage[toc, page]{appendix}
\RequirePackage{subcaption}
\RequirePackage{subfloat}
\RequirePackage{verbatim} 
\RequirePackage{minted} % For code syntax coloring. 
\RequirePackage{caption}
\RequirePackage{array}
\RequirePackage{rotating}
\RequirePackage{multirow}
\RequirePackage{pdflscape}
\RequirePackage{afterpage}
\RequirePackage{longtable}

% Metadata
% ==================================================

\newcommand{\@subtitle}{}
\newcommand{\subtitle}[1]{\gdef\@subtitle{#1}}

\newcommand{\@email}{}
\newcommand{\email}[1]{\gdef\@email{#1}}

\newcommand{\@courseofstudy}{}
\newcommand{\courseofstudy}[1]{\gdef\@courseofstudy{#1}}

\newcommand{\@major}{}
\newcommand{\major}[1]{\gdef\@major{#1}}

\newcommand{\@faculty}{}
\newcommand{\faculty}[1]{\gdef\@faculty{#1}}

\newcommand{\@course}{}
\newcommand{\course}[1]{\gdef\@course{#1}}

\newcommand{\@location}{}
\newcommand{\location}[1]{\gdef\@location{#1}}

\newcommand{\@institute}{}
\newcommand{\@institutename}{}
\newcommand{\institute}[2]{\gdef\@institutename{#1}\gdef\@institute{#2}}

\newcommand{\@coauthortitle}{}
\newcommand{\@coauthorname}{}
\newcommand{\@coauthoremail}{}
\newcommand{\@coauthorinstitute}{}
\newcommand{\coauthor}[4]{
  \gdef\@coauthortitle{#1}
  \gdef\@coauthorname{#2}
  \gdef\@coauthorinstitute{#3}
  \gdef\@coauthoremail{#4}
  }

\newcommand{\@footer}{}
\newcommand{\footer}[1]{\gdef\@footer{#1}}

% Font definition
% ==================================================

\ifxetex
  \RequirePackage[no-math]{fontspec}
  \fontsize{10}{10}
  \fontspec{Trade Gothic LT Std Light}
  \setmainfont{Trade Gothic LT Std Light}[
    Ligatures = TeX, % To support LaTeX quoting style
    BoldFont = {Trade Gothic LT Std Bold No. 2},
    ItalicFont = {Trade Gothic LT Std Light Oblique},
    BoldItalicFont = {Trade Gothic LT Std Bold No. 2 Oblique},
  ]
  \setmonofont{Source Code Pro}% For the code
  %\newfontface\textmd{Trade Gothic LT Std Regular}
\else
  \RequirePackage{courier} % To display code if xetex is note the tex compiler
\fi

% Title page
% ==================================================
\renewcommand{\maketitle}
{
   \begin{titlepage}
      \newgeometry{top=25mm, bottom=25mm, left=36mm, right=29mm}
      \begin{flushleft}
        \begin{minipage}[c][1.5cm][t]{0.4\textwidth}
            \begin{flushleft}
                \vspace{0.1cm}
                \includegraphics[width=200pt]{asset/img/mse.eps}
            \end{flushleft}
        \end{minipage}
        \hfill
        \begin{minipage}[c][1.5cm][t]{0.4\textwidth}
            \begin{flushright}
                \includegraphics[width=100pt]{asset/img/hesso.eps}
            \end{flushright}
        \end{minipage}
        \makeatletter
        \vspace{1.5cm}
        \begin{flushleft}
            \ifconfidential 
              \begin{center}
                CONFIDENTIAL 
              \end{center}
            \fi
            \vspace{3cm}
            {\huge \bfseries \@title\\}
            {\Large \@subtitle\\}
            \vspace{1cm}
            \@author
        \end{flushleft}
        %\vspace*{\fill}
        \vspace{1cm}
        \begin{minipage}[t]{0.49\textwidth}
            \begin{flushleft}
                \textbf{\@coauthortitle\\}
                \@coauthorname\\
                \@coauthorinstitute
                \@coauthoremail
                \vspace{0.6cm}
            \end{flushleft}
         \end{minipage}
         \hfill
         \begin{minipage}[t]{0.49\textwidth}
            \begin{flushright}
            \end{flushright}
         \end{minipage}
        \vspace{2cm}
        \makeatother
      \end{flushleft}
      \vspace*{\fill}
      \begin{center}
         \@footer
      \end{center}
      \restoregeometry
   \end{titlepage}
   \afterpage{\blankpage}
}

% General layout guidelines
% ==================================================

% Blank page
% --------------------------------------------------
\newcommand\blankpage{%
    \null
    \thispagestyle{empty}%
    \addtocounter{page}{-1}%
    \newpage}

% Equations conditions
% --------------------------------------------------
\newenvironment{conditions}[1][où :]
  {#1 \begin{tabular}[t]{>{$}l<{$} @{${}={}$} l}}
  {\end{tabular}\\[\belowdisplayskip]}

% color
% --------------------------------------------------
\definecolor{gray75}{gray}{0.75}
\definecolor{gray20}{gray}{0.8}

% graphix
% --------------------------------------------------
\graphicspath{{asset/img/}}

% caption
% --------------------------------------------------
\captionsetup{margin=10pt,textfont={small,it}}


% setspace
% --------------------------------------------------
\setstretch{1.1}

\makeatletter
\setlength{\@fptop}{0pt}  % for aligning all floating figures/tables etc. to the top margin
\makeatother


% Fancyhdr
% --------------------------------------------------
\renewcommand{\sectionmark}[1]{\markright{\thesection\ #1}}

\pagestyle{fancy}
  \fancyhf{}
  \renewcommand{\headrulewidth}{0.4pt}
  \renewcommand{\footrulewidth}{0pt}
  \fancyhead[OR]{\bfseries \nouppercase{\rightmark}}
  \fancyhead[EL]{\bfseries \nouppercase{\leftmark}}
  %\fancyfoot[CE,CO]{MSE Mater Thesis}
  \fancyfoot[EL,OR]{\thepage}

\fancypagestyle{plain}{
  \fancyhf{}
  \renewcommand{\headrulewidth}{0pt}
  \renewcommand{\footrulewidth}{0pt}
  %\fancyfoot[CE,CO]{MSE Mater Thesis}
  \fancyfoot[EL,OR]{\thepage}}

\fancypagestyle{addpagenumbersforpdfimports}{
  \fancyhead{}
  \renewcommand{\headrulewidth}{0pt}
  \fancyfoot{}
  \fancyfoot[RO,LE]{\thepage}
}


% Hyperref
% --------------------------------------------------

\hypersetup{pdfborder={0 0 0},
   colorlinks=true,
   linkcolor=black,
   citecolor=black,
   urlcolor=black}
\urlstyle{same}

\makeatletter
\def\cleardoublepage{\clearpage\if@twoside \ifodd\c@page\else
    \hbox{}
    \thispagestyle{empty}
    \newpage
    \if@twocolumn\hbox{}\newpage\fi\fi\fi}
\makeatother \clearpage{\pagestyle{plain}\cleardoublepage}

% Minted package for code coloration
% --------------------------------------------------

% How to use (replace 'java' with language name):
% - code blocks:
%     \begin{javacode}
%     CODE
%     \end{javacode}
% - files:
%     full: \javafile{PATH}
%     extract: \javafile[startline=x, endline=y]{PATH}
% - inline:
%     TODO

% Don't use the "gobble" neither "autogobble" minted options if compilation is done with
% XeLaTeX, it messes up the code. 

% Java
% --------------------------------

\newminted{java}{
  xleftmargin=4.5em, %2.5em is the width necessary to equalize left and right
  xrightmargin=2em, 
  linenos=true, 
  rulecolor=\color{gray20},
  frame=single, 
  breaklines=true,
  framesep=5pt,
  fontsize=\scriptsize
}

\newmintedfile{java}{
  xleftmargin=2.5em, %2.5em is the width necessary to equalize left and right
  linenos=true, 
  rulecolor=\color{gray20}, 
  frame=single, 
  breaklines=true,
  framesep=5pt, 
  fontsize=\scriptsize
}

% Scala
% --------------------------------

\newminted{scala}{
  xleftmargin=4.5em, %2.5em is the width necessary to equalize left and right
  xrightmargin=2em,
  autogobble=true,
  linenos=true, 
  rulecolor=\color{gray20},
  frame=single, 
  breaklines=true,
  framesep=5pt,
  fontsize=\scriptsize
}

\newmintedfile{scala}{
  xleftmargin=2.5em, %2.5em is the width necessary to equalize left and right
  linenos=true, 
  rulecolor=\color{gray20}, 
  frame=single, 
  breaklines=true,
  framesep=5pt, 
  fontsize=\scriptsize
}

% Python
% --------------------------------

\newminted{python}{
  xleftmargin=4.5em, %2.5em is the width necessary to equalize left and right
  xrightmargin=2em,
  autogobble=true,
  linenos=true, 
  rulecolor=\color{gray20},
  frame=single, 
  breaklines=true,
  framesep=5pt,
  fontsize=\scriptsize
}

\newmintedfile{python}{
  xleftmargin=2.5em, %2.5em is the width necessary to equalize left and right
  linenos=true, 
  rulecolor=\color{gray20}, 
  frame=single, 
  breaklines=true,
  framesep=5pt, 
  fontsize=\scriptsize
}

% Text
% --------------------------------

\newminted{text}{
  xleftmargin=4.5em, %2.5em is the width necessary to equalize left and right
  xrightmargin=2em,
  autogobble=true,
  linenos=true, 
  rulecolor=\color{gray20},
  frame=single, 
  breaklines=true,
  framesep=5pt,
  fontsize=\scriptsize
}

\newmintedfile{text}{
  xleftmargin=2.5em, %2.5em is the width necessary to equalize left and right
  linenos=true, 
  rulecolor=\color{gray20}, 
  frame=single, 
  breaklines=true,
  framesep=5pt, 
  fontsize=\scriptsize
}

% Color the line number in gray 75%
% --------------------------------

\renewcommand{\theFancyVerbLine}{ 
  \ttfamily
  \textcolor{gray75}{
  \scriptsize 
  \oldstylenums{
  \arabic{FancyVerbLine}
}}}


% Listings
% --------------------------------------------------
\lstset{language=[LaTeX]Tex,tabsize=4, basicstyle=\scriptsize\ttfamily, showstringspaces=false, numbers=left, numberstyle=\tiny, numbersep=10pt, breaklines=true, breakautoindent=true, breakindent=10pt}


% Titlesec
% --------------------------------------------------

\newcommand{\hsp}{\hspace{20pt}}

% Change chapter title style
% --------------------------------
\titleformat{\chapter}[block]
{\Huge\bfseries}
{\thechapter\hsp\textcolor{gray75}{|}\hsp}
{0pt}
{\Huge\bfseries}

\titlespacing*{\chapter}
{0pt}
{-50pt}
{20pt}

% Change section title style
% --------------------------------
\titleformat{\section}[block]
{\Large\bfseries}
{\thesection}
{0.5em}
{}
 
\titlespacing*{\section}
{0em}
{1.5ex plus .1ex minus .2ex}
{0.8em}

% Change subsection title style
% --------------------------------
\titleformat{\subsection}[block]
{\large\bfseries}
{\thesubsection}
{0.5em}
{}
 
\titlespacing*{\subsection}
{0em}
{1.5ex plus .1ex minus .2ex}
{0.3em}

% Change subsubsection title style
% --------------------------------
\titleformat{\subsubsection}[block]
{\normalsize\bfseries}
{\thesubsubsection}
{0.5em}
{}
 
\titlespacing*{\subsubsection}
{0em}
{1.5ex plus .1ex minus .2ex}
{0em}

% Amsmath
% --------------------------------------------------

%Fix the problem with delimiter size caused by fourier and amsmath packages.
\makeatletter
\def\resetMathstrut@{%
  \setbox\z@\hbox{%
    \mathchardef\@tempa\mathcode`\(\relax
      \def\@tempb##1"##2##3{\the\textfont"##3\char"}%
      \expandafter\@tempb\meaning\@tempa \relax
  }%
  \ht\Mathstrutbox@1.2\ht\z@ \dp\Mathstrutbox@1.2\dp\z@
}
\makeatother
