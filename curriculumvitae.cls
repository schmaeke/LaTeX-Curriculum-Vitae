%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Base settings

	% LaTeX format
	\NeedsTeXFormat{LaTeX2e}

	% Class definition
	\ProvidesClass{curriculumvitae}[Extension of the articel class for CVs]

	% Base class
	\LoadClass[a4paper, singleside, 12pt]{article}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Packages

	% Page geometry
	\RequirePackage{geometry}

	% Fonts
	\RequirePackage{paratype}
	\RequirePackage{CharisSIL}
	\RequirePackage[notext]{stix}
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

	% Links
	\RequirePackage[hidelinks, colorlinks = false]{hyperref}

	% Misc.
	\RequirePackage{lastpage}
	\RequirePackage{fontawesome5}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Colors

	% Default palette
	\definecolor{foreground}{HTML}{000000}
	\definecolor{highlightedForeground}{HTML}{003DA0}

	\definecolor{background}{HTML}{FFFFFF}
	\definecolor{highlightedBackground}{HTML}{ECF1F9}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Geometry
	\geometry{
		top = 1cm,
		bottom = 2cm,
		left = 1cm,
		right = 1cm,
	}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Footer & Header

	\renewcommand{\headrulewidth}{0.0mm}
	\renewcommand{\footrulewidth}{0.0mm}

	\fancyhead[L, C]{}
	\fancyhead[R]{
		\begin{tikzpicture}[remember picture, overlay]
			\node[below left] at (current page.north east)
				{\color{highlightedBackground}\sffamily\fontsize{6pt}{0pt}\selectfont Updated on \today};
		\end{tikzpicture}
	}
	\fancyfoot[L, R]{}
	\fancyfoot[C]{
		\begin{tikzpicture}[remember picture, overlay]
			\fill[highlightedForeground] (current page.south west) rectangle ++(\paperwidth, 1cm);
			\draw[highlightedBackground, line width = 0.5mm] (current page.south west) ++(0cm, 1cm) -- ++(\paperwidth, 0cm);

			\node[right, highlightedBackground, shift = {(0.2cm, 0.475cm)}] at (current page.south west)
				{
					\sffamily\small
					\faEnvelope\enspace\href{mailto:\mailValue}{\mailValue}
					\enspace\enspace
					\faPhoneSquare\enspace\href{tel:\phoneValue}{\phoneValue}
					\enspace\enspace
					\faGlobe\enspace\href{https://\webValue}{\webValue}
					\enspace\enspace
					\faGithub\enspace\href{https://github.com/\githubValue}{\githubValue}
				};

			\node[left, highlightedBackground, shift = {(-0.2cm, 0.475cm)}] at (current page.south east)
				{
					\sffamily\small
					Page \textbf{\thepage} of \textbf{\pageref*{LastPage}}
				};
		\end{tikzpicture}
	}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Commands

	% Name and contanct
	\newcommand{\name}[1]{\def\nameValue{#1}}
	\newcommand{\surname}[1]{\def\surnameValue{#1}}

	\newcommand{\prename}[1]{\def\prenameValue{#1}}
	\newcommand{\postname}[1]{\def\postnameValue{#1}}

	\newcommand{\residence}[1]{\def\residenceValue{#1}}
	\newcommand{\nationality}[1]{\def\nationalityValue{#1}}

	\newcommand{\mail}[1]{\def\mailValue{#1}}
	\newcommand{\phone}[1]{\def\phoneValue{#1}}
	\newcommand{\web}[1]{\def\webValue{#1}}
	\newcommand{\github}[1]{\def\githubValue{#1}}

	% Head
	\newcommand{\highlighted}[1]{{\color{highlightedForeground}#1}}
	\newcommand{\cvhead}{
		{
			\sffamily\color{highlightedForeground}
			{\fontsize{24pt}{0pt}\selectfont\prenameValue}%
			{\fontsize{34pt}{0pt}\selectfont\bfseries\nameValue\ \surnameValue}%
			{\fontsize{24pt}{0pt}\selectfont\postnameValue}%
			\vspace*{5mm}
		}

		\cvsection{\faUser}{Personal Information \& Contact}\\[0mm]
		\begin{center}
			\begin{tabular}{l c l c l}
				\highlighted{\faMapMarker*}\ \residenceValue
				& \hspace{2cm}
				& \highlighted{\faPhoneSquare}\ \href{tel:\phoneValue}{\phoneValue}
				& \hspace{2cm}
				& \highlighted{\faGlobe}\ \href{https://\webValue}{\webValue} \\[2mm]
				\highlighted{\faIdCard}\ \nationalityValue
				&
				& \highlighted{\faEnvelope}\ \href{mailto:\mailValue}{\mailValue}
				&
				& \highlighted{\faGithub}\ \href{https://github.com/\githubValue}{\githubValue} \\
			\end{tabular}
		\end{center}
		\vspace*{5mm}
	}

	\newcommand{\cvsection}[2]{
		\begin{tikzpicture}
			\fill[highlightedBackground] (0, 0) rectangle ++(\textwidth, 0.8cm);
			\draw[highlightedForeground, line width = 0.5mm] (0, 0) -- ++(\textwidth, 0);
			\node[above, highlightedForeground, inner sep = 0mm] at (5mm, 0) {\large{#1}\strut};
			\node[above right, highlightedForeground, inner sep = 0mm] at (10mm, 0) {\sffamily\large{#2}\strut};
		\end{tikzpicture}
	}

	% Content
	\newcommand{\cvcustomentry}[3]{
		\vspace{-1mm}%
		\begin{tikzpicture}%
			\node[below right, inner sep = 0mm] (A) at (0, 0) {
				\hspace*{3mm}
				\begin{minipage}{18.0cm}
					{\sffamily\color{highlightedForeground}\strut\textbf{#1} \hfill #2} \\
					#3
				\end{minipage}
			};

			\draw[background] (A.north west) -- ++(-5mm, 0);
			\draw[highlightedForeground, line width = 0.5mm] (A.south west) -- (A.north west) -- ++(0, 3mm);
			\draw[highlightedForeground, fill = background, line width = 0.5mm] (A.north west) ++(0, -2.5mm) circle (1.0mm);
		\end{tikzpicture}%
	}

	\newcommand{\cventry}[2]{
		\cvcustomentry{#1}{}{#2}
	}

	\newcommand{\cvlinkedentry}[4]{
		\cvcustomentry{#1}{\href{#2}{#3}\ \faExternalLink*}{#4}
	}

	\newcommand{\cvdatedentry}[3]{
		\cvcustomentry{#1}{#2\ \faCalendar*[regular]}{#3}
	}

	% Seperator
	\newcommand{\sep}{$\ \cdot\ $}

	% Custom item bullets
	\newcommand{\customItemBullet}{
		\begin{tikzpicture}
			\fill[highlightedForeground] (0, 0) circle (1mm);
			\fill[background] (0, 0) circle (0.5mm);
		\end{tikzpicture}
	}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Default settings

	\color{foreground}
	\pagecolor{background}
	\pagestyle{fancy}
	\sloppy
	\linespread{1.1}
	\setlength{\parskip}{0mm}
