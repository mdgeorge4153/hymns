% This is a lilypond file; running lilypond on it will generate a long single-page
% pdf as well as a midi file.
%
% This is a template file; see README.md for instructions on editing it.
%
% Taken from "Glory To God" the Presbyterian Hymnal, #215

\version "2.18.2"

sopranoNotesA = \relative c' { f4 f8 aes | g4 ees | f8 f f aes | g( ees) c4 | }
verseOneA     = \lyricmode   { This is the | night, dear | friends, the night for | weep -- ing, |}
verseTwoA     = \lyricmode   { This night the | trai -- tor, | wolf with -- in the | sheep -- fold, |}
verseThreeA   = \lyricmode   { This night Christ | in -- sti -- tutes his ho -- ly | sup -- per, | }
verseFourA    = \lyricmode   { This night the | Lord by | slaves shall be ar -- rest -- ed, |}
verseFiveA    = \lyricmode   { O make us | shar -- ers, | Sav -- ior, of your | Pas -- sion, |}

sopranoNotesB = \relative c' { f4    f8     g    | aes4    aes  | bes8 bes    aes    bes   | c2 | }
verseOneB     = \lyricmode   { when  powers of   | dark -- ness | o -- ver -- come   the   | day, | }
verseTwoB     = \lyricmode   { be -- trays  him -- self    in  -- to   his    vic -- tim's | will, |}
verseThreeB   = \lyricmode   { blest food   and  | drink   for  | heart and soul and | mind; | }
verseFourB    = \lyricmode   { he who de -- stroys our | slav -- er -- y to | sin; | }
verseFiveB    = \lyricmode   { that we may | share your | glo -- ry that shall | be; | }

sopranoNotesC = \relative c''{ c4  des8 c | bes4 bes | bes8 bes c bes | aes4 g | }
verseOneC     = \lyricmode   { the night the | faith -- ful | mourn the weight of | e -- vil | }
verseTwoC     = \lyricmode   { the Lamb of | God for | sac -- ri -- fice pre -- par -- ing: |}
verseThreeC   = \lyricmode   { this night in -- jus -- tice joins its hand to | trea -- son's, | }
verseFourC    = \lyricmode   { ac -- cused of | crime, to | crim -- i -- nals be | giv -- en, | }
verseFiveC    = \lyricmode   { let us pass | through these | three  dark nights of | sor -- row | }


sopranoNotesD = \relative c' { f4  f8 g | aes bes c bes | aes( f) g4 | f2 | }
verseOneD     = \lyricmode   { where -- by our | sins the Son of | Man be -- tray. | }
verseTwoD     = \lyricmode   { sin brings a -- bout the cure for | sin's own | ill. | }
verseThreeD   = \lyricmode   { and buys the | ran -- som -- price of | hu -- man -- kind. | }
verseFourD    = \lyricmode   { that judg -- ment | on the righ -- teous | Judge be -- gin. | }
verseFiveD    = \lyricmode   { to Eas -- ter's | laugh -- ter and its | lib -- er -- ty. | }


verseOne     = { \set stanza = "1. " \verseOneA   \verseOneB   \verseOneC   \verseOneD   }
verseTwo     = { \set stanza = "2. " \verseTwoA   \verseTwoB   \verseTwoC   \verseTwoD   }
% Note this matches a mistake in the recording:
verseThree   = { \set stanza = "3. " \verseThreeA \verseFourB  \verseFourC  \verseFourD  }
verseFour    = { \set stanza = "4. " \verseFourA  \verseFourB  \verseFourC  \verseFourD  }
verseFive    = { \set stanza = "5. " \verseFiveA  \verseFiveB  \verseFiveC  \verseFiveD  }

sopranoNotes = { \repeat unfold 5 { \sopranoNotesA \sopranoNotesB \sopranoNotesC \sopranoNotesD } }
verses       = { \verseOne \verseTwo \verseThree \verseFour \verseFive }

% this section gives the broad structure of the music

global = {
	\time 2/4
  \set Timing.baseMoment  = #(ly:make-moment 1/4)
  \set Timing.beamExceptions = #'()
	\key f \minor
  \repeat unfold 5 {
    \repeat unfold 4 { \repeat unfold 4 { s2 | } \break }
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
