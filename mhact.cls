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
\newif\if@default
\newif\if@billwithdocket
\newif\if@gazFiveA
\newif\if@gazEight
\newif\if@reprint
\newif\if@ordinance


\DeclareOption{default}{%
  \@defaulttrue
}

\DeclareOption{billwithdocket}{%
  \@billwithdockettrue
}

\DeclareOption{gaz5a}{%
  \@gazFiveAtrue
}

\DeclareOption{gaz8}{%
  \@gazEighttrue
}

\DeclareOption{reprint}{%
  \@reprinttrue
}


\DeclareOption{ordinance}{%
  \@ordinancetrue
}


%*****************************************************************
% Process given options
% Defaults
%****************************************************************** 
\DeclareOption*{\PassOptionsToPackage{\CurrentOption}{report}}  

\ProcessOptions
\LoadClass[12pt,a4paper,openright,twoside]{report}





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

%\RequirePackage[autostyle,autopunct]{csquotes}
%\MakeAutoQuote{"}{"}
%\MakeOuterQuote{"}
%\MakeInnerQuote{"}

\RequirePackage{tabularx}

\RequirePackage{comment}

\excludecomment{gaz5a}
\excludecomment{gaz8}


\if@gazFiveA
  \includecomment{gaz5a}
  \excludecomment{gaz8}
\fi  

\if@gazEight
  \includecomment{gaz8}
  \excludecomment{gaz5a}
\fi


\RequirePackage{titlesec}
\RequirePackage{titletoc}

\RequirePackage{soul}
% \soulregister{\enquote}{1}


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
%includehead,
%includefoot,
%margin=2cm,
%heightrounded,
includeheadfoot,
nomarginpar,
top=1cm,
headheight=1.5cm,
headsep=0.5cm,
footskip=0.5cm,
bottom=3cm, % needed for space below footnote, At 2cm has hardly 0.5cm actual 
left=2.5cm,
right=2.5cm,
bindingoffset=0.5cm,
]{geometry}

%\parindent=0pt
%\setlength{\parskip}{\baselineskip}
\setlength{\parskip}{1ex plus 1ex minus 1pt}
%\setlength{\parindent}{3em}


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


  \if@gazFiveA
  \cfoot{
    \small
    \fontspec{Shobhika}[%
    Script=Devanagari,
    Mapping=devanagarinumerals,
    ]
    \themrpage
  }
  \fi

  \if@gazEight
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

% \long is needed to capture arguments with blank lines
\newcommand{\macroval}[2]{%
  \global\expandafter\let\csname #2\endcsname \@empty
  \long\expandafter\def\csname #1\endcsname##1 {\expandafter\gdef \csname
    #2\endcsname {##1}}
}

\macroval{actedition}{@actedition}
\macroval{actedyear}{@actedyear}
\macroval{introducer}{@introducer}
\macroval{introdesig}{@introdesig}
%\macroval{introdate}{@introdate}

\macroval{originDepartment}{@orgdept}

\macroval{psmla}{@psmla}
%\macroval{intimation}{@intimation}


% \newcommand{\longtitle}[1]{
%   \gdef\@longtitle{#1}
% }
\macroval{longtitle}{@longtitle}
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
%\macroval{printIntimation}{pr@intimation}
%\macroval{printIntAuth}{pr@intauth}
%\macroval{publisherAddress}{pr@address}
\macroval{coveringNoteSlip}{pr@covnote}
\macroval{amendlastdate}{pr@amenddate}
\macroval{reprintYear}{pr@reprintyr}
\macroval{reprintPrice}{pr@reprintpr}
\macroval{amendPrologue}{@amendprologue}
\macroval{sorref}{@sorref}


%%% Other Containers
\macroval{prologue}{@prologue}
\macroval{sorSignature}{@sorSignature}
\macroval{mrdlSignature}{@mrdlSignature}


%% Append text to existing command
%% https://tex.stackexchange.com/a/317781/33945
%% https://tex.stackexchange.com/a/1057/33945
\newcommand*{\workflowsteps}{}
\newcommand*\workflowstep[1]
  {\ifx\workflowsteps\empty
     \def\workflowsteps{[#1]}%
   \else
     \g@addto@macro\workflowsteps{ \par \vfill \par [#1]}%
   \fi}

 
\newcommand{\makeheadtoc}[1]{%
  \cleardoublepage\phantomsection
    \markboth{#1}{#1}
      \addcontentsline{toc}{chapter}{#1}
}

\RequirePackage{xifthen}
\newcommand{\attachpdf}[3][]{%
  \makeheadtoc{#2}

  \ifthenelse{\equal{#1}{landscape}}{%landscape
    \includepdf[#1, pages=-, pagecommand={\pagestyle{fancy}},%
    templatesize={20cm}{20cm}]{#3}
  }{% portrait
    \includepdf[pages=-, pagecommand={\pagestyle{fancy}}]{#3}
  }

}



\author{}



\renewcommand{\maketitle}{%
\begin{titlepage}
  %\marginparwidth=0pt
    \renewcommand{\baselinestretch}{1}\normalsize
  \thispagestyle{empty}
  \begin{center}
      \putgovlogo\par
      %\vskip 10pt

      {\large Government of Maharashtra}\par
      {\Large Law and Judiciary Department}\par
      
      %\vskip 40pt
    { \Huge \bfseries \@actalias \par}
      %\vskip 40pt
      { \huge \bfseries \@title \par}

      %\vskip 60pt
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

      \textbf{\worflowsteps}
      
      %\textbf{\@intimation}
      % \ifthenelse{\equal{\@assemblydate}{}}{}{\textbf{[As passed by the
      %   Legislative Assembly on \@assemblydate]}}

    % \vskip 20pt
    
    %   \ifthenelse{\equal{\@councildate}{}}{}{\textbf{[As passed by the
    %     Legislative Council on \@councildate]}}

      
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




%*************************  Cover pages *************************************


\newcommand\billcoverpage{%

  
  \begin{center}

    \if@ordinance
      \large \@orgdept
    \fi
    
    
    {\Large \@actalias}

    \vskip 40pt

    {\Large \bfseries \scshape \@title}

    \vskip 40pt
    

    \textbf{\workflowsteps}

  \end{center}
  
    \chapter*{\contentsname}

    \pagenumbering{roman}
    \thispagestyle{empty}
    \setcounter{page}{1}
    \@starttoc{toc}%

    
    \cleardoublepage
    \setcounter{page}{1}
    \pagenumbering{arabic}
    \thispagestyle{empty}

    \@prologue

    \ifx\@prologue\empty
    \else
    \cleardoublepage
    \fi
 
    

  \begin{center}

    \if@ordinance
      \@orgdept
    \fi
    
    
    {\large\bfseries\scshape\@actalias}
    \par{[\scshape \@title]}

    \vskip 20pt
    
    \emph{\@longtitle}
    
  \end{center}

    
    
    }


\newcommand\reprintcoverpage{%
  \thispagestyle{empty}
  

  \begin{center}
      \putgovlogo\par

      {\large \scshape Government of Maharashtra}

      {\Large \scshape Law and Judiciary Department}

      \vspace{\stretch{1}}

      {\huge \bfseries \@actalias \vskip 40pt

      \Large \bfseries \@title}

      \vspace{\stretch{3}}

      ({\itshape \pr@amenddate})

      \vfill
      
      \includegraphics[width=1cm]{flowericon.pdf}
      
      \vfill

      {\small Printed in India by The Manager, Government Central
        Press, Mumbai, and published by The Director, Government
        Printing, Stationary and Publications, Maharashtra State,
        Mumbai 400 004}

      {\bfseries\pr@reprintyr}

      {[Price---Rs. \pr@reprintpr]}
    
  \end{center}
  
  \clearpage
    \begin{center}
      {\large \bfseries \@title}
      
      \rule{0.25\linewidth}{0.5pt}
    \end{center}

  
    \chapter*{\contentsname}
    \pagenumbering{roman}
    \setcounter{page}{1}
    \@starttoc{toc}%
    \thispagestyle{actstart}
    
    \cleardoublepage

    \pagenumbering{arabic}
    \setcounter{page}{1}
    \thispagestyle{empty}

  \begin{center}
    {\large\bfseries\scshape\@actalias}\footnoteD{\@sorref}
    %{\large\bfseries\scshape\@actalias}\footnote{\@sorref}
    % \ifx#1\@empty
    % \else\footnote{#1}
    % \fi
    \par{[\scshape \@title]}

    \ifx\@assent\empty
    \else
      {\bfseries (\@assent)}
    \fi
  \end{center}
  
  \noindent\@amendprologue

  \ifx\@amendprologue\empty
  \else
  \clearpage
  \fi
    
} % reprintcoverpage
    

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

    % \vskip 20pt

    \fontspec{Shobhika}[%
    Script=Devanagari,
    Mapping=devanagarinumerals,
    Scale=.9
    % SizeFeatures={Size=-10}
    ]

    {\Huge \bfseries महाराष्ट्र शासन राजपत्र}
    % \vskip 20pt

    {\LARGE \bfseries \pr@gazpart}

    \rule[-\baselineskip]{\linewidth}{2pt}\\
    \rule[4pt] {\linewidth}{0.5pt}\\ % Raising to 4pt centers the text vertically between the lines
    \rowstyle{वर्ष \pr@varshser, अंक \pr@ank\
      \ifx\pr@ankser\empty\else(\pr@ankser) \fi ]} \hspace{\fill}
    \rowstyle{\pr@diwas, \pr@tarikh / \pr@mrtarikh} 
    \hspace{\fill}
    \rowstyle{ [ पृष्ठे % ]
      \devanagaridigits{\number\getpagerefnumber{LastPage}},
      किंमत: ₹ \pr@price }  \\   % ₹  रुपये   
    \rule{\linewidth}{0.5pt}\\
    \rule[\baselineskip]{\linewidth}{2pt} \\
    \textbf{असाधारण क्रमांक \pr@ask } \\
    \vskip 10pt
    {\large\bfseries प्राधिकृत प्रकाशन }
    
    % \vskip 20pt
    
    {\bfseries \pr@mrint}
    
    % \vskip 20pt
    \ifx\pr@covnote\empty
    \else
    \parbox{\linewidth}{\pr@covnote}
    % \noindent\includegraphics[width=\linewidth]{\pr@covnote}
    % \vskip 10pt
    % \rule{5em}{1pt}
    \fi
  \end{center}
  
  % \vskip 20pt

  \@prologue

  \ifx\@prologue\empty
  \else
  \clearpage
  \fi
  
  

  \if@ordinance
  \begin{center}
    \@orgdept
  \end{center}
  \fi
  

  % \vskip 20pt

  \begin{center}
    {\large\bfseries\scshape\@actalias}


    \ifx\@assent\empty
    \else
      {(\emph{\@assent})}
    \fi

    %\vskip 10pt 
    
    \emph{\@longtitle}
    
    %\vskip 10pt 
    
  \end{center} 
  
} %  End gazEngQuota


    

%**************************Chapter style*****************************

\def\@makechapterhead#1{%
  %\vspace*{50\p@}% <----------------- space before Chapter #
  {\parindent \z@ \raggedright \normalfont
    \centering
        \bfseries\MakeUppercase\@chapapp\space \thechapter% <-- Chapter #
	%\vskip 5\p@
        \par\nobreak
        \vskip -10\p@%
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


\newcommand{\enactingtext}[1]{#1}
\newcommand{\intro}[1]{#1}
\newcommand{\content}[1]{#1}

%**********************Section/subsection styles********************

%In frontmatter everything comes with roman numbering  
\pagenumbering{roman}
\setcounter{page}{1}

\newcommand{\startact}[1][]{%

  % \cleardoublepage
  % \setcounter{page}{1}
  % \pagenumbering{arabic}
  % \thispagestyle{actstart}

  \if@default
    \billcoverpage
  \fi


  \if@billwithdocket
    \billcoverpage
    \linenumbers\relax% Start numbering lines
    % \runninglinenumbers
    \modulolinenumbers % every 5 by default
    \AtEndDocument{\makedocket}  
  \fi
  
  \if@gazFiveA
    \setcounter{page}{1}
    \pagenumbering{arabic}
    \thispagestyle{actstart}
    \gdef\pr@gazpart{असाधारण भाग पाच-अ}
    \gdef\pr@mrint{
      महाराष्ट्र विधानसभेत  व महाराष्ट्र विधानपरिषदेत सादर केलेली विधेयके
      (इंग्रजी  अनुवाद).
    }
    \gazEngQuota
    
  \fi

  \if@gazEight
    \setcounter{page}{1}
    \pagenumbering{arabic}
    \thispagestyle{actstart}
    \gdef\pr@gazpart{असाधारण भाग आठ}
    \gdef\pr@mrint{महाराष्ट्र विधानमंडळाचे अधिनियम व राज्यपालांनी प्रख्यापित
      केलेले अध्यादेश व केलेले विनियम आणि विधि व न्याय विभागाकडून आलेली विधेयके
      (इंग्रजी अनुवाद). 
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



%%% Amendments, commentary, footnotes, marginnotes
%\RequirePackage[perpage,hang]{footmisc} 
\RequirePackage[hang,stable]{footmisc} 
%% hang for indented footnotes

\RequirePackage{manyfoot}
\RequirePackage[ruled]{bigfoot}
% some footnotes appear in pages before with bigfoot
\RequirePackage{longtable}
\@removefromreset{footnote}{chapter}

% \def{\mfr}{%
%   \kern -3pt
%   \hrule width 7in 
%   \kern 2pt
% }

\SelectFootnoteRule{default}
\DeclareNewFootnote{D}

\newcommand{\Mfootnoterule}{\noindent\rule{0.5\linewidth}{0.5pt}\\\noindent\footnotesize
  \smash{Marginal Citations:} \vspace{2mm}}
%\SelectFootnoteRule[1]{R}[\noindent\footnotesize \smash{Act Refs.:}\vspace{2mm}]
\SelectFootnoteRule[1]{M}
\DeclareNewFootnote{M}[alph]



%\newcommand{\Ffootnoterule}{\mfr\par\noindent\footnotesize Amendments (Textual): \vspace{2mm}}
%\newcommand{\Ffootnoterule}{\footnoterule\par\noindent\footnotesize Amendments (Textual): \vspace{2mm}}
\newcommand{\Ffootnoterule}{\noindent\rule{0.5\linewidth}{0.5pt}\\\noindent\footnotesize
  \smash{Amendments (Textual):}\vspace{2mm}} 
\SelectFootnoteRule[1]{F}
\DeclareNewFootnote{F}


\newcommand{\Ifootnoterule}{\noindent\smash{\rule{0.5\linewidth}{0.5pt}}\\%
  \noindent\footnotesize \smash{Commencement Information:} \vspace{2mm}}
% \newcommand{\Ifootnoterule}{\defaultfootnoterule\\%
%    \noindent\footnotesize \smash{Commencement Information:} \vspace{2mm}}
\SelectFootnoteRule[1]{I}
%\SelectFootnoteRule{default}
\DeclareNewFootnote{I}

\newcommand{\Cfootnoterule}{\noindent\smash{\rule{0.5\linewidth}{0.5pt}}\\%
  \noindent\footnotesize Modifications etc. (not altering text):\vspace{2mm}}
\SelectFootnoteRule[1]{C}
\DeclareNewFootnote{C}


\setlength{\skip\footinsF}{0pt}
\setlength{\skip\footinsI}{0pt}
\setlength{\skip\footinsC}{0pt}
\setlength{\skip\footinsM}{0pt}


\newcommand\manyfoottarget{\makebox[0pt][r]{\hypertarget{Hfootnote.\theHfootnote
}\quad}}
\patchcmd\MFL@fnoteplain{\rule}{\manyfoottarget\rule}{}{\fail}
%% Needed to get hyperlinks working with manyfoot
%% https://tex.stackexchange.com/a/498999/33945



\renewcommand{\thefootnoteM}{M\arabic{footnoteM}}
\renewcommand{\thefootnoteC}{C\arabic{footnoteC}}
\renewcommand{\thefootnoteI}{I\arabic{footnoteI}}
\renewcommand{\thefootnoteF}{F\arabic{footnoteF}}

\newcommand{\citenote}[2]{%
  %% Takes two arguments: \citenote{uniqkey}{actref}
  %% inserts the marker at the location as well as the foonote
  \footnoteM{#2\label{fnm:#1}}}

\newcommand{\Cnote}[2]{%
  %% Takes two arguments: \Cnote{uniqkey}{Foonote Text}
  %% Does not insert the marker. Has to be explicitly inserted using a
  %% \Cnoteref{} command. This is so that the same marker can be
  %% referred in multiple locations
  %% \Cnote{} and \Cnoteref{} must appear in the same page
  \stepcounter{footnoteC}%
  \FootnotemarkC{\thefootnoteC}%
  \FootnotetextC{\thefootnoteC}{#2\label{fnc:#1}}}

  %\footnotetextC[\thefootnoteC]{#2\label{fnc:#1}}}
  %% plain footnotetextC throws an error in the presence of hyperref
  %% when thefootnote has a prefix C

\newcommand{\Inote}[2]{%
  %% Takes two arguments: \Inote{uniqkey}{Foonote Text}
  %% Does not insert the marker. Has to be explicitly inserted using a
  %% \Inoteref{} command. This is so that the same marker can be
  %% referred in multiple locations
  %% \Inote{} and \Inoteref{} must appear in the same page
  \stepcounter{footnoteI}%
  \FootnotemarkI{\thefootnoteI}%
  \FootnotetextI{\thefootnoteI}{#2\label{fni:#1}}}

%\newsavebox{\fnbox}

\newcommand{\Fnote}[2]{%
  %% Takes two arguments: \Fnote{uniqkey}{Amendment Note}
  %% Does not insert the marker. Has to be explicitly inserted using a
  %% pair of \FnoteBegin{} \FnoteEnd commands.
  %% This is so that the same marker can be
  %% referred in multiple locations
  %% \Fnote{} and \FnoteBegin{} must appear in the same page
  %% \FnoteEnd{} can appear in another page
  %
  % Keeping these two lines here leads to enumerate label overlapping
  % with page footnote
   % \stepcounter{footnoteF}%
   % \FootnotetextF{\thefootnoteF}{#2\label{fnf:#1}}%
    % \savebox{\fnbox}{%
    % \footnoteF{#2\label{fnf:#1}}[ 
    % }
    %%   Peek next command to decide placement of prefix mark
    %%   https://tex.stackexchange.com/a/348945/33945
    \@ifnextchar\lblitem{%
      % % None of the fnf labels are defined 
      % \renewcommand{\lblprehook}{\usebox{\fnbox}}
      % }{\usebox{\fnbox}}%
      %   
      %   along with stepcounter and FootnotetextF above, sets correct marks
      %   and refs, but marks not hyperlined to page and refs hyperlinked
      %   to wrong page 
      \stepcounter{footnoteF}%
      \FootnotetextF{\thefootnoteF}{#2\label{fnf:#1}}%
      \renewcommand{\lblprehook}{\FootnotemarkF{\thefootnoteF}[}%
    }{%
        %\ifx\protect\@typeset@protect
        % Keeping this line here leads to enumerate label overlapping
        % with page footnote
        % \FootnotemarkF{\thefootnoteF}[%
        \footnoteF{#2\label{fnf:#1}}[%
        %\else
        %  \relax
        %\fi
      }
    % 
    % ref displays the number of the current item and not footnote
    % \renewcommand{\lblprehook}{\footnoteF{#2}\label{fnf:#1}[}
    % }{\footnoteF{#2\label{fnf:#1}}}%
    %   
    %   fnf:F11 undefined
    %   \renewcommand{\lblprehook}{\footnoteF{#2\protect\label{fnf:#1}}[}
    % }{\footnoteF{#2\label{fnf:#1}}}%
    %   
    %   
    %   This also does not define \label fnf:F11
    %   \renewcommand{\lblprehook}{%
    %   \stepcounter{footnoteF}%
    %   \FootnotetextF{\thefootnoteF}{#2\label{fnf:#1}}%
    %   \FootnotemarkF{\thefootnoteF}[}%
    % }{\footnoteF{#2\label{fnf:#1}}[}%
  % \else%
  %   \relax%
  % \fi%
}
  


 
\newcommand{\Mnoteref}[1]{\protect\footref{fnm:#1}}
\newcommand{\Cnoteref}[1]{\protect\footref{fnc:#1}}
\newcommand{\Inoteref}[1]{\footref{fni:#1}}
\newcommand{\FnoterefBegin}[1]{\footref{fnf:#1}[\ignorespaces}
\newcommand{\FnoterefEnd}[1]{]\footref{fnf:#1}}




%% Amendments for insertion and deletion, with uniqkey
\newenvironment{amendins}[2]{\def\mylab{cf:#1}\footnoteF{#2\label{\mylab}}[\ignorespaces}{\ifhmode\unskip\fi]\footref{\mylab}}
%% removes the additional space after [ and before ]
%%% Ref. David Carlisle: https://tex.stackexchange.com/a/179034/33945
\newcommand{\amenddel}[2]{\def\mylab{cf:#1}\footnoteF{#2\label{\mylab}}[ * * * * ]\footref{\mylab}}

%\newenvironment{amendins}[1]{\footnoteF{#1}[\ignorespaces}{ \ifhmode\unskip\fi]\Footnotemark\thefootnoteF}

% \newcommand\amenddel[1]{\footnoteF{#1}[ * * * ]\Footnotemark\thefootnoteF}

\newcommand{\actref}[4]{%
  %\href{http://legislation.maharashtra.gov.in/acts/#1/#2/#3}{[{#1}{#3} of {#2}]}}
   \ifx\hfuzz#1\hfuzz % https://tex.stackexchange.com/a/53091/33945
     \ifx\hfuzz#4\hfuzz % https://tex.stackexchange.com/a/53091/33945
       \href{http://legislation.maharashtra.gov.in/acts/india/#2/#3}{{#3} of {#2}}
     \else
       \href{http://legislation.maharashtra.gov.in/acts/india/#2/#3/#4}{{#3}
         of {#2}, s.~{#4}}
     \fi
   \else
     \ifx\hfuzz#4\hfuzz % https://tex.stackexchange.com/a/53091/33945
       \href{http://legislation.maharashtra.gov.in/acts/#1/#2/#3}{{#1} {#3} of {#2}}
     \else
      \href{http://legislation.maharashtra.gov.in/acts/#1/#2/#3/#4}{%
        {#1} {#3} of {#2}, s.~{#4}} 
     \fi
   \fi
}

              
\renewcommand\thesection {\@arabic\c@section}
              
% \def\section{\@startsection{section}{1}%
%   \z@{-.7\baselineskip\@plus-\baselineskip}{.5\baselineskip}%
%   {\normalfont\bfseries\hsize1\textwidth \raggedright}}


\RequirePackage{enumitem}

%% The following code will force label to be specified
%% The explicit label is specified by \lblitem{num}

\def\lblprehook{}
\newcommand{\lblitem}[1]{%
  \def\lblnum{#1} \item%
  \def\lblprehook{}%
}

\newenvironment{subsectionlist}[1][99]{%
  \begin{enumerate}[topsep=0pt,partopsep=0pt,parsep=0.5\parsep,
    label=\protect\lblprehook(\emph{\protect\lblnum})]
    \settowidth{\leftmargin}{#1}
  }{\end{enumerate}}

\newenvironment{clause}{%
  \begin{enumerate}[topsep=0pt,partopsep=0pt,parsep=0.5\parsep,
    label=(\protect\lblnum)]
  }{\end{enumerate}}

\newenvironment{subclause}{%
  \begin{enumerate}[topsep=0pt,partopsep=0pt,parsep=0.5\parsep,
    label=(\protect\lblnum)]
  }{\end{enumerate}}



\newenvironment{sor}{%
  \if@ordinance
    \makeheadtoc{Statement}
    \chapter*{Statement}
  \else
    \makeheadtoc{Statement of Objects and Reasons}
    \chapter*{Statement of Objects and Reasons}
  \fi

  
  \nolinenumbers

  }{%
  \tabcolsep=0pt
  \noindent\@sorSignature
}

\newenvironment{sorlist}{%
  \begin{enumerate}
}{\end{enumerate}}


\newenvironment{dllist}{%
  \begin{enumerate}[label=\emph{Clause}]
  }{\end{enumerate}}

\newenvironment{mrdl}{%
  \makeheadtoc{Memorandum Regarding Delegated Legislation}
  %\cleardoublepage
  \nolinenumbers
  \chapter*{Memorandum Regarding Delegated Legislation}
  %\addcontentsline{toc}{chapter}{Memorandum Regarding Delegated Legislation}

}{
 \tabcolsep=0pt
 \noindent\@mrdlSignature
}



\newcommand{\explanation}[1]{\emph{Explanation}: #1}


\renewcommand{\baselinestretch}{1}

%%% ********************* Annotations ****************

%% soul is not compatible with csquotes

%\newcommand{\ins}[1]{\underline{#1}}
%% plain underline does not break line

\newcommand{\ins}[1]{\ul{#1}}
\newcommand{\del}[1]{\st{#1}}
%% for soul to work correctly in headings with hyperref
%% https://tex.stackexchange.com/a/240438/33945



%\newcommand{\ins}[1]{\ul{\protect{#1}}}
%\newcommand{\del}[1]{\st{\protect{#1}}}
%% if protect is not there, \ins\actreft throws errors of missing }

%% If all else fails!
%\newcommand{\ins}[1]{\emph{#1}}
%\newcommand{\del}[1]{[#1]}



\newcommand{\subs}[2]{\del{#1} \ins{#2}}


\newcommand{\chapnumhead}[3]{%
  \titleformat{\chapter}[display]% command [shape]
  {\centering\large\bfseries\scshape}% format
  {\chaptertitlename \space#1}% label
  {-1ex}{}{}%sep before-code after-code (sep between label and
            %heading)
  \titlespacing*{\chapter}{1ex}{*0}{-1ex}
  \chapter[#2]{\texorpdfstring{#3}{}}
  %% for soul to work correctly in headings with hyperref
  %% https://tex.stackexchange.com/a/240438/33945
  \titleformat{\chapter}[display]
  {\centering\large\bfseries\scshape}
  {\chaptertitlename \space\thechapter}
  {0ex}{}{}
}

\newcommand{\secnumhead}[3]{%

        % \titleformat{\section}% command [shape]
        % {\bfseries}% format
        % {#1\quad}% label
        % {0ex}{}{}%sep before-code after-code (sep between label and
        
	\titlelabel{#1\quad}
        \titlecontents{section}[2em]
        {\vspace{12pt}}
        % {\normalfont\normalsize\contentslabel{2em}}
        {\normalfont\normalsize\contentslabel[#1]{2em}}
        {\hspace*{-2em}\uppercase}
        {\titlerule*[.75em]{.}\contentspage}

        \titlespacing*{\section}{-1ex}{*0}{*0}
	\section[#2]{\texorpdfstring{#3}{}}
	%\titlelabel{\thesection\quad}

        \titleformat{\section}% command [shape]
        {\bfseries}% format
        {\thesection\quad}% label
        {0ex}{}{}%sep before-code after-code (sep between label and
        
}


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














