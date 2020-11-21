% This is a lilypond file; running lilypond on it will generate a long single-page
% pdf as well as a midi file.
%
% The music and text was taken from the hymnal Glory To God (C) 2013, Hymn 36


\version "2.18.2"


global = {
	\autoBeamOff
	\time 4/4
	\key f \major
	\repeat unfold 3 {
		s1 | s  | s | s | % \break
		s  | s  | s | s | % \break
		s  | s  | s | s | % \break
		s  | s  | s | % \break
		% s  | s  | s | s2 \bar "" \break
		% s2 | s1 | s | s |
	} \alternative { { s \bar "||" } { s \bar "|." } }
}

colorbox = {s%
		-\tweak layer #-2
		-\markup {
			\with-dimensions #'(0 . 0) #'(0 . 0)
			% specify color
			\with-color #(rgb-color 0.99 0.98 0.9)
			% specify size
			\filled-box #'(-1000 . 1000) #'(-1000 . 4000) #0
	}
}

% There are 4 systems, here labeled A, B, C, and D; each has 4 voices and 3 verses

sopranoNotesA = \relative  { f'4. e8  d4     f     | g4.   f8     e4      c    | d2      e4.  e8  | f1    | }
altoNotesA    = \relative  { a4   c   d      c     | d     d      c       c    | c( bes) a    bes | a1    | }
verseOneA     = \lyricmode { For  the fruit  of    | all   cre -- a --    tion | thanks  be   to  | God.  | }
verseTwoA     = \lyricmode { In   the just   re   -- ward  of     la --   bor  | God's   will be  | done. | }
verseThreeA   = \lyricmode { For  the har -- vests | of    the    Spir -- it   | thanks  be   to  | God.  | }
tenorNotesA   = \relative  { f4   f   f      f     | bes4. a8     g4      f4   | f2      e4   g   | f1    | }
bassNotesA    = \relative  { f,4  a   bes    a     | g     bes    c       a    | bes2    c4.  c8  | f,1   | }

sopranoNotesB = \sopranoNotesA
altoNotesB    = \altoNotesA
verseOneB     = \lyricmode { For the gifts to | ev -- ery na    -- tion, | thanks be   to | God.  | }
verseTwoB     = \lyricmode { In  the help  we | give  our neigh -- bor,  | God's  will be | done. | }
verseThreeB   = \lyricmode { For the good  we | all   in -- her -- it,   | thanks be   to | God.  | }
tenorNotesB   = \tenorNotesA
bassNotesB    = \bassNotesA

sopranoNotesC = \relative  { bes'4 a   bes      c    | d      c     bes     a    | bes   a    g      f     | a4.   g8     f4       e    | }
altoNotesC    = \relative  { bes4  c   bes      f'   | f      ees   d       c    | d     f    d      d     | d4.   d8     c4       c    | }
verseOneC     = \lyricmode { For   the plow  -- ing, | sow -- ing,  reap -- ing, | si -- lent growth while | we    are    sleep -- ing, | }
verseTwoC     = \lyricmode { In    our world -- wide | task   of    car  -- ing  | for   the  hun -- gry   | and   de --  spair -- ing, | }
verseThreeC   = \lyricmode { For   the won   -- ders | that   as -- tound   us,  | for   the  truths that  | still con -- found    us,  | }
tenorNotesC   = \relative  { f4    f   f        f    | bes    g     f       a    | g     c    bes    a     | bes4. bes8   g4       g    | }
bassNotesC    = \relative  { d4    f   d        a    | bes    c     d       f    | g,    a    bes    d     | g,4.  bes8   c4       c    | }

sopranoNotesD = \sopranoNotesA
altoNotesD    = \relative  { c'4.  c8   bes4   c     | d       d       c       c    | c( bes) a    bes | a1    | }
verseOneD     = \lyricmode { fu -- ture needs  in    | earth's safe -- keep -- ing, | thanks  be   to  | God.  | }
verseTwoD     = \lyricmode { in    the  har -- vests | we      are     shar -- ing, | God's   will be  | done. | }
verseThreeD   = \lyricmode { most  of   all    that  | love    has     found   us,  | thanks  be   to  | God.  | }
tenorNotesD   = \relative  { f4.   f8   f4     f     | bes4.   a8      g4      f4   | f2      e4   g   | f1    | }
bassNotesD    = \relative  { a,4.  a8   bes4   a     | g       bes     c       a    | bes2    c4.  c8  | f,1   | }

% We now collect the 4 systems together:

verseOne     = { \set stanza = "1. " \verseOneA     \verseOneB     \verseOneC     \verseOneD     }
verseTwo     = { \set stanza = "2. " \verseTwoA     \verseTwoB     \verseTwoC     \verseTwoD     }
verseThree   = { \set stanza = "3. " \verseThreeA   \verseThreeB   \verseThreeC   \verseThreeD   }

sopranoNotes = { \repeat unfold 3 { \sopranoNotesA \sopranoNotesB \sopranoNotesC \sopranoNotesD } }
altoNotes    = { \repeat unfold 3 { \altoNotesA    \altoNotesB    \altoNotesC    \altoNotesD    } }
tenorNotes   = { \repeat unfold 3 { \tenorNotesA   \tenorNotesB   \tenorNotesC   \tenorNotesD   } }
bassNotes    = { \repeat unfold 3 { \bassNotesA    \bassNotesB    \bassNotesC    \bassNotesD    } }
verses       = { \verseOne \verseTwo \verseThree }

% And here is the score:

\header {
	tagline = ##f
	title = \markup {
		\with-dimensions #'(0 . 0) #'(0 . 0)
		% specify color
		\with-color #(rgb-color 0.99 0.98 0.9)
		% specify size
		\filled-box #'(-1000 . 1000) #'(-1000 . 4000) #0
		"#36: For the Fruit of All Creation"
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
#(set! paper-alist (cons '("my size" . (cons (* 210 mm) (* 650 mm))) paper-alist))
\paper {
  #(set-paper-size "my size")
}
