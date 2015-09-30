% -*- coding: iso-safe-unix -*-
% Time-stamp: <2015-09-29 20:04:58 (paudebau)>

% \copyright 2015 Philippe Audebaud <paudebau AT gmail DOT com>

% This work is licensed under a Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International license 
% To view a copy of this license visit: http://creativecommons.org/licenses/by-sa/4.0/legalcode.

\end{flushright}
\def\filename{ensldocument.cls}
\def\fileversion{1.0}
\def\filedate{2010/08/18}

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ensldocument}[\filedate\space v\fileversion\space Copyright (c) Philippe Audebaud 2010-2015]

\RequirePackage{etoolbox}
\RequirePackage{lastpage}
\RequirePackage{rerunfilecheck}

\RequirePackage{kvoptions}
\SetupKeyvalOptions{family = \@currname, prefix = @ensl@} %%setkeys = <setkeys command>
\DeclareStringOption[\@currname]{lecture}
\ProcessKeyvalOptions{\@currname}
\PackageInfo{\@currname}{currname = \@currname, lecture = \@ensl@lecture}

\PassOptionsToPackage{unicode}{hyperref}
\PassOptionsToPackage{naturalnames}{hyperref}
\LoadClass[a4paper,10pt,compress,french]{article}

\RequirePackage{beamerarticle}
\RequirePackage{pgf}
\RequirePackage[french]{babel}
\RequirePackage{kpfonts}
\RequirePackage{amssymb,amsmath}
\RequirePackage{multicol} \setlength{\columnseprule}{0.5pt}
\RequirePackage[a4paper]{geometry} \geometry{hscale=0.85,vscale=0.85,headheight=30pt}%,showframe}

\RequirePackage{fancyhdr}
\RequirePackage{fancyvrb}
\RequirePackage{minted}

\RequirePackage{calc}
\newcounter{cursusyearbegin} \newcounter{cursusyearend}
\ifnum\month<7{%
  \setcounter{cursusyearbegin}{\year - 1} \setcounter{cursusyearend}{\year}
}\else{%
  \setcounter{cursusyearbegin}{\year} \setcounter{cursusyearend}{\year + 1}
}\fi

\InputIfFileExists{\@ensl@lecture.sty}{}{}

%% Institution

\pgfdeclareimage[width=2cm]{ensllogo}{ENS_logo.png}
\pgfdeclareimage[width=17cm]{enslbar}{ENS_footer.jpg}
\gdef\@institution{ENS Lyon}
\gdef\@shortinstitution{ENSL}

%% Lecture description

\newcommand{\@department}{DEPT MISSING}
\newcommand{\@shortdepartment}{DEPT?}
\newcommand{\@lecturelevel}{LEVEL MISSING}
\newcommand{\@lectureshortlevel}{LMD?}
\newcommand{\@lecturetitle}{TITLE MISSING}
\newcommand{\@lectureshorttitle}{TITLE?}
\newcommand{\@lectureteacher}{TEACHER MISSING}
\newcommand{\@lectureshortteacher}{TEACHER?}
\newcommand{\@lectureassistant}{ASSISTANT MISSING}
\newcommand{\@lectureshortassistant}{ASSISTANT?}
\newcommand{\@lecturekeywords}{KEYWORDS MISSING}
\newcommand{\@lectureurl}{URL MISSING}

