% -*- coding: iso-safe-unix -*-
% Time-stamp: <2017-04-09 08:06:04 (paudebau)>

% \copyright 2016,2017 Philippe Audebaud <paudebau AT gmail DOT com>

% This work is licensed under a Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International license
% To view a copy of this license visit: http://creativecommons.org/licenses/by-sa/4.0/legalcode.

\def\filename{ensldocument.cls}
\def\fileversion{1.1}
\def\filedate{2017/01/17}

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{\@currname}[\filedate\space v\fileversion\space Copyright (c) Philippe Audebaud 2010-2017]

\RequirePackage{etoolbox}
\RequirePackage{ifxetex,ifluatex}
\RequirePackage{kvoptions}
\SetupKeyvalOptions{family = \@currname, prefix = @ensl@} %%setkeys = <setkeys command>
\DeclareStringOption[\@currname]{lecture}
\DeclareStringOption[english]{language}%[french]
\DeclareStringOption[article]{class}
\DeclareBoolOption[false]{response}
% \ProcessKeyvalOptions{\@currname}
\ProcessKeyvalOptions*
\PackageInfo{\@currname}{jobname = \jobname, currname = \@currname, language = \@ensl@language, lecture = \@ensl@lecture}

\RequirePackage[\@ensl@language]{babel}

\PassOptionsToPackage{colorlinks}{hyperref}
\PassOptionsToPackage{unicode}{hyperref}
\PassOptionsToPackage{naturalnames}{hyperref}
\LoadClass[a4paper,11pt]{\@ensl@class}

%%% Specific packages used for lectures at ENS Lyon
\RequirePackage{lecture}

%%% Finish
\AtEndPreamble{
  %% Macros used in this lecture \@ensl@lecture
  \RequirePackage{lecture.\@ensl@lecture}
  %% Just in case something is missing, loaded BEFORE loading the document
  \InputIfFileExists{\jobname.patch.sty}{}{\PackageInfo{\@currname}{File \jobname.patch.sty not found}}

  \RequirePackage{hyperxmp}
  \RequirePackage{hyperref} %%% Wants to be called as late as possible
  % \RequirePackage{cleveref} %%% Requires to be loaded after hyperref!

  \setlength{\voffset}{25pt}
  \fancypagestyle{plain}{% This is default style for (first) title page
    \fancyhf{}
    \fancyhead[LO]{\pgfuseimage{ensllogo}}
    \fancyhead[CO]{\raisebox{.7\height}{\large{\bfseries \@lecturedepartment{} $\vert$ \@lecturelevel}}}
    \fancyhead[RO]{\raisebox{.7\height}{\large{\bfseries \thecursusyearbegin-\thecursusyearend}}}
    \fancyfoot[CO]{\pgfuseimage{enslbar}}
    \renewcommand{\headrulewidth}{0pt}
    \setlength{\headheight}{25pt}
    \setlength{\headwidth}{\textwidth}
  }

  \fancypagestyle{otherpage}{% For all pages but the first one
    \fancyhf{}
    \fancyhead[L]{\@shortinstitution{} - \@lectureshortdepartment}
    \fancyhead[C]{\@lecturetitle}
    \fancyhead[R]{\thecursusyearbegin-\thecursusyearend}
    \fancyfoot[L]{\@lecturelevel}
    \fancyfoot[C]{\@thislecturesubject}
    \fancyfoot[R]{\thepage~/~\pageref{LastPage}}
  }

  \hypersetup{%
    pdfauthor = {\@thislectureteacher},%
    pdfauthortitle = {\@lecturedepartment, \@institution},%
    pdftitle = {\@lecturetitle},%
    pdfsubject = {\@thislecturesort{} - \@thislecturesubject},%
    pdfkeywords = {\@lecturekeywords},%
    pdfcreator = {Ergon ToolChain + TeXmacs extensions},%
    pdflicenseurl = {http://creativecommons.org/licenses/by-nc-sa/4.0/},%
    pdfcopyright = {Copyright (c) \thecursusyearbegin-\thecursusyearend{} --- \@lectureteacher, \@lectureassistant},%
    baseurl = {\@lectureurl},
    % XMP enhancements
    pdfcontacturl = {\@lectureurl},%
    %% pdfdate = {\today},
    %% pdfcaptionwriter={Scott Pakin},
    pdfcontactaddress = {\@institution},
    pdfcontactcity = {Lyon},
    %% pdfcontactpostcode={3011},
    pdfcontactcountry = {France},
    %% pdfcontactphone={031 312 00 91},
    pdfcontactemail = {Philippe.Audebaud@ens-lyon.fr},
    %% pdflang={en},
    % PDF rendering
    unicode = true,
    pdfstartview = FitH,%
    pdfborder = {0 0 0},
    bookmarksopen = true, bookmarksnumbered = true,%
    breaklinks = true, colorlinks = true,%
    linkcolor = blue, anchorcolor = blue,%
    citecolor = blue, filecolor = blue,%
    menucolor = blue, % pagecolor = blue,%
    urlcolor = blue,
    final=true % in case draft still active...
  }

  \title[\@lectureshorttitle]{\bfseries \@lecturetitle}
  \subtitle{\@thislecturesort{} - \bfseries \@thislecturesubject}
  \author[\@thislectureshortteacher]{\@thislectureteacher}
  \institute[\@shortinstitution \@lectureshortdepartment]{\@institution{} - \@lecturedepartment{} - \@lectureshortlevel}
  \date{\@thislecturedate}
  % \titlegraphic{}
  \RequirePackage{titling} \setlength{\droptitle}{-12ex}
}

\AtBeginDocument{
  \pagenumbering{arabic}
  %\selectlanguage{\@ensl@language}
  \maketitle
  \pagestyle{otherpage}
}

\AtEndDocument{
  %% TODO ajuster au choix du langage
  \def\jobname@corrige{\jobname.corrige.tex}
  \IfFileExists{\jobname@corrige}{%
    \clearpage
    \section*{\'El\'ements de correction}

    \input{\jobname@corrige}
  }{\PackageInfo{\@currname}{file \jobname@corrige missing, not included}}
}

% \RequirePackage{lastpage}
\RequirePackage{pageslts}
\RequirePackage{rerunfilecheck}

