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
% *******************************************************************
\newif\if@billwithdocket
\newif\if@gazbilleng
\newif\if@gazacteng
\newif\if@reprint


\DeclareOption{billwithdocket}{%
  \@billwithdockettrue
}

\DeclareOption{gaz5a}{%
  \@gazbillengtrue
}

\DeclareOption{gaz8}{%
  \@gazactengtrue
}

\DeclareOption{reprint}{%
  \@reprinttrue
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
\RequirePackage{fancyhdr}
\RequirePackage[super]{nth}

\RequirePackage{xcolor}

\RequirePackage[bookmarks,%
            breaklinks,%
            backref=false,%
            pdfhighlight=/I,%
            pdffitwindow=true,%
            pdfstartview=Fit,%
            pdfcenterwindow=true,%
            colorlinks,
            linkcolor={red!50!black},
            urlcolor={blue!80!black},
            pdfpagelabels,
	        pdfusetitle]
            {hyperref}

            %citecolor={blue!50!black},

\RequirePackage{refcount}
\RequirePackage{graphicx}
\RequirePackage{pdfpages}
\RequirePackage{lastpage}

\RequirePackage[autostyle]{csquotes}
\MakeOuterQuote{"}


%%% Font specifications

%\RequirePackage[varg]{txfonts}
\RequirePackage{libertine}


\RequirePackage{fontspec}
\RequirePackage{polyglossia}
\setotherlanguages{sanskrit}



\newcommand{\putgovlogo}{\includegraphics[width=1.5cm]{india-emblem-shobhika.pdf}}

%****************** page layout ******************************
%% Adjusted to a4 paper (29.7 x 21 cm)

\usepackage[
%papersize={16cm,25.5cm},
%width=15cm,
%height=21cm,
%includeall,
%includeheadfoot,
includehead,
nofoot,
nomarginpar,
bindingoffset=1cm,
margin=2.5cm,
headheight=1.5cm,
heightrounded]{geometry}

%\RequirePackage[cam,a4,center]{crop}


%******************notations with nomecl***************************
\RequirePackage{ifthen}



  \newcommand{\devanagarinumeral}[1]{%
    \devanagaridigits{\number\csname c@#1\endcsname}}
  \newcommand{\themrpage}{\devanagarinumeral{page}}


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
\fancyhead[LE,RO]{\small\bfseries\thepage}
\fancyhead[LO]{\small\bfseries\nouppercase\@actname]}
\fancyhead[RE]{\small\bfseries\nouppercase[\@actname}
\fancyhead[CE]{\parbox[t]{8cm}{\small \textsl{\@shorttitle}}}
\fancyhead[CO]{\parbox[t]{8cm}{\small \textsl{\rightmark}}}

%\fancyhead[CE]{\textsl{\@shorttitle}}
%\fancyhead[CO]{\textsl{\rightmark}}


%\chead{\parbox[t]{8cm}{ \vskip 10pt  \textsl{\@title}}}
%\chead{\parbox[b]{8cm}{\textsl{\@shorttitle}}}


\fancypagestyle{actstart}{
  \fancyhead{}
  \cfoot{\small\bfseries\thepage}


  \if@gazbilleng
  \cfoot{
    \small
    \fontspec{Shobhika}[%
    Script=Devanagari,
    Mapping=devanagarinumerals,
    ]
    \themrpage
  }
  \fi

  \if@gazacteng
  \cfoot{
    \small
    \fontspec{Shobhika}[%
    Script=Devanagari,
    Mapping=devanagarinumerals,
    ]
    \themrpage
  }
  \fi
  

  
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

\newcommand{\shorttitle}[2][]{\gdef\@shorttitle{#1}\gdef\@title{#2}}

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


\newcommand\actnamealias[2]{%
  \gdef\@actname{#1}
  \gdef\@actalias{#2}
}

%%%%%  Generic definition for macros which need to set a variable %%%
%% Example
%% \global\let\@actedition\@empty
%% \def\actedition#1{\gdef\@actedition{#1}}

% https://tex.stackexchange.com/questions/451/when-to-use-edef-noexpand-and-expandafter

%% This will define a macro {#2} set by the call {#1}
%% Eg:
%% \macroval{docvar}{clsvar}
%%
%% \docvar{some value} in the document
%% "some value" will be assigned to clsvar, which can be used in the
%% page compositions in the document class design

\newcommand{\macroval}[2]{%
  \global\expandafter\let\csname #2\endcsname \@empty
  \expandafter\def\csname #1\endcsname##1 {\expandafter\gdef \csname #2\endcsname {##1}}
}

\macroval{actedition}{@actedition}
\macroval{actedyear}{@actedyear}
\macroval{introducer}{@introducer}
\macroval{introdesig}{@introdesig}
\macroval{introdate}{@introdate}


\macroval{psmla}{@psmla}
\macroval{intimation}{@intimation}

\macroval{assemblydate}{@assemblydate}
\macroval{councildate}{@councildate}


%\macroval{longtitle}{@longtitle}
\macroval{assent}{@assent}

%%% Printer Metadata %%%
\macroval{printRNInumber}{pr@rnino}
\macroval{printVarshSerial}{pr@varshser}
\macroval{printAnk}{pr@ank}
\macroval{printAnkSerial}{pr@ankser}
\macroval{printDiwas}{pr@diwas}
\macroval{printTarikh}{pr@tarikh}
\macroval{printMarathiTarikh}{pr@mrtarikh}
\macroval{printPrice}{pr@price}
\macroval{printASKramank}{pr@ask}
\macroval{printIntimation}{pr@intimation}
\macroval{printIntAuth}{pr@intauth}


\newcommand{\makeheadtoc}[1]{%
  \cleardoublepage\phantomsection
    \markboth{#1}{#1}
      \addcontentsline{toc}{chapter}{#1}
}

\RequirePackage{xifthen}
\newcommand{\attachpdf}[3][]{%
  \makeheadtoc{#2}
  \includepdf[#1, pages=-, pagecommand={\pagestyle{fancy}},%
  templatesize={20cm}{20cm}]{#3}

}


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
    { \Huge \bfseries \@actalias \par}
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


\newcommand{\makedocket}{%
%  \begin{titlepage}
  \clearpage

    \pagenumbering{Alph}
    \thispagestyle{empty}
    \nolinenumbers
    %\twocolumn
    .\hfill\begin{minipage}[t][\textheight]{0.5\textwidth}
      \begin{flushright}
      \textsc{Maharashtra Legislature Secretariat} \par

      \vspace{\stretch{1}}
      
      {\large \@actalias\par}

      \vspace{\stretch{0.3}}

      \begin{minipage}{\linewidth}
        \@longtitle
      \end{minipage}
    
      \vspace{\stretch{0.3}}
    \end{flushright}
    

    \begin{flushright}
      \vskip 20pt
      \@introducer\par\@introdesig

      \vskip 20pt
      %\textbf{\@intimation}
      \ifthenelse{\equal{\@assemblydate}{}}{}{\textbf{[As passed by the
        Legislative Assembly on \@assemblydate]}}

    \vskip 20pt
    
      \ifthenelse{\equal{\@councildate}{}}{}{\textbf{[As passed by the
        Legislative Council on \@councildate]}}

      
      \vskip 20pt

      \@psmla,\\
      Principal Secretary,\\
      Maharashtra Legislative Assembly
    \end{flushright}

    \vspace{\stretch{0.5}}

    \begin{flushright}
      \rule{\linewidth}{0.5pt}\\
      Government Central Press, Mumbai
    \end{flushright}
  \end{minipage}
  
%\end{titlepage}
  
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



%*************************  Cover pages *************************************

\newcommand\billcoverpage{%
  
  \begin{center}
    
    {\huge \@actalias \vskip 40pt

      \Large \bfseries \scshape \@title}

    \vskip 40pt
    
      \ifthenelse{\equal{\@assemblydate}{}}{}{\textbf{[As passed by the
        Legislative Assembly on \@assemblydate]}}

    \vskip 20pt
    
      \ifthenelse{\equal{\@councildate}{}}{}{\textbf{[As passed by the
        Legislative Council on \@councildate]}}
    
  \end{center}
  
    \chapter*{\contentsname}
    \@starttoc{toc}%

    \cleardoublepage

  \begin{center}
    {\large\bfseries\scshape\@actalias}
    \par{[\scshape \@title]}
  \end{center}

    
    
    }


\newcommand\reprintcoverpage{%
  
  \begin{center}
    
    {\huge \@actalias \vskip 40pt

      \Large \bfseries \scshape \@title}
    
  \end{center}
  
    \chapter*{\contentsname}
    \@starttoc{toc}%

    \cleardoublepage

  \begin{center}
    {\large\bfseries\scshape\@actalias}
    % \ifx#1\@empty
    % \else\footnote{#1}
    % \fi
    \par{[\scshape \@title]}
  \end{center}

    
    }
    

\newcommand{\rowstyle}[1]{{\small \bfseries #1}}

\newcommand{\gazEngQuota}{%


  
  %%% Reset and construct Gazette headers
  \fancyhead{} % clear old format
  \fancyhead[LE,RO]{\small
    \fontspec{Shobhika}[%
    Script=Devanagari,
    Mapping=devanagarinumerals,
    ]
    \themrpage
  }
  \fancyhead[C]{
    \fontspec{Shobhika}[%
    Script=Devanagari,
    Mapping=devanagarinumerals,
    Scale=.9
    ]
    \small\bfseries
    महाराष्ट्र शासन राजपत्र \pr@gazpart, \pr@tarikh / \pr@mrtarikh
  }

\begin{flushright}
  \hspace{\fill} \textbf{RNI No.: \pr@rnino}
\end{flushright}


\begin{center}
  \putgovlogo

  \vskip 40pt

  \fontspec{Shobhika}[%
  Script=Devanagari,
  Mapping=devanagarinumerals,
  Scale=.9
  %SizeFeatures={Size=-10}
  ]

{\Huge \bfseries महाराष्ट्र शासन राजपत्र}
  \vskip 20pt

{\LARGE \bfseries \pr@gazpart}

\rule[-\baselineskip]{\linewidth}{2pt}\\
\rule[4pt] {\linewidth}{0.5pt}\\ % Raising to 4pt centers the text vertically between the lines
  \rowstyle{वर्ष \pr@varshser, अंक \pr@ank\ (\pr@ankser)]} \hspace{\fill}
  \rowstyle{\pr@diwas, \pr@tarikh / \pr@mrtarikh} 
  \hspace{\fill}
  \rowstyle{ [ पृष्ठे
    \devanagaridigits{\number\getpagerefnumber{LastPage}},
    किंमत: रुपये  \pr@price }  \\   % ₹   ]
\rule{\linewidth}{0.5pt}\\
\rule[\baselineskip]{\linewidth}{2pt}

\textbf{असाधारण क्रमांक \pr@ask }

  \vskip 20pt

{\large\bfseries प्राधिकृत प्रकाशन }

  \vskip 20pt

{\bfseries \pr@mrint}

  \vskip 20pt
  \end{center}

{\pr@intimation :--}

  \vskip 20pt

  \begin{center}
    {\large\bfseries\scshape\@actalias}

  \end{center} 
  
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

%\newcommand{\assent}[1]{(#1)}
%\newcommand{\longtitle}[1]{\gdef\@longtitle{#1}}
\newcommand{\longtitle}[1]{
  \gdef\@longtitle{#1}
  \emph{#1}

  \vskip 10pt }
\newcommand{\enactingtext}[1]{#1 :--}
\newcommand{\intro}[1]{#1}
\newcommand{\content}[1]{#1}

%**********************Section/subsection styles********************

%In frontmatter everything comes with roman numbering  
\pagenumbering{roman}
\setcounter{page}{1}

\newcommand{\startact}[1][]{%

  \cleardoublepage
  \setcounter{page}{1}
  \pagenumbering{arabic}
  \thispagestyle{actstart}



  \if@billwithdocket
    \billcoverpage
    \linenumbers\relax% Start numbering lines
    % \runninglinenumbers
    \modulolinenumbers % every 5 by default
    \AtEndDocument{\makedocket}  
  \fi
  
  \if@gazbilleng
    \gdef\pr@gazpart{असाधारण भाग पाच-अ}
    \gdef\pr@mrint{
      महाराष्ट्र विधानसभेत  व महाराष्ट्र विधानपरिषदेत सादर केलेली विधेयके
      (इंग्रिजी अनुवाद).
    }
    \gazEngQuota

    \begin{center}
      {\bfseries\scshape Maharashtra Legislature Secretariat}
    \end{center}
    
  \fi

  \if@gazacteng
    \gdef\pr@gazpart{असाधारण भाग आठ}
    \gdef\pr@mrint{महाराष्ट्र विधानमंडळाचे अधिनियम व राज्यपालांनी प्रख्यापित
      केलेले अध्यादेश व केलेले विनियम आणि विधी व न्याय विभागाकडून आलेली विधेयके
      (इंग्रिजी अनुवाद). 
      }
    \gazEngQuota
  \fi
  

  \if@reprint
    \reprintcoverpage
  \fi
}


\RequirePackage{etoolbox}
\patchcmd{\chapter}{\if@openright\cleardoublepage\else\clearpage\fi}{}{}{}
\patchcmd{\chapter}{\thispagestyle{plain}}{}{}{}

\RequirePackage{lineno}
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
\newenvironment{subsectionlist}[1][99]{%
  \begin{enumerate}[label=(\arabic*)]
    \settowidth{\leftmargin}{#1}
  }{\end{enumerate}}

\newenvironment{clause}{%
  \begin{enumerate}[label=(\alph*)]
  }{\end{enumerate}}

\newenvironment{subclause}{%
  \begin{enumerate}[label=(\roman*)]
  }{\end{enumerate}}


\newenvironment{sor}{%
  \makeheadtoc{Statement of Objects and Reasons}
  \nolinenumbers
  \chapter*{Statement of Objects and Reasons}
  %\addcontentsline{toc}{chapter}{Statement of Objects and Reasons}
  %\cleardoublepage
  

  \begin{enumerate}[label=\arabic*.]
  }{%
  \end{enumerate}

  \begin{tabular}{p{0.3\linewidth}p{0.6\linewidth}}
    & \\ % without this dummy line the table does not span the width
    Mumbai & \multicolumn{1}{r}{\@introducer} \\
    \@introdate & \multicolumn{1}{r}{\@introdesig} \\
  \end{tabular} 
}


\newenvironment{dllist}{%
  \begin{enumerate}[label=\emph{Section}]
  }{\end{enumerate}}

\newenvironment{mrdl}{%
  \makeheadtoc{Memorandum Regarding Delegated Legislation}
  %\cleardoublepage
  \nolinenumbers
  \chapter*{Memorandum Regarding Delegated Legislation}
  %\addcontentsline{toc}{chapter}{Memorandum Regarding Delegated Legislation}
  

  \intro{The Bill involves the following proposals for delegation of legislative
    powers, namely:---}
}{

\noindent The above proposals for delegation of legislative powers are of a
 normal character. 
}



\newcommand{\explanation}[1]{\emph{Explanation}: #1}

%\newcommand{\actref}[1]{\marginpar{\raggedright\footnotesize{#1}}}
%\usepackage{marginnote}
%\newcommand{\actref}[2][]{\marginnote{\footnotesize{#2}}[#1]}
%\newcommand{\actref}[1]{\footnote{\footnotesize{#1}}}

%\newcommand{\actref}[4]{\unskip\marginpar{\footnotesize{#1} {#3} of {#2}.}}

%\newcommand{\actref}[4]{\unskip\footnote{\footnotesize{#1} {#3} of {#2}.}}
\newcommand{\actref}[4]{%
  \href{http://legislation.maharashtra.gov.in/acts/#1/#2/#3}{[{#1}
    {#3} of {#2}]}}

%********************* Paragraph, line spacing********************
% Indentation 5 characters approx
% Paragraph spacing
% Line spacing (onehalfspacing is equal to baselinestretch 1.33)
%*****************************************************************
\parindent 5ex
%\setlength{\parskip}{1\baselineskip} 
%\renewcommand{\baselinestretch}{1.15}

\renewcommand{\baselinestretch}{1}


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














