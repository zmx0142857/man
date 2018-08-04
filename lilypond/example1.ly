\version "2.8.12"

\header {
  title = "etude"
  composer = "me"
  opus = "???"
}
\relative c,
{
	\clef "bass"
	\key e \minor
	\time 4/4
	\tempo 4 = 154
	
	e8. e16 a( b) d( e) g8 e e16 d dis e |
	g8 e e16 d dis e g8 e16 a g e d b |
	e,8. e16 a( b) d( e) g8 e e16 d dis e |
	e'8 d16 b d b a g e d dis e g e d b
	\bar "||"
}

\relative c
{
	\clef "bass"
	\key a \minor
	\time 4/4
	\tempo 4 = 148
	
	\tuplet 3/2 {c8 a a} \tuplet 3/2 {a8 a a}
	\tuplet 3/2 {g8 a a} \tuplet 3/2 {a8 a a} |
	\tuplet 3/2 {c8 a d} \tuplet 3/2 {a8 e' a,}
	\tuplet 3/2 {f'8 a, e'} \tuplet 3/2 {a,8 d a} |
	\tuplet 3/2 {c8 a a} \tuplet 3/2 {a8 a a}
	\tuplet 3/2 {g8 a a} \tuplet 3/2 {a8 a a} |
	\tuplet 3/2 {f'8 c' f} \tuplet 3/2 {e,8 b' e}
	\tuplet 3/2 {d,8 a' d} \tuplet 3/2 {c,8 g' c} \bar "||"
}

\relative c'' {
<<
	\new Staff { \clef "treble" c4 }
	\new Staff { \clef "bass" c,,4 }
>>
}
