% This is a lilypond file; running lilypond on it will generate a long single-page
% pdf as well as a midi file.
%
% This is a template file; see README.md for instructions on editing it.
%
% Taken from "Glory To God", Hymn 232

\version "2.18.2"
hymntitle = "Hymn #232: Jesus Christ Is Risen Today"

% There are 4 lines, here labeled A, B, C, and D; each has 4 voices and 3 verses

sopranoNotesA = \relative c' { c4 e g c, | f a a( g) | e8( f g c, f4) e8( f) | e4( d) c2 | }
altoNotesA    = \relative c' { c4 c d c | c f f( e) | c2~ c8 b c4 | d( b) c2 | }
verseOneA     = \lyricmode   { Je -- sus Christ is | risen to -- day, | Al -- le -- lu -- ia! | }
verseTwoA     = \lyricmode   { Hymns of praise then | let us sing, | Al -- le -- lu -- ia! | }
verseThreeA   = \lyricmode   { But the pains which | he en -- dured, | Al -- le -- lu -- ia! | }
verseFourA    = \lyricmode   { Sing we to our | God a -- bove, | Al -- le -- lu -- ia! | }
tenorNotesA   = \relative c  { e4 g g e | c' c c2 | g~ g4 g8 f | g4.( f8) e2 |}
bassNotesA    = \relative c  { c4 c b c | a' f c2 | c8( d e4 d) c8 a | g2 c | }

sopranoNotesB = \relative c' { f4 g a g  | f e e( d) | e8( f g c, f4) e8( f) | e4( d) c2 | }
altoNotesB    = \relative c' { c4 c c c | s8 b c4 c( b) | c2~ c8 b c4 | d( b) c2 | }
verseOneB     = \lyricmode   { our tri -- um -- phant | ho -- ly day,  | Al -- le -- lu -- ia! | }
verseTwoB     = \lyricmode   { un -- to Christ, our | heaven -- ly King, | Al -- le -- lu -- ia! | }
verseThreeB   = \lyricmode   { our sal -- va -- tion | have pro -- cured.  | Al -- le -- lu -- ia! | }
verseFourB    = \lyricmode   { praise e -- ter -- nal | as God's love. | Al -- le -- lu -- ia! | }
tenorNotesB   = \relative c  { e4 g g e | c' c c2 | g~ g4 g8 f | g4.( f8) e2 |}
bassNotesB    = \relative c  { c4 c b c | a' f c2 | c8( d e4 d) c8 a | g2 c | }

sopranoNotesC = \relative c''{ b4 c d g, | c d e2 | b8( c d g, c4) b8( c) | g4( a) g2 | }
altoNotesC    = \relative c''{ g4. fis8 g4 g | g f e2 | g2~ g8 fis g4 | g( fis) g2 | }
verseOneC     = \lyricmode   { who did once up -- on the cross, | Al -- le -- lu -- ia! | }
verseTwoC     = \lyricmode   { who en -- dured the | cross and grave, | Al -- le -- lu -- ia! | }
verseThreeC   = \lyricmode   { Now a -- bove the | sky he's King, | Al -- le -- lu -- ia! | }
verseFourC    = \lyricmode   { Praise our God, ye | heaven -- ly host, | Al -- le -- lu -- ia! | }
tenorNotesC   = \relative c' { d4 c b b | c4. b8 c2 | d2~ d4 d8 c | d4. b8 b2 | }
bassNotesC    = \relative c' { g4 a b g8 f | e4 d c2 | g'8( a b4 a) g8 e | d2 g,2 | }

sopranoNotesD = \relative c''{ g8([ a)] b([ g)] c4 e, | f a a( g) | c8( b c g a b) c([ d)] | c4( b) c2 | }
altoNotesD    = \relative c' { b8[ c] d[ b] c4 c | c f f( e) | e8( f g e f4) e8 f | e4( g8 f) e2 | }
verseOneD     = \lyricmode   { suf -- fer to re -- deem our loss. | Al -- le -- lu -- ia! | }
verseTwoD     = \lyricmode   { sin -- ners to re -- deem and save. | Al -- le -- lu -- ia! | }
verseThreeD   = \lyricmode   { where the an -- gels | ev -- er sing. | Al -- le -- lu -- ia! | }
verseFourD    = \lyricmode   { Fa -- ther, Son, and | Ho -- ly Ghost. | Al -- le -- lu -- ia! | }
tenorNotesD   = \relative c' { g4 g g c | c c c2 | c8( g c4~ c8 g) c4 | c( d) c2 | }
bassNotesD    = \relative c' { g4 f e c'8 b | a4 f c2 | c8( d e c f g) a[ f] | g2 c,2 | }


% We now collect the 4 lines together:

verseOne     = { \set stanza = "1. " \verseOneA     \verseOneB     \verseOneC     \verseOneD     }
verseTwo     = { \set stanza = "2. " \verseTwoA     \verseTwoB     \verseTwoC     \verseTwoD     }
verseThree   = { \set stanza = "3. " \verseThreeA   \verseThreeB   \verseThreeC   \verseThreeD   }
verseFour    = { \set stanza = "4. " \verseFourA    \verseFourB    \verseFourC    \verseFourD    }

sopranoNotes = { \repeat unfold 4 { \sopranoNotesA \sopranoNotesB \sopranoNotesC \sopranoNotesD } }
altoNotes    = { \repeat unfold 4 { \altoNotesA    \altoNotesB    \altoNotesC    \altoNotesD    } }
tenorNotes   = { \repeat unfold 4 { \tenorNotesA   \tenorNotesB   \tenorNotesC   \tenorNotesD   } }
bassNotes    = { \repeat unfold 4 { \bassNotesA    \bassNotesB    \bassNotesC    \bassNotesD    } }
verses       = { \verseOne \verseTwo \verseThree \verseFour }

% this section gives the broad structure of the music

global = {
	\time 4/4
	\key c \major
  \set Timing.baseMoment  = #(ly:make-moment 1/2)
  \set Timing.beamExceptions = #'()
	\repeat unfold 4 {
		\repeat unfold 4 { s1 | s1 | s1 | s1 | \break }
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
