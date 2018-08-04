\version "2.18.2"
\header { }

melody = \relative c'' {
  r4 d8\noBeam g, c4 r
}
text = \lyricmode {
  And God said,
}
upper = \relative c'' {
  <g d g,>2~ <g d g,>
}
lower = \relative c {
  b2 e
}

\score {
  <<
	\new Staff = "singer" <<
	  \new Voice = "vocal" { \melody }
	  \addlyrics { \text }
	>>
	\new PianoStaff = "piano" <<
	  \new Staff = "upper" { \upper }
	  \new Staff = "lower" { \clef "bass" \lower }
	>>
  >>
  \layout {}
}
