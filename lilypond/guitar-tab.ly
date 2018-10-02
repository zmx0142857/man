\version "2.18.2"

song = {
    e4 d c d e e e2 d4 d d2 e4 e e2
    e4 d c d e e e c d d e d c2 r2
}

\score {
  <<
    \new Staff \relative c' {
        \song
    }

    \new TabStaff {
        \override Stem #'transparent = ##t
        \override Beam #'transparent = ##t
        \song
    }
  >>
}
