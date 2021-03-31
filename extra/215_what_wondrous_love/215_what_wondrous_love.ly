% This is a lilypond file; running lilypond on it will generate a long single-page
% pdf as well as a midi file.
%
% This is a template file; see README.md for instructions on editing it.
%
% Taken from "Glory To God" the Presbyterian Hymnal, #215

\version "2.18.2"

sopranoNotesA = \relative c' { d2   | d4     c     e     g   | a2    g4 e      | d2    d4   c    | e2 }
verseOneA     = \lyricmode   { What | won -- drous love  is  | this, O  my     | soul, O    my   | soul, }
verseTwoA     = \lyricmode   { When | I      was   sink -- ing | down, sink -- ing | down, sink -- ing | down, }
verseThreeA   = \lyricmode   { To   | God    and   to    the | Lamb  I  will   | sing, I    will | sing, }
verseFourA    = \lyricmode   { And  | When   from  death I'm | free, I'll sing | on,   I'll sing | on, }

sopranoNotesB = \relative c''{ a2   | c4     b     a     g   | a2    g4 e      | d1~   | d2 }
verseOneB     = \lyricmode   { What | won -- drous love  is  | this, O  my     | Soul! }
verseTwoB     = \lyricmode   { When | I      was   sink -- ing | down, sink -- ing | down, }
verseThreeB   = \lyricmode   { To   | God    and   to    the | Lamb  I  will   | sing; }
verseFourB    = \lyricmode   { And  | When   from  death I'm | free, I'll sing | on;   }

sopranoNotesC = \relative c''{ g2   | a4     g     a     c   | d2    d    | c4     a   a8( g) e4  | d2 }
verseOneC     = \lyricmode   { What | won -- drous love  is  | this  that | caused the Lord   of  | bliss }
verseTwoC     = \lyricmode   { When | I      was   sink -- ing | down be -- neath  God’s right -- eous | frown, }
verseThreeC   = \lyricmode   { To   | God    and   to    the | Lamb  who  | is     the great  I   | Am, }
verseFourC    = \lyricmode   { And  | When   from  death I'm | free, I'll | sing   and joy -- ful | be, }


sopranoNotesD = \relative c' { d2    | d4     c     e     g   | a2     g4  e     | d2    d4   c    | e2 }
verseOneD     = \lyricmode   { To    | bear   the   dread -- ful | curse  for my    | soul, for  my   | soul, }
verseTwoD     = \lyricmode   { Christ | laid  a --  side his  | crown  for my    | soul, for my    | soul, }
verseThreeD   = \lyricmode   { While | mil -- lions join  the | theme, I will    | sing, I    will | sing; }
verseFourD    = \lyricmode   { And   | through e -- ter -- ni -- ty    I'll sing | on,   I'll sing | on, }


sopranoNotesE = \relative c''{ a2    | c4     b     a     g   | a2     g4  e     | d1    }
verseOneE     = \lyricmode   { To    | bear   the   dread -- ful | curse  for my    | soul! }
verseTwoE     = \lyricmode   { Christ laid a -- side his crown for my soul. }
verseThreeE   = \lyricmode   { While | mil -- lions join  the | theme, I   will  | sing! }
verseFourE    = \lyricmode   { And   | through e -- ter -- ni -- ty    I'll sing | on!   }


verseOne     = { \set stanza = "1. " \verseOneA   \verseOneB   \verseOneC   \verseOneD   \verseOneE   }
verseTwo     = { \set stanza = "2. " \verseTwoA   \verseTwoB   \verseTwoC   \verseTwoD   \verseTwoE   }
verseThree   = { \set stanza = "3. " \verseThreeA \verseThreeB \verseThreeC \verseThreeD \verseThreeE }
verseFour    = { \set stanza = "4. " \verseFourA  \verseFourB  \verseFourC  \verseFourD  \verseFourE  }

sopranoNotes = { \repeat unfold 4 { \sopranoNotesA \sopranoNotesB \sopranoNotesC \sopranoNotesD \sopranoNotesE } }
verses       = { \verseOne \verseTwo \verseThree \verseFour }

% this section gives the broad structure of the music

global = {
	\time 2/2
  \set Timing.baseMoment  = #(ly:make-moment 1/4)
  \set Timing.beamExceptions = #'()
	\key d \dorian
  \repeat unfold 4 {
    \partial 2
    \repeat unfold 5 {
      s2 | s1 | s1 |
    } \alternative { {  s1 | s2 \bar "" \break } { s1 } }
  } \alternative { { \bar "||" \pageBreak } { \bar "|." } }
}

% And here is the score:

hymntitle = "Hymn #215: What Wondrous Love is This"

\header {
	tagline = ##f
%	title = \markup {
%		\with-dimensions #'(0 . 0) #'(0 . 0)
%		% specify color
%		\with-color #(rgb-color 0.99 0.98 0.9)
%		% specify size
%		\filled-box #'(-1000 . 1000) #'(-1000 . 4000) #0
%		\hymntitle
%	}
  instrument = \markup {
    \with-dimensions #'(0 . 0) #'(0 . 0)
    % specify color
    \with-color #(rgb-color 0.99 0.98 0.9)
    % specify size
    \filled-box #'(-1000 . 1000) #'(-1000 . 4000) #0
    \hymntitle
  }
}

\score {
  \new Staff {
    \new Voice = "soprano" {
      \voiceOne
      << \global \sopranoNotes >>
    }
    \addlyrics \verses
  }

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
