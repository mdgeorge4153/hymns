% This is a lilypond file; running lilypond on it will generate a long single-page
% pdf as well as a midi file.
%
% From "Glory to God"

\version "2.18.2"
hymntitle = "Hymn #249: Because You Live, O Christ"

% There are 4 lines, here labeled A, B, C, and D; each has 4 voices and 3 verses

sopranoNotesA = \relative c' { bes4 | ees   f    g     aes | bes2.   bes4 | c4.     bes8 aes4 c    | bes4. aes8 g4    f8( ees) | f2         ees2. }
altoNotesA    = \relative c' { bes4 | ees   d    ees   ees | ees2.   ees4 | ees4.   ees8 ees4 ees  | ees4. d8   ees4  ees      | ees( d)    ees2. }
verseOneA     = \lyricmode   { Be --  cause you  live, O   | Christ, the  | gar --  den  of   the  | world has  come  to       | flow --    er; }
verseTwoA     = \lyricmode   { Be --  cause you  live, O   | Christ, the  | spir -- it   bird of   | hope  is   freed for      | fly --     ing; }
verseThreeA   = \lyricmode   { Be --  cause you  live, O   | Christ, the  | rain -- bow  of   your | peace will span  cre --     a --       tion; }
tenorNotesA   = \relative c  { bes4 | ees   bes' bes   bes | bes2.   g4   | aes4.   bes8 c4   aes  | bes4. bes8 bes4  bes      | aes2       g2. }
bassNotesA    = \relative c  { bes4 | ees   bes  ees   f   | g2.     ees4 | aes4.   g8   f4   aes  | g4.   f8   ees4  bes      | bes2       ees2. }

sopranoNotesB = \sopranoNotesA
altoNotesB    = \altoNotesA
verseOneB     = \lyricmode   { the | dark -- ness of the | tomb is | flood -- ed with your | res -- ur -- rec -- tion | pow -- er. }
verseTwoB     = \lyricmode   { our | ca -- ges of de -- spair no | lon -- ger keep us | closed and life -- de -- ny -- ing. }
verseThreeB   = \lyricmode   { the | col -- ors of your | love will | draw all hu -- man -- kind to ad -- o -- ra -- tion. }
tenorNotesB   = \tenorNotesA
bassNotesB    = \bassNotesA

sopranoNotesC = \relative c' { ees4 | f g aes g | f4. g8 aes4 bes | c bes bes( a) | bes2. bes4 | aes aes g g | f2. }
altoNotesC    = \relative c' { ees4 | d ees f ees | d4. ees8 ees4 ees | ees ees ees2 | d2. bes4 | ees f ees ees | d2. }
verseOneC     = \lyricmode   { The | stone has rolled a -- way and death can -- not im -- pris -- on! O | sing this Eas -- ter | day, }
verseTwoC     = \verseOneC
verseThreeC   = \verseOneC
tenorNotesC   = \relative c  { ees4 | bes' bes bes bes | bes4. bes8 c4 bes | g g c2 | bes2. bes4 | bes bes bes bes | bes2. }
bassNotesC    = \relative c  { ees4 | bes ees d ees | bes4. bes'8 aes4 g | ees ees f2 | bes,2. bes4 | c d ees g | bes2. }

sopranoNotesD = \relative c' { ees4 | d ees f g | aes2 f4 f | bes2 g4 g | c2 bes4 bes | ees4.( d8 c4 bes8 aes | g4 f8 ees f2) | ees2. }
altoNotesD    = \relative c' { ees4 | bes bes d ees | f2 d4 d | ees2 ees4 ees | ees2 d4 f | ees1(~ | ees2. d4) | ees2. }
verseOneD     = \lyricmode   { for  | Je -- sus Christ has | ris -- en, has | ris -- en, has | ris -- en, has | ris --  en! }
verseTwoD     = \verseOneD
verseThreeD   = \verseOneD
tenorNotesD   = \relative c' { g4 | f g bes bes | f2 bes4 bes | bes2 ees,4 ees | aes2 f4 bes | bes2( aes | ees4 g bes aes) | g2. }
bassNotesD    = \relative c  { bes4 | bes bes bes bes | bes2  bes4 aes | g2 c4 bes | aes2 bes4 aes | g2( aes | bes1) | ees2. }


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
	\key ees \major
  \set Timing.baseMoment  = #(ly:make-moment 1/4)
  \set Timing.beamExceptions = #'()
  \omit Score.TimeSignature

  \repeat unfold 3 {
    \partial 4
    s4 | \time 4/4 s1 | s1 | s1 | s1 | \time 6/4 s1 s4 \bar ""
    s4 | \time 4/4 s1 | s1 | s1 | s1 | \time 6/4 s1 s4 \bar ""
    s4 | \time 4/4 s1 | s1 | s1 | s1 | s1 | s2.        \bar ""
    s4 | s1 | s1 | s1 | s1 | s1 | s1 | s2.             \bar "" \break
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
		\tempo 4 = 120
	}
}


% default is A4: 210 x 297mm
#(set! paper-alist (cons '("my size" . (cons (* 210 mm) (* 850 mm))) paper-alist))
\paper {
  #(set-paper-size "my size")
}
