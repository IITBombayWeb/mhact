%%
%% This is file `mhact.cls',
%%
%% Time-stamp:<2016-04-18 01:32:05, v1.3 sunthar>
%%
%% Indian Institue of Technology Bombay, Thesis Document Class for LaTeX2e
%**********************************************************************
%%
% IMPORTANT NOTICE:
%% 
%**********************************************************************
%% You are not allowed to change this file.  You may however copy this file
%% to a file with a different name and then change the copy.
%% 
%% You are NOT ALLOWED to distribute this file alone.  You are NOT ALLOWED
%% to take money for the distribution or use of this file (or a changed
%% version) except for a nominal charge for copying etc.
%% 
%% You are allowed to distribute this file under the condition that it is
%% distributed together with all files mentioned below.
%%  - README.md

%% Updated versions of this file and related files is available from
%% https://github.com/IITBombayWeb/mhact
%% 
%% If you receive only some of these files from someone, complain!
%% 
%% Report errors in case of UNCHANGED versions to 
%%
%%    https://github.com/IITBombayWeb/mhact/issues/new
%%          or 
%%      P Sunthar  <p.sunthar@gmail.com> 
%%           or 
%%      Chandra Has <chandrahashbti@gmail.com>
%% 
%%
%%====================================================================

%********************* New class: mhact.cls **********************
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{mhact} [23/10/2015 MH Gov Act 0.1]
\typeout{Document Class 'mhact' v0.1 <1 Sep 2018>}

%******************************************************************** 
% We need command to switch between dissertation, annual progress 
% seminar report, and thesis, and between different types of  
% reports. 
%*******************************************************************
\newif\if@draft
\newif\if@seminar
\newif\if@degree

\DeclareOption{draft}{%
  \@drafttrue
  \PassOptionsToClass{draft}{report}
}



%*****************************************************************
% Process given options
% Defaults
%****************************************************************** 
\DeclareOption*{\PassOptionsToPackage{\CurrentOption}{report}}  

\ProcessOptions
\LoadClass[11pt,a4paper,openright,twoside]{report}


%***************Some important packages ****************************
% hyperref: for linking various labels
% graphicx: to add graphics
% fontenc, txfonts: important for character encoding, common font
% fancyhdr: fancy headr and footer
%********************************************************************
\RequirePackage[T1]{fontenc}
\RequirePackage{xcolor}
\RequirePackage{fancyhdr}
\RequirePackage[super]{nth}

\RequirePackage[bookmarks,%
            breaklinks,%
            backref=false,%
            pdfhighlight=/I,%
            pdffitwindow=true,%
            pdfstartview=Fit,%
            pdfcenterwindow=true,%
            colorlinks,
            linkcolor={red!50!black},
            citecolor={blue!50!black},
            urlcolor={blue!80!black}
	        pdfusetitle]
            {hyperref}

\RequirePackage[varg]{txfonts}
\RequirePackage{graphicx}
\newcommand{\putgovlogo}{\includegraphics[width=1cm]{indiaemblem.pdf}}


%****************** page layout ******************************
%% Adjusted to a4 paper (29.7 x 21 cm)

\usepackage[
%papersize={16cm,25.5cm},
width=15cm,
height=21cm,
marginparwidth=2cm,
includeall,
bindingoffset=1cm,
margin=2cm,
headheight=1.5cm,
heightrounded]{geometry}

%\RequirePackage[cam,a4,center]{crop}


%******************notations with nomecl***************************
\RequirePackage{ifthen}


%******************header-footer from fancyhdr.sty******************
\pagestyle{fancy}
% Heading marks
\renewcommand{\chaptermark}[1]{%
  \markboth{#1}{}
}
\renewcommand{\sectionmark}[1]{%
  \markright{\thesection \hspace{1em} #1}
}



% Heading format
\renewcommand{\headrulewidth}{0pt}
\fancyhead{} % clear old format
\fancyhead[LE,RO]{\bfseries\thepage}
\fancyhead[LO]{\bfseries\nouppercase\@shortactlabel]}
\fancyhead[RE]{\bfseries\nouppercase[\@shortactlabel}
\chead{\parbox[t]{8cm}{ \vskip 10pt  \textsl{\@title}}}

\fancypagestyle{actstart}{
 \chead{}
}

\cfoot{}

% %% redefine plain style
% \fancypagestyle{plain}{%
%   \fancyhf{} % clear all header and footer fields
%   \cfoot{{\small\thepage}}
%   \renewcommand{\headrulewidth}{0pt}
%   \renewcommand{\footrulewidth}{0pt}
% }

% this is to leave a page completely blank (without headers) when the
% document is used with a openright option (ref: fancyhdr.tex)

\renewcommand{\cleardoublepage}{%
  \clearpage\if@twoside \ifodd\c@page\else
  \hbox{}
  \thispagestyle{empty}
  \newpage
  \if@twocolumn\hbox{}\newpage\fi\fi\fi
}

%**********************Title page*************************************
% \title, and \date are already defined in report
% Some new commands are defined here
%**********************************************************************
\newcommand{\Usefont}[1]{\fontfamily{#1}\selectfont}

%% Indian date format DD Month YYYY
\renewcommand{\today}{%
\number\day\space%
\ifcase \month \or January\or February\or March\or April\or May%
\or June\or July\or August\or September\or October\or November\or December\fi%
\space\number\year
}
\gdef\@date{\today}

\nonstopmode   % Do not stop if the font is not available

%\global\let\@actlabel\@empty
%\def\actlabel#1{\gdef\@actlabel{#1}}

\newcommand\actlabel[2][]{%
  \gdef\@actlabel{#2}
  \gdef\@shortactlabel{#1}
}

\global\let\@actedition\@empty
\def\actedition#1{\gdef\@actedition{#1}}

\global\let\@actedyear\@empty
\def\actedyear#1{\gdef\@actedyear{#1}}

\global\let\@price\@empty
\def\price#1{\gdef\@price{#1}}


% \global\let\@assent\@empty
% \def\assent#1{\gdef\@assent{#1}}
\author{}



\renewcommand{\maketitle}{%
\begin{titlepage}
  %\marginparwidth=0pt
    \renewcommand{\baselinestretch}{1}\normalsize
  \thispagestyle{empty}
  \begin{center}
      \putgovlogo\par
      \vskip 10pt
      {\large Government of Maharashtra}\par
      {\Large Law and Judiciary Department}\par
      \vskip 40pt
    { \Huge \bfseries \@actlabel \par}
      \vskip 40pt
      { \huge \bfseries \@title \par}

      \vskip 60pt
      {\large (\@actedition)}

      
                
      \vspace{\stretch{0.2}}

{\small Printed in India by the Manager, Government Photozinco Press, Pune
and Published by the Director, Government Printing and Stationery,
Maharashtra State, Mumbai - 400 004}

{\small \bfseries \@actedyear}

      \vspace{\stretch{0.2}}

{\Large \bfseries [Price---\@price]}
      
    \end{center}
    \end{titlepage}
  } 


%**************************Copyright page******************************
\newcommand*{\mycopyright}{%
	\cleardoublepage\phantomsection 	
	\thispagestyle{empty}
	\setlength{\parindent}{0pt}	 
	 \vspace*{19cm} 
	{\itshape\copyright\,\footnotesize \@date, \\	
		All rights reserved}	
}



%*************************Abstract*************************************
\newenvironment{Abstract}[1][Abstract]{%	
\makeheadtoc{#1}\chapter*{#1}}{%	
}
%\renewcommand{\abstractname}{\Large Abstract}

% Adding toc into pdf bookmark

\renewcommand\tableofcontents{%
  
  \cleardoublepage
  \thispagestyle{actstart}
  \begin{center}
      {\Large \bfseries \scshape \@title}
  \end{center}
  
    \chapter*{\contentsname}
    \@starttoc{toc}%
    
    }


\newcommand*{\addintoc}[2][chapter]{%
	\addcontentsline{toc}{#1}{#2}\cleardoublepage\phantomsection
	}
\newcommand{\makeheadtoc}[1]{%
  \cleardoublepage\phantomsection
    \markboth{#1}{#1}
      \addcontentsline{toc}{chapter}{#1}
}

%% The macros for the  Acknowledgements, List of publications  
\newcommand*{\acknowledgments}[1][Acknowledgements]{%	
	\makeheadtoc{#1}
	\chapter*{#1}
}

\newcommand*{\listofpublications}[1][List of Publications]{%	
	\makeheadtoc{#1} 	
	\chapter*{#1}
}





%**************************Chapter style*****************************

\def\@makechapterhead#1{%
  %\vspace*{50\p@}% <----------------- space before Chapter #
  {\parindent \z@ \raggedright \normalfont
    \centering
        \bfseries\MakeUppercase\@chapapp\space \thechapter% <-- Chapter #
        \par\nobreak
        %\vskip 20\p@% <-------------- Space between Chapter # and title
    {\large \bfseries\scshape #1}\par\nobreak% <------------------ Chapter title
    %\vskip 40\p@% <------------------ Space between chapter title and first paragraph
  }}

\def\@makeschapterhead#1{%
  {\parindent \z@ \raggedright \normalfont
    \centering
    \bfseries\scshape #1\par\nobreak% <------------------ Chapter title
    %\vskip 40\p@% <------------------ Space between chapter title and first paragraph
  }}

\newcommand{\assent}[1]{(#1)}
\newcommand{\summary}[1]{#1}

%**********************Section/subsection styles********************

%In frontmatter everything comes with roman numbering  
\pagenumbering{roman}
\setcounter{page}{1}

\newcommand{\startact}[1]{%
  \cleardoublepage
  \pagenumbering{arabic}
  \thispagestyle{actstart}
  \setcounter{page}{1}
  \begin{center}
    {\large\bfseries\scshape\@actlabel}\footnote{#1}\par
    {[\scshape \@title]}
  \end{center}
}


\RequirePackage{etoolbox}
\patchcmd{\chapter}{\if@openright\cleardoublepage\else\clearpage\fi}{}{}{}
\patchcmd{\chapter}{\thispagestyle{plain}}{}{}{}

                    %
 
\renewcommand{\thechapter}{\Roman{chapter}}

% \def\@chapter[#1]#2{\ifnum \c@secnumdepth >\m@ne
%                          \refstepcounter{chapter}%
%                          \typeout{\@chapapp\space\thechapter.}%
%                          \addcontentsline{toc}{chapter}%
%                                    {\protect\numberline{\thechapter}#1}%
%                     \else
%                       \addcontentsline{toc}{chapter}{#1}%
%                     \fi
%                     \addtocontents{lof}{\protect\addvspace{10\p@}}%
%                     \addtocontents{lot}{\protect\addvspace{10\p@}}%
%                     }



\RequirePackage{remreset}
\@removefromreset{section}{chapter}


\RequirePackage[perpage,hang]{footmisc} 

\@removefromreset{footnote}{chapter}

%\RequirePackage{perpage} %the perpage package
%\MakePerPage{footnote} %the perpage package command




              
\renewcommand\thesection {\@arabic\c@section}
              
\def\section{\@startsection{section}{1}%
  \z@{-.7\baselineskip\@plus-\baselineskip}{.5\baselineskip}%
  {\normalfont\bfseries\hsize1\textwidth \raggedright}}

% \def\subsection{\@startsection{subsection}{2}%
%   \z@{.5\baselineskip\@plus.7\baselineskip}{\z@}%
%   {\normalfont}}

\RequirePackage{enumitem}
\newenvironment{subsectionlist}{%
  \begin{enumerate}[label=(\arabic*)]
  }{\end{enumerate}}

\newenvironment{clause}{%
  \begin{enumerate}[label=(\alph*)]
  }{\end{enumerate}}

\newenvironment{subclause}{%
  \begin{enumerate}[label=(\roman*)]
  }{\end{enumerate}}

\newcommand{\explanation}[1]{\emph{Explanation}: #1}

%\newcommand{\actref}[1]{\marginpar{\raggedright\footnotesize{#1}}}
\usepackage{marginnote}
\newcommand{\actref}[2][]{\marginnote{\footnotesize{#2}}[#1]}



%********************* Paragraph, line spacing********************
% Indentation 5 characters approx
% Paragraph spacing
% Line spacing (onehalfspacing is equal to baselinestretch 1.33)
%*****************************************************************
\parindent 5ex
%\setlength{\parskip}{1\baselineskip} 
\renewcommand{\baselinestretch}{1.15}


%**************************Widow and orphan************************
% Widow and orphan settings
% Requirements for the thesis format
% Orphan (removes single line at bottom of page)
% Widow (removes single line at top of page)
%*****************************************************************
\clubpenalty=10000  
\widowpenalty=10000	 

%**************************Other settings************************
\sloppy
\raggedbottom



\endinput

%======================================================================
% END FILE: `mhact.cls'
%======================================================================














