% -*- coding: iso-safe-unix -*-
% Time-stamp: <2016-09-15 10:55:43 (paudebau)>

% \copyright 2016 Philippe Audebaud <paudebau AT gmail DOT com>

% This work is licensed under a Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International license 
% To view a copy of this license visit: http://creativecommons.org/licenses/by-sa/4.0/legalcode.

\def\filename{ensldocument.cls}
\def\fileversion{1.0}
\def\filedate{2015/08/18}

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ensldocument}[\filedate\space v\fileversion\space Copyright (c) Philippe Audebaud 2010-2016]

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
\LoadClass[a4paper,11pt,compress,french]{article}

%%% Specific packages used for lectures at ENS Lyon

\RequirePackage{beamerarticle}
\RequirePackage{pgf}
\RequirePackage[french]{babel}
\RequirePackage[utf8]{inputenc}
\RequirePackage{kpfonts}
\RequirePackage{amssymb, amsmath, bbm}
\RequirePackage{multicol} \setlength{\columnseprule}{0.5pt}
\RequirePackage[a4paper]{geometry} \geometry{hscale=0.85,vscale=0.85,headheight=30pt}%,showframe}

\RequirePackage{fancyhdr}
\RequirePackage{fancyvrb}
\RequirePackage{minted}

%%% Meta

% \RequirePackage{lastpage}
% \RequirePackage{pageslts}
\RequirePackage{calc}
\RequirePackage{lecture.metadata} %% metadata pour hyperref & xmp
\RequirePackage{lecture.texmacs} %% rustine TeXmacs
% Lecture global configuration
\InputIfFileExists{\@ensl@lecture.cfg}{}{}
% this lecture local configuration within main document

%%% Finish

\AtEndPreamble{
  %% Macros specifiquement requises par le cours \@ensl@lecture
  \RequirePackage{lecture.\@ensl@lecture}

  \RequirePackage{hyperxmp}
  \RequirePackage{hyperref} %%% Wants te be called as late as possible

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
    urlcolor = blue
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
  \maketitle
  \pagestyle{otherpage}
}
