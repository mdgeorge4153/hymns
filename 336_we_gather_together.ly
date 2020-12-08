% This is a lilypond file; running lilypond on it will generate a long single-page
% pdf as well as a midi file.
%
% The music and text was taken from the Presbyterian Hymnal (C) 1990, Hymn 559

\version "2.18.2"

hymntitle = "Hymn #336: We Gather Together"

% There are 4 systems, here labeled A, B, C, and D; each has 4 voices and 3 verses

sopranoNotesA = \relative  { g'4 | g4.     a8 g4 | e        f     g    | f4.     e8   d4     | e        c    }
altoNotesA    = \relative  { c'4 | c4.     c8 c4 | c        c     c    | c4.     c8   b4     | c        c    }
verseOneA     = \lyricmode { We  | gath -- er to -- geth -- er    to   | ask     the  Lord's | bless -- ing; }
verseTwoA     = \lyricmode { Be -- side    us to   guide    us,   our  | God     with us     | join  -- ing, }
verseThreeA   = \lyricmode { We  | all     do ex -- tol     Thee, Thou | lead -- er   tri   -- um    -- phant, }
tenorNotesA   = \relative  { e4  | e4.     f8 e4 | g        g     g    | a4.     a8   g4     | g        e    }
bassNotesA    = \relative  { c4  | c4.     c8 c4 | c        d     e    | d4.     d8   g4     | c,       c    }

sopranoNotesB = \relative  { g'4 | g4.     a8   b4   |  c4.    d8   b4  | a4.     g8  a4   | g2 }
altoNotesB    = \relative  { e'4 | d4.     d8   d4   |  e   d       d   | e4.     e8  fis4 | d2 }
verseOneB     = \lyricmode { He  | chas -- tens and  |  has -- tens His | will    to  make | known; }
verseTwoB     = \lyricmode { Or -- dain -- ing, main -- tain -- ing His | king -- dom di  -- vine;  }
verseThreeB   = \lyricmode { And | pray    that Thou |  still  our  de -- fend -- er  wilt | be. }
tenorNotesB   = \relative  { g4  | g4.     g8   g4   |  g   fis     g   | g4.     c8  c4   | b2 }
bassNotesB    = \relative  { c4  | b4.     b8   b4   |  a   d       g   | c,4.    a8  d4   | g,2 }

sopranoNotesC = \relative  { g'4 | g4.     a8   b4  | c        g    g   | g4.(  a8) f8   g    | e4       c }
altoNotesC    = \relative  { d'4 | d4.     d8   d4  | c        c    c   | c2        b8   b    | c4       c }
verseOneC     = \lyricmode { The | wick -- ed   op -- press -- ing  now | cease     from dis -- tress -- ing, }
verseTwoC     = \lyricmode { So  | from    the  be -- gin   -- ning the | fight     we   were | win   -- ning; }
verseThreeC   = \lyricmode { Let | Thy     con -- gre -- ga -- tion es -- cape      trib -- u -- la   -- tion; }
tenorNotesC   = \relative  { b4  | b4.     a8   g4  | g        g    g   | a2        g8   g8   | g4       e }
bassNotesC    = \relative  { g4  | f4.     f8   f4  | e        e    e   | d2        g8   g8   | c,4      c }

% Note: the last system is split into a different version for each verse to handle the ending and the dotted tie

sopranoNotesDOne    = \relative  { c'4   | f4.      g8 a  f   | g4.( f8) e8 e    | f4   d4.  c8  | c2 }
altoNotesDOne       = \relative  { c'4   | c4.      c8 c  c   | d2       c8 c    | a4   b4.  c8  | c2 }
verseOneD           = \lyricmode { Sing  | prais -- es to His | name;    He for -- gets not  His | own. }
tenorNotesDOne      = \relative  { e4    | f4.      e8 f  f   | d4( g)   g8 g    | f4   f4.  e8  | e2 }
bassNotesDOne       = \relative  { c4    | a4.      g8 f  a   | b2       c8 c    | d4   g,4. c8  | c2 }

sopranoNotesDTwo    = \relative  { c'4   | f4.      g8 a  f   | g4.( f8) e4  | f4     d4.  c8  | c2 }
altoNotesDTwo       = \relative  { c'4   | c4.      c8 c  c   | d2       c4  | a4     b4.  c8  | c2 }
verseTwoD           = \lyricmode { Thou, | Lord,  wast at our | side;    All | glo -- ry   be  | Thine! }
tenorNotesDTwo      = \relative  { e4    | f4.      e8 f  f   | d4( g)   g4  | f4     f4.  e8  | e2 }
bassNotesDTwo       = \relative  { c4    | a4.      g8 f  a   | b2       c4  | d4     g,4. c8  | c2 }

sopranoNotesDThree    = \relative  { c'4   | f4.      g8 a     f   | g4.( f8) e4  | f4     d4.  c8  | c2. }
altoNotesDThree       = \relative  { c'4   | c4.      c8 c     c   | d2       c4  | a4     b4.  c8  | c2. }
verseThreeD           = \lyricmode { Thy   | name     be ev -- er  | praised! O   | Lord,  make us  | free! }
tenorNotesDThree      = \relative  { e4    | f4.      e8 f     f   | d4( g)   g4  | f4     f4.  e8  | e2. }
bassNotesDThree       = \relative  { c4    | a4.      g8 f     a   | b2       c4  | d4     g,4. c8  | c2. }


% We now collect the 4 systems together:

verseOne     = { \set stanza = "1. " \verseOneA     \verseOneB     \verseOneC     \verseOneD     }
verseTwo     = { \set stanza = "2. " \verseTwoA     \verseTwoB     \verseTwoC     \verseTwoD     }
verseThree   = { \set stanza = "3. " \verseThreeA   \verseThreeB   \verseThreeC   \verseThreeD   }


sopranoNotes = { \repeat unfold 3 { \sopranoNotesA \sopranoNotesB \sopranoNotesC } \alternative { \sopranoNotesDOne \sopranoNotesDTwo \sopranoNotesDThree } }
altoNotes    = { \repeat unfold 3 { \altoNotesA    \altoNotesB    \altoNotesC    } \alternative { \altoNotesDOne    \altoNotesDTwo    \altoNotesDThree    } }
tenorNotes   = { \repeat unfold 3 { \tenorNotesA   \tenorNotesB   \tenorNotesC   } \alternative { \tenorNotesDOne   \tenorNotesDTwo   \tenorNotesDThree   } }
bassNotes    = { \repeat unfold 3 { \bassNotesA    \bassNotesB    \bassNotesC    } \alternative { \bassNotesDOne    \bassNotesDTwo    \bassNotesDThree    } }
verses       = { \verseOne \verseTwo \verseThree }

% this section gives the broad structure of the music

global = {
	\autoBeamOff
	\time 3/4
	\key c \major
	\partial 4
	\repeat unfold 12 { s4 | s2. | s | s | } \alternative { { s2 \bar "" \break } { s2. \bar "|." } }
}

% And here is the score:

\header {
	tagline = ##f
	title = \markup {
		% Set background color by making a big rectangle
		\with-dimensions #'(0 . 0) #'(0 . 0)
		\with-color #(rgb-color 0.99 0.98 0.9)
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
#(set! paper-alist (cons '("my size" . (cons (* 210 mm) (* 800 mm))) paper-alist))
\paper {
  #(set-paper-size "my size")
}