\newcommand*{\department}[1]{\renewcommand\@department{#1}}
\newcommand*{\shortdepartment}[1]{\renewcommand\@shortdepartment{#1}}
\newcommand*{\lecturelevel}[1]{\renewcommand\@lecturelevel{#1}}
\newcommand*{\lectureshortlevel}[1]{\renewcommand\@lectureshortlevel{#1}}
\newcommand*{\lecturetitle}[1]{\renewcommand\@lecturetitle{#1}}
\newcommand*{\lectureshorttitle}[1]{\renewcommand\@lectureshorttitle{#1}}
\newcommand*{\lectureteacher}[1]{\renewcommand\@lectureteacher{#1}}
\newcommand*{\lectureshortteacher}[1]{\renewcommand\@lectureteacher{#1}}
\newcommand*{\lectureassistant}[1]{\renewcommand\@lectureassistant{#1}}
\newcommand*{\lectureshortassistant}[1]{\renewcommand\@lectureshortassistant{#1}}
\newcommand*{\lecturekeywords}[1]{\renewcommand\@lecturekeywords{#1}}
\newcommand*{\lectureurl}[1]{\renewcommand\@lectureurl{#1}}

% Lecture global configuration

\InputIfFileExists{\@ensl@lecture.cfg}{}{}

%% This lecture 

\newcommand{\@thislecturesubject}{MISSING SUBJECT}
\newcommand{\@thislecturesort}{TD, TP, ..?}
\newcommand{\@thislecturedate}{MISSING DATE}
\newcommand{\@thislectureauthor}{\@lectureassistant}
\newcommand{\@thislectureshortauthor}{\@lectureshortassistant}

\newcommand*{\thislecturesubject}[1]{\renewcommand{\@thislecturesubject}{#1}}
\newcommand*{\thislecturesort}[1]{\renewcommand{\@thislecturesort}{#1}}
\newcommand*{\thislecturedate}[1]{\renewcommand{\@thislecturedate}{#1}}
\newcommand*{\thislectureauthor}[1]{\renewcommand{\@thislectureauthor}{#1}}
\newcommand*{\thislectureshortauthor}[1]{\renewcommand{\@thislectureshortauthor}{#1}}

\AtEndPreamble{
  \RequirePackage{hyperref} %%% Wants te be called as late as possible
  \RequirePackage{hyperxmp}

  \setlength{\voffset}{25pt}
  \fancypagestyle{plain}{% This is default style for (first) title page
    \fancyhf{}
    \fancyhead[LO]{\pgfuseimage{ensllogo}}
    \fancyhead[CO]{\raisebox{.7\height}{\large{\bfseries \@department{} $\vert$ \@lecturelevel}}}
    \fancyhead[RO]{\raisebox{.7\height}{\large{\bfseries \thecursusyearbegin-\thecursusyearend}}}
    \fancyfoot[CO]{\pgfuseimage{enslbar}}
    \renewcommand{\headrulewidth}{0pt}
    \setlength{\headheight}{25pt}
    \setlength{\headwidth}{\textwidth}
  }

  \fancypagestyle{otherpage}{% For all pages but the first one
    \fancyhf{}
    \fancyhead[L]{\@shortinstitution{} - \@shortdepartment}
    \fancyhead[C]{\@lecturetitle}
    \fancyhead[R]{\thecursusyearbegin-\thecursusyearend}
    \fancyfoot[L]{\@lecturelevel}
    \fancyfoot[C]{\@thislecturesubject}
    \fancyfoot[R]{\thepage~/~\pageref{LastPage}}
  }

  \hypersetup{%
    pdfauthor={\@thislectureauthor - \@institution},%
    pdftitle = {\@lecturetitle},%
    pdfsubject = {\@thislecturesort{} - \@thislecturesubject},%
    pdfkeywords = {\@lecturekeywords},%
    pdfcreator={Ergon ToolChain + TeXmacs extensions},%
    pdfcopyright={Copyright (c) \thecursusyearbegin-\thecursusyearend{} --- \@lectureteacher, \@lectureassistant},
    pdflicenseurl={http://creativecommons.org/licenses/by-nc-sa/4.0/},
    baseurl={\@lectureurl},
    % PDF rendering
    pdfstartview = FitH,%
    pdfborder = {0 0 0},
    bookmarksopen = true, bookmarksnumbered = true,%
    breaklinks = true, colorlinks = true,%
    linkcolor = blue, anchorcolor = blue,%
    citecolor = blue, filecolor = blue,%
    menucolor = blue, pagecolor = blue,%
    urlcolor = blue
  }

  \title[\@lectureshorttitle]{\bfseries \@lecturetitle}
  \subtitle{\@thislecturesort{} - \bfseries \@thislecturesubject}
  \author[\@thislectureshortauthor]{\@thislectureauthor}
  \institute[\@shortinstitution \@shortdepartment]{\@institution{} - \@department{} - \@lectureshortlevel}
  \date{\@thislecturedate}
  % \titlegraphic{}
  \RequirePackage{titling} \setlength{\droptitle}{-12ex}
}

\AtBeginDocument{
  \maketitle
  \pagestyle{otherpage}
}
