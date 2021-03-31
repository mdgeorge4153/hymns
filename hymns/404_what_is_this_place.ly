% This is a lilypond file; running lilypond on it will generate a long single-page
% pdf as well as a midi file.
%
% This is a template file; see README.md for instructions on editing it.
%
% Taken from "Glory to God, the Presbyterian Hymnal", Hymn # 404

\version "2.20.0"

% There are 4 lines, here labeled A, B, C, and D; each has 4 voices and 3 verses

sopranoNotesA = \relative c'' { bes4  bes8 bes    bes2   | d4    c8   bes a4      f    | g      f8   g   f4      bes | }
altoNotesA    = \relative c'  { d4    ees8 ees    d2     | f4    f8   f   f4      c    | ees    f8   ees d4      f   | }
verseOneA     = \lyricmode    { What  is   this   place, | where we   are meet -- ing? | On --  ly   a   house,  the | }
verseTwoA     = \lyricmode    { Words from a --   far,   | stars that are fall -- ing. | Sparks that are sown    in  | }
verseThreeA   = \lyricmode    { And   we   acc -- ept    | bread at   his ta --   ble, | bro -- ken  and shared, a   | }
tenorNotesA   = \relative c   { f4    g8   g      f2     | bes4  c8   d   c4      a    | bes    bes8 bes bes4    bes | }
bassNotesA    = \relative c   { bes4  ees8 ees    bes2   | bes'4 a8   bes f4      f    | ees    d8   ees bes4    d   | }

sopranoNotesB = \relative c'' { bes4   a    bes2   | bes4  bes8 bes  bes2   | d4      c8     bes a4     f    | g4      f8   g    }
altoNotesB    = \relative c'  { c4     f    f2     | d4    ees8 ees  d2     | f4      f8     f   f4     c    | ees     f8   ees  }
verseOneB     = \lyricmode    { earth  its  floor. | Walls and  a    roof,  | shel -- ter -- ing peo -- ple, | win  -- dows for  }
verseTwoB     = \lyricmode    { us     like seed:  | names for  our  God,   | dreams, signs, and won -- ders | sent    from the  }
verseThreeB   = \lyricmode    { liv -- ing  sign.  | Here  in   this world, | dy --   ing    and liv -- ing, | we      are  each }
tenorNotesB   = \relative c'  { c4     c    d2     | f,4   g8   g    f2     | bes4    c8     d   c4     a    | bes     bes8 bes  }
bassNotesB    = \relative c   { f4     f    bes2   | bes,4 ees8 ees  bes2   | bes'4   a8     bes f4     f    | ees     d8   ees  }

sopranoNotesC = \relative c' { f4     bes4 | bes   a   bes2  | f4    g8   a     bes4  f     | g      f8  ees   }
altoNotesC    = \relative c' { d4     f    | c     f   f2    | d4    ees8 ees   f4    d     | ees8( d) c c     }
verseOneC     = \lyricmode   { light, an   | o --  pen door. | Yet   it   be -- comes a     | bod -- y   that  }
verseTwoC     = \lyricmode   { past   are  | what  we  need. | We    in   this  place re   -- mem -- ber and   }
verseThreeC   = \lyricmode   { oth -- er's | bread and wine. | This  is   the   place where | we     can re -- }
tenorNotesC   = \relative c' { bes4   bes  | c     c   d2    | bes4  bes8 c     bes4  bes   | bes    a8  a     }
bassNotesC    = \relative c  { bes4   d    | f     f   bes2  | bes,4 ees8 c     d4    bes   | ees    f8  f     }

sopranoNotesD = \relative c' { d4    bes  | d    c    d        e    | f2.     f4    | g      bes   bes     a     | bes1   | }
altoNotesD    = \relative c' { bes4  bes  | bes  c    bes      bes  | c2.     c4    | ees    f     ees     c     | d1     | }
verseOneD     = \lyricmode   { lives when | we   are  gath --  ered | here,   and   | know   our   God     is    | near.  | }
verseTwoD     = \lyricmode   { speak a --   gain what we       have | heard:  God's | free   re -- deem -- ing   | word.  | }
verseThreeD   = \lyricmode   { ceive what | we   need to       in  -- crease: God's | jus -- tice  and     God's | peace. | }
tenorNotesD   = \relative c  { f4    f    | f    f    f        g    | a2.     a4    | bes4.  a8    g4      f     | f1     | }
bassNotesD    = \relative c  { bes4  f    | bes  a    bes8( a) g4   | f2.     f'4   | ees    d     ees     f     | bes,1  | }


% We now collect the 4 lines together:

verseOne     = { \set stanza = "1. " \verseOneA     \verseOneB     \verseOneC     \verseOneD     }
verseTwo     = { \set stanza = "2. " \verseTwoA     \verseTwoB     \verseTwoC     \verseTwoD     }
verseThree   = { \set stanza = "3. " \verseThreeA   \verseThreeB   \verseThreeC   \verseThreeD   }

sopranoNotes = { \repeat unfold 3 { \sopranoNotesA \sopranoNotesB \sopranoNotesC \sopranoNotesD } }
altoNotes    = { \repeat unfold 3 { \altoNotesA    \altoNotesB    \altoNotesC    \altoNotesD    } }
tenorNotes   = { \repeat unfold 3 { \tenorNotesA   \tenorNotesB   \tenorNotesC   \tenorNotesD   } }
bassNotes    = { \repeat unfold 3 { \bassNotesA    \bassNotesB    \bassNotesC    \bassNotesD    } }
verses       = { \verseOne \verseTwo \verseThree }

% this section gives the broad structure of the music

global = {
	\time 4/4
	\key bes \major
  \set Timing.baseMoment  = #(ly:make-moment 1/4)
  \set Timing.beamExceptions = #'()
	\repeat unfold 3 {
		\repeat unfold 6 { s1 | }
    \repeat unfold 6 { s1 | }
    \repeat unfold 2 { s1 | }
	} \alternative { { \bar "||" \break } { \bar "|." } }
}

% And here is the score:

hymntitle = "Hymn #404: What is This Place"

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
      \override LyricText.word-space = #5.0
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
