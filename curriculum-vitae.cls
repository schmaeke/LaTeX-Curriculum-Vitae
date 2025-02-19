%% Curriculum Vitae document class for LaTeX.
%% By Jan Niklas Schmäke created on 19.02.2025
%% https://github.com/schmaeke/Curriculum-Vitae


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Base settings

% LaTeX format
\NeedsTeXFormat{LaTeX2e}

% Class definition
\ProvidesClass{curriculum-vitae}[Extension of the articel class for CVs]

% Base class
\LoadClass[a4paper, singleside, 10pt]{article}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Packages

% Page geometry
\RequirePackage{geometry}

% Fonts
\RequirePackage[mono]{inconsolata}
\RequirePackage[familydefault, regular]{Chivo}
\RequirePackage[T1]{fontenc}

% Formatting
\RequirePackage{xcolor}
\RequirePackage{fancyhdr}
\RequirePackage{setspace}
\RequirePackage{microtype}
\RequirePackage[parfill]{parskip}
\RequirePackage{enumerate}

% Advanced graphics
\RequirePackage{graphicx}
\RequirePackage{tikz}
\usetikzlibrary{calc}

% Links
\RequirePackage{hyperref}

% Misc.
\RequirePackage{lastpage}
\RequirePackage{fontawesome5}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Colors

% Default palette
\definecolor{foreground}{HTML}{000000}
\definecolor{background}{HTML}{FFFFFF}
\definecolor{linkcolor}{HTML}{3388CC}
\definecolor{accent}{HTML}{000000}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Geometry
\geometry{
	top    = 15mm,
	bottom = 20mm,
	left   = 20mm,
	right  = 20mm,
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Links
\hypersetup{
	hidelinks,
	colorlinks = true,
	linkcolor = linkcolor,
	urlcolor = linkcolor,
	pdftitle = {Curriculum Vitae}
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Footer & Header

\renewcommand{\headrulewidth}{0.0mm}
\renewcommand{\footrulewidth}{0.0mm}

\fancyhead[L, C, R]{}
\fancyfoot[L, R]{}
\fancyfoot[C]{
	\small \iflanguage{ngerman}{Seite}{Page}\ \textbf{\thepage}\ \iflanguage{ngerman}{von}{of}\ \textbf{\pageref*{LastPage}}
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Commands

	% Name and contanct
	\newcommand{\name}[1]{\def\nameValue{#1}}
	\newcommand{\surname}[1]{\def\surnameValue{#1}}

	% Head
	\newcommand{\highlighted}[1]{{\color{accent}#1}}
	\newcommand{\cvhead}{
		\begin{center}
			{\color{accent}\fontsize{32pt}{32pt}\selectfont\bfseries\nameValue\ \surnameValue} \\[1mm]
			{\shortinfoValue} \\[-1mm]
			\tikz{\draw[black, line width = 0.25mm] (0mm, 0mm) -- ++(30mm, 0mm);} \\
			{\phraseValue} \\[10mm]
		\end{center}
	}

	\newcommand{\cvsection}[1]{
		{\color{accent}\large\MakeUppercase{#1}} \\[-2mm]
		\tikz{\draw[accent, line width = 0.25mm] (0mm, 0mm) -- ++(\textwidth, 0mm);} \\[1mm]
	}

	% Content
	\newcommand{\cvcustomentry}[3]{
		{\sffamily{\bfseries#1}\hfill#2} \\
		#3 \\[2mm]
	}

	\newcommand{\cventry}[2]{
		\cvcustomentry{#1}{}{#2}%
	}

	\newcommand{\cvdatedentry}[3]{
		\cvcustomentry{#1}{\textbf{#2}}{#3}%
	}

	\newcommand{\cvdatedentryshort}[3]{%
		\textbf{#1}\enspace#3\hfill\textbf{#2} \\[2mm]
	}

	% Seperator
	\newcommand{\sep}{\enspace\textbullet\enspace}

	% Info creators
	\newcommand{\icon}[1]{%
		#1\enspace%
	}

	\newcommand{\shortinfo}[1]{%
		\def\shortinfoValue{#1}%
	}

	\newcommand{\weblink}[3]{%
		\icon{#1}\href{https://#3}{#2}%
	}

	\newcommand{\maillink}[1]{%
		\icon{\faEnvelope}\href{mailto:#1}{#1}%
	}

	\newcommand{\phonelink}[1]{%
		\icon{\faPhone}\href{phone:#1}{#1}%
	}

	\newcommand{\inlinelink}[2]{%
		\textsuperscript{\normalfont[\href{https://#2}{#1}]}%
	}

	\newcommand{\lastupdated}{%
		\iflanguage{ngerman}{Zuletzt geändert am}{Updated on} \today%
	}

	\newcommand{\phrase}[1]{%
		\def\phraseValue{#1}%
	}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Default settings

\color{foreground}
\pagecolor{background}
\pagestyle{fancy}
\sloppy
\linespread{1.1}
\setlength{\parskip}{0mm}
