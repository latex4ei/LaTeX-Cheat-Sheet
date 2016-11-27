% Klasse für LaTeX4EI									Stand 04.04.13
% Erstellt von Emanuel Regnath, Martin Zellner
%
% Lizenz: Dieses package darf nur für Dokumente für LaTeX4EI verwendet werden!
% Bei anderem Verwendungszweck bitte Erlaubnis einholen: info@latex4ei.de
% © 2013, LaTeX4EI

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{latex4ei}[2014/03/16 Formelsammlungsvorlage von LaTeX4EI]

% Dokumentklasse (Schriftgröße 6, DIN A4, Artikel)
\LoadClass[6pt,a4paper,landscape]{scrartcl}

	% Pakete laden
	\RequirePackage[utf8]{inputenc}		% Zeichenkodierung: UTF-8 (für Umlaute)
	\RequirePackage[english, german]{babel}		% Deutsche Sprache
	\RequirePackage{multicol}			% ermöglicht Seitenspalten
	\RequirePackage{graphicx}			% Zum Bilder einfügen benötigt
	\RequirePackage{pbox}				% Intelligent parbox: \pbox{maximum width}{blabalbalb \\ blabal}
	\RequirePackage{scrtime}			% Änderungsdatum
	\RequirePackage{parskip} 			% Verhindert das einrücken am Zeilenanfang
	\RequirePackage{titlesec}			% Ermöglicht neuformatierung von Titeln
	\RequirePackage{xcolor}				% Ermöglicht farbigen Text
	\RequirePackage{multicol}			% Spalten-Layout
	\RequirePackage{geometry}			% Seitenlayout und Ränder
	\RequirePackage{fancyhdr}			% Kopf- und Fußzeile
	%\RequirePackage[mathletters]{ucs}	% für UTF8 Formeln
	%\RequirePackage{tikz}				% Alle möglichen Zeichnungen
	%\RequirePackage{multirow}			% Zeilenübergreifender Text

	\RequirePackage{scientific}  		% Befehle von LaTeX4EI (öffentlich)
	\RequirePackage{latex4ei}  			% Befehle von LaTeX4EI (privat)

  % setting graphics path so Logo in /img is found
  \graphicspath{ {img/} }


\newcommand{\fstitle}[1]{
	\vspace{-20mm}{
	\parbox{2.3cm}{
		\includegraphics[height=1.4cm]{Logo.pdf}
	}
	\parbox{4cm}{
		\textbf{\huge{#1}}
	}}
}


% .:: Formelsammlungsstyle
\DeclareOption{fs}{
		% .:: Seitenlayout und Ränder
		% ======================================================================
		\geometry{a4paper,landscape, left=6mm,right=6mm, top=0mm, bottom=3mm,includeheadfoot}

		% .:: Überschriften anpassen
		% ======================================================================
		\definecolor{sectioncolor}{RGB}{40,40,128}

		%\titleformat{ command }[ shape ]{ format }{ label }{ sep }{ before-code }[ after-code ]
		\titleformat{\section}{\Large \bfseries}{\thesection .}{0.5em}{\color{sectioncolor}}[\color{sectioncolor} \hrule \hrule]
		\titleformat{\subsection}{\large \bfseries}{\thesubsection .}{0.3em}{}

		%\titlespacing{Überschriftart}{keine Ahnung}{Abstand oberhalb}{Abstand unterhalb}
		\titlespacing{\section}{0em}{1.0em}{0.1em}
		\titlespacing{\subsection}{0em}{0.2em}{-0.4em}
		\titlespacing{\subsubsection}{0em}{0em}{-0.5em}

		\setlength{\parskip}{1pt}

		% Schriftart SANS für bessere Lesbarkeit bei kleiner Schrift
		\renewcommand{\familydefault}{\sfdefault}

		% Array- und Tabellenabstände vergrößern
		\renewcommand{\arraystretch}{1.2}
}

\DeclareOption{footer}{
	% .:: Kopf- und Fußzeile
		% ======================================================================
		\pagestyle{fancy}
		\fancyhf{}

		   \fancyfoot[C]{von LaTeX4EI - Mail: \emph{info@latex4ei.de}}
		   \renewcommand{\headrulewidth}{0.0pt} %obere Linie ausblenden
		   \renewcommand{\footrulewidth}{0.1pt} %obere Linie ausblenden

		   \fancyfoot[R]{Stand: \today \ um \thistime \ Uhr \qquad \thepage}
		   \fancyfoot[L]{Homepage: www.latex4ei.de -- Fehler bitte \emph{sofort} melden.}
}


\ProcessOptions*

% SI-Units
\sisetup{per-mode=fraction}
\sisetup{sticky-per=true}

\AtBeginDocument{\sisetup{math-rm=\mathrm, text-rm=\rmfamily}}
