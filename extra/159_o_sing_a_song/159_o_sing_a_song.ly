% This is a lilypond file; running lilypond on it will generate a long single-page
% pdf as well as a midi file.
%
% This is a template file; see README.md for instructions on editing it.
%
% Taken from Hymnary.org

\version "2.18.2"

hymntitle = "Hymn #159: O Sing a Song of Bethlehem"

% There are 4 lines, here labeled A, B, C, and D; each has 4 voices and 3 verses

sopranoNotesA = \relative c'' { g8( fis8) | e4   e    e    d  | g       g     a    g8( a)   | b4      b     a8( g8)  e4  | d2. }
altoNotesA    = \relative c'  { e4        | b    b    c    a  | d       b     d    d8  fis  | g4      g     e        c   | a2. }
verseOneA     = \lyricmode    { O         | sing a    song of | Beth -- le -- hem, of       | shep -- herds watch -- ing | there, }
verseTwoA     = \lyricmode    { O         | sing a    song of | Na --   zar -- eth, of      | sun --  ny    days     of  | joy; }
verseThreeA   = \lyricmode    { O         | sing a    song of | Ga --   li -- lee, of       | lake    and   woods    and | hill, }
verseFourA    = \lyricmode    { O         | sing a    song of | Cal --  va -- ry,  its      | glo --  ry    and      dis -- may, }
tenorNotesA   = \relative c'  { b8 a      | g4   g    g   fis | g       g     fis  g8 c     | b4      d     c        g   | g2( fis4) }
bassNotesA    = \relative c   { e4        | e    e8 d c4  c   | b       e     d    b8 a     | g4      g     a        c   | d2. }

sopranoNotesB = \relative c'' { g8( fis8) | e4   e    e      d     | g       g     a       g8( a) | b4      b     a8( g8)  e4     | e2. }
altoNotesB    = \relative c'  { d4        | d    c    c8 b   a4    | d       cis   d       d8  c  | b4      d     c        c      | b2. }
verseOneB     = \lyricmode    { and       | of   the  news   that  | came    to    them    from   | an --   gels  in       the    | air. }
verseTwoB     = \lyricmode    { O         | sing of   fra -- grant | flo --  wers' breath, and    | of      the   sin --   less   | Boy. }
verseThreeB   = \lyricmode    { of        | him  who  walked up --   on      the   sea     and    | bade    its   waves    be     | still. }
verseFourB    = \lyricmode    { of        | him  who  hung   up --   on      the   tree,   and    | took    our   sins     a     -- way. }
tenorNotesB   = \relative c'  { g4        | g    g    g      fis   | g       g     fis     g8 fis | g4      g     e        e8 fis | g2. }
bassNotesB    = \relative c   { b4        | c    c8 b a4     d     | b       e     d8 c    b  a   | g4      b     c        a      | e'2. }

sopranoNotesC = \relative c'' { b8( c) | d4     b    b8      a   g4  | a       a     b2   | b4    b8    a    g4    e     | d2. }
altoNotesC    = \relative c'  { e4     | fis    fis  g8      d   d4  | e       d     d2   | g4    g8    fis  d4    c8 b  | a2. }
verseOneC     = \lyricmode    { The    | light  that shone   _   on  | Beth -- le -- hem  | fills all   the  world to   -- day; }
verseTwoC     = \lyricmode    { For    | now    the  flowers of  Na -- zar --  eth   in   | ev -- ery   _    heart may   | grow; }
verseThreeC   = \lyricmode    { For    | though like waves   _   on  | Ga --   li -- lee, | dark  seas  of   trou -- ble | roll, }
verseFourC    = \lyricmode    { For    | he     who  died    _   on  | Cal --  va -- ry   | is    ri -- sen  from  the   | grave, }
tenorNotesC   = \relative c'  { g4     | b      d    d8      c   b4  | a8 g    fis4  g2   | d'4   d8    c    b4    g     | g2( fis4) }
bassNotesC    = \relative c   { e4     | b      b'   e,8     fis g4  | c,      d     g,2  | g4    g8    a    b4    c     | d2. }

sopranoNotesD = \relative c'' { g8( fis8) | e4      e    e8( d) e( fis) | g4     g      a     g8( a) | b4    b    a8( g8)  e4     | e2. }
altoNotesD    = \relative c'  { d4        | d       c    c      c       | d      d8 cis d4    d8  c  | b4    d    e        c      | b2. }
verseOneD     = \lyricmode    { of        | Je --   sus' birth, and     | peace  on     earth the    | an -- gels sing     al    -- way. }
verseTwoD     = \lyricmode    { now       | spreads the  fame   of      | his    dear   name  on     | all   the  winds    that   | blow. }
verseThreeD   = \lyricmode    { when      | faith   has  heard  the     | Mas -- ter's  work, falls  | peace up -- on      the    | soul. }
verseFourD    = \lyricmode    { and       | Christ  our  Lord,  by      | heaven a --   dored is     | migh -- ty now      to     | save. }
tenorNotesD   = \relative c'  { g4        | g       g    a      c       | b8 a   g4     fis   g8 fis | g4    fis  e        e8 fis | << g2. e2. >> }
bassNotesD    = \relative c   { b4        | c       c8 b a4     a'      | g8 fis e4     d     b8 a   | g4    b    c        a      | e2. }


% We now collect the 4 lines together:

verseOne   = { \set stanza = "1. " \verseOneA     \verseOneB     \verseOneC     \verseOneD     }
verseTwo   = { \set stanza = "2. " \verseTwoA     \verseTwoB     \verseTwoC     \verseTwoD     }
verseThree = { \set stanza = "3. " \verseThreeA   \verseThreeB   \verseThreeC   \verseThreeD   }
verseFour  = { \set stanza = "4. "  \verseFourA    \verseFourB    \verseFourC    \verseFourD    }

verses       = { \verseOne \verseTwo \verseThree \verseFour }

sopranoNotes = { \repeat unfold 4 { \sopranoNotesA \sopranoNotesB \sopranoNotesC \sopranoNotesD } }
altoNotes    = { \repeat unfold 4 { \altoNotesA    \altoNotesB    \altoNotesC    \altoNotesD    } }
tenorNotes   = { \repeat unfold 4 { \tenorNotesA   \tenorNotesB   \tenorNotesC   \tenorNotesD   } }
bassNotes    = { \repeat unfold 4 { \bassNotesA    \bassNotesB    \bassNotesC    \bassNotesD    } }

% this section gives the broad structure of the music

global = {
	\time 4/4
	\key e \minor
  \set Timing.baseMoment  = #(ly:make-moment 1/4)
  \set Timing.beamExceptions = #'()
  \partial 4
	\repeat unfold 4 {
		\repeat unfold 4 { s4 | s1 | s1 | s1 | s2. \bar "" \break }
	} \alternative { { \bar "||" } { \bar "|." } }
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
#(set! paper-alist (cons '("my size" . (cons (* 210 mm) (* 900 mm))) paper-alist))
\paper {
  #(set-paper-size "my size")
}
