% This is a lilypond file; running lilypond on it will generate a long single-page
% pdf as well as a midi file.
%
% This is a template file; see README.md for instructions on editing it.
%
% It's good to write the source of your music on this line for reference!

\version "2.18.2"
hymntitle = "Hymn #196: All Glory, Laud, and Honor"

% There are 4 lines, here labeled A, B, C, and D; each has 4 voices and 3 verses

sopranoNotesA = \relative c' { bes4 | f'     f   g     a   | bes2       bes4 d   | c      bes   bes     a   | bes2. }
altoNotesA    = \relative c' { bes4 | c      bes bes   ees | ees( d8 c) d4   f   | f8 ees d4    c       c   | d2. }
lyricsA       = \lyricmode   { All  | glo -- ry, laud, and | hon     -- or   to  | thee,  Re -- deem -- er, | King, }
tenorNotesA   = \relative c  { d4   | f      d   ees   f   | f2         f4   bes | a      bes   g       f   | f2. }
bassNotesA    = \relative c  { bes4 | a      bes ees   c   | bes2       bes4 bes | f'     g     ees     f   | bes,2. }

sopranoNotesB = \sopranoNotesA
altoNotesB    = \altoNotesA
lyricsB       = \lyricmode   { to | whom the lips of | chil    -- dren made | sweet ho -- san -- nas | ring! }
tenorNotesB   = \relative c  { d4 | f    d   ees  f  | g( f8 ees) f4   bes  | a     bes   g      f   | f2. }
bassNotesB    = \bassNotesA

sopranoNotesC = \relative c''{ bes4 | d      d      c    bes   | a      g     f     a    | bes   a     g       g    | f2. }
altoNotesC    = \relative c' { ees4 | f      g8 f   e4   f8 g  | f4     e     f     f    | d8 e  f4    f       e    | f2. }
verseOneC     = \lyricmode   { Thou | art    the    King of    | Is --  ra -- el,   thou | Da -- vid's roy --  al   | Son, }
verseTwoC     = \lyricmode   { The  | peo -- ple    of   the   | He --  brews _     with | palms be -- fore    thee | went; }
verseThreeC   = \lyricmode   { To   | thee,  be --  fore thy   | pas -- sion, _     they | sang  their hymns   of   | praise; }
verseFourC    = \lyricmode   { Thou | didst  ac --  cept their | prais -- es; _     ac  -- cept  the   prayers we   | bring, }
tenorNotesC   = \relative c' { g4   | bes    bes8 a g4   d'    | c     bes   a     d    | bes   c     d c8    bes  | a2. }
bassNotesC    = \relative c  { ees4 | bes    bes    c    d8 e  | f4    c     d     d    | g,    a     bes     c    | f2. }

sopranoNotesD = \relative c' { f4  | d      f   g       f    | f4.( ees8) d4    f    | ees    d    c        c     | bes2. }
altoNotesD    = \relative c' { c4  | bes    bes ees     d    | c( a)      bes   bes  | bes    bes  bes      a     | bes2. }
verseOneD     = \lyricmode   { who | in     the Lord's  name | com --     est,  the  | King   and  bless -- ed    | One. }
verseTwoD     = \lyricmode   { our | praise and prayers and  | an --      thems be --  fore   thee we       pre  -- sent. }
verseThreeD   = \lyricmode   { to  | thee,  now high    ex --  alt --     ed,   our  | mel -- o -- dy       we    | raise. }
verseFourD    = \lyricmode   { who | in     all good    de --  light --   est,  thou | good   and  gra --   cious | King! }
tenorNotesD   = \relative c  { f4  | f      bes bes     bes  | f2         f4    f    | g      f    f4.      ees8  | d2. }
bassNotesD    = \relative c  { a4  | bes    d   ees     bes  | a( f)      bes   d    | ees    bes  f        f     | bes2. }


% We now collect the 4 lines together:

verseOne     = { \set stanza = "1. " \lyricsA \lyricsB \verseOneC     \verseOneD     }
verseTwo     = { \set stanza = "2. " \lyricsA \lyricsB \verseTwoC     \verseTwoD     }
verseThree   = { \set stanza = "3. " \lyricsA \lyricsB \verseThreeC   \verseThreeD   }
verseFour    = { \set stanza = "4. " \lyricsA \lyricsB \verseFourC    \verseFourD    }

sopranoNotes = { \repeat unfold 4 { \sopranoNotesA \sopranoNotesB \sopranoNotesC \sopranoNotesD } \sopranoNotesA \sopranoNotesB }
altoNotes    = { \repeat unfold 4 { \altoNotesA    \altoNotesB    \altoNotesC    \altoNotesD    } \altoNotesA    \altoNotesB    }
tenorNotes   = { \repeat unfold 4 { \tenorNotesA   \tenorNotesB   \tenorNotesC   \tenorNotesD   } \tenorNotesA   \tenorNotesB   }
bassNotes    = { \repeat unfold 4 { \bassNotesA    \bassNotesB    \bassNotesC    \bassNotesD    } \bassNotesA    \bassNotesB    }
verses       = { \verseOne \verseTwo \verseThree \verseFour \lyricsA \lyricsB }

% this section gives the broad structure of the music

global = {
	\time 4/4
	\key bes \major
  \set Timing.baseMoment  = #(ly:make-moment 1/4)
  \set Timing.beamExceptions = #'()
	\repeat unfold 4 {
    \partial 4
    \repeat unfold 4 { s4 | s1 | s1 | s1 | s2. \bar "" \break }
    \bar "||"
	}
  \repeat unfold 2 { s4 | s1 | s1 | s1 | s2. \bar "" \break }
  \bar "|."
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
		\tempo 4 = 110
	}
}


% default is A4: 210 x 297mm
#(set! paper-alist (cons '("my size" . (cons (* 210 mm) (* 1000 mm))) paper-alist))
\paper {
  #(set-paper-size "my size")
}
