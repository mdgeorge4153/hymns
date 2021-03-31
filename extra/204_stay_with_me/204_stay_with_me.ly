% This is a lilypond file; running lilypond on it will generate a long single-page
% pdf as well as a midi file.
%
% Taken from "Glory To God", Hymn #204

\version "2.18.2"
hymntitle = "Hymn #204: Stay with Me"

% There are 4 lines, here labeled A, B, C, and D; each has 4 voices and 3 verses

sopranoNotes = \relative c' { f4 f e4. e8 | f f4 f8 e2 | f( g4) c | a2( g) | f2. g4 | e1 | }
altoNotes    = \relative c' { d4 d d4. d8 | d d4 d8 d2 | d( e4) e | f2( e) | d2. d4 | d( cis8 b cis2) | }
verses       = \lyricmode   { Stay with me;  re -- main here with me; | watch and | pray. | Watch and | pray. | }
tenorNotes   = \relative c' { a4 a bes4. bes8 | a a4 a8 bes2 | a( c4) c | c1 | a2. bes4 | a1 | }
bassNotes    = \relative c  { d4 d d4. d8 | d d4 d8 d2 | d2( c4) c | f2( c) | d2. d4 | a1 | }


% We now collect the 4 lines together:


% this section gives the broad structure of the music

global = {
	\time 4/4
	\key d \minor
  \set Timing.baseMoment  = #(ly:make-moment 1/4)
  \set Timing.beamExceptions = #'()
  s1 | s1 | \break s1 | s1 | s1 | s1 \bar "|."
}

% And here is the score:

\header {
	tagline = ##f
	title = \markup {
		\with-dimensions #'(0 . 0) #'(0 . 0)
		% specify color
		\with-color #(rgb-color 0.99 0.98 0.9)
		% specify size
		\filled-box #'(-1000 . 1000) #'(-1000 . 4000) #0
		\hymntitle
	}
}

\score {
	\new ChoirStaff <<
		\new Staff = "women" <<
			\new Voice = "soprano" {
				\voiceOne
				<< \global \sopranoNotes >>
			}
			\new Voice = "alto" {
				\voiceTwo
				<< \global \altoNotes >>
			}
		>>

		\new Lyrics = "verses"

		\new Staff = "men" <<
			\clef bass
			\new Voice = "tenor" {
				\voiceThree
				<< \global \tenorNotes >>
			}
			\new Voice = "bass" {
				\voiceFour
				<< \global \bassNotes >>
			}
		>>

		\context Lyrics = "verses" \lyricsto "soprano" \verses
	>>
	\layout {
		indent = 0.0
		\context {
			\Score
			\override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/24)
			\override LyricText.font-size = 2.0
			\override LyricText.font-name = #"DejaVu Sans"
			\override BarNumber.break-visibility = ##(#f #f #f)
		}
	}
	\midi {
		\tempo 4 = 90
	}
}


% default is A4: 210 x 297mm
#(set! paper-alist (cons '("my size" . (cons (* 240 mm) (* 135 mm))) paper-alist))
\paper {
  #(set-paper-size "my size")
  markup-system-spacing = #'(
    (stretchability . 10)
    (basic-distance . 15)
    (minimum-distance . 10)
    (padding . 1)
  )
  system-system-spacing = #'(
    (stretchability . 10)
    (basic-distance . 15)
    (minimum-distance . 10)
    (padding . 1)
  )
  top-margin = 10
  left-margin = 10
  right-margin = 10
  print-page-number = ##f
}
