syntax keyword jsNull null conceal cchar=∅ containedin=javaFold,javaParenT,javaParenT1,javaParenT2
syntax match assignment2 "=" conceal cchar=← containedin=javaFold,javaParenT,javaParenT1,javaParenT2
syntax match javaFuncDef "->" conceal cchar=⇒ containedin=javaFold,javaParenT,javaParenT1,javaParenT2
" syntax match javaFuncDef "->" conceal cchar=→ containedin=javaFold,javaParenT
syntax match empty "null" conceal cchar=∅ containedin=javaFold,javaParenT,javaParenT1,javaParenT2
syntax match and "&&" conceal cchar=∧ containedin=javaFold,javaParenT,javaParenT1,javaParenT2
syntax match or "||" conceal cchar=∨ containedin=javaFold,javaParenT,javaParenT1,javaParenT2
syntax match not "!" conceal cchar=¬ containedin=javaFold,javaParenT,javaParenT1,javaParenT2
syntax match mul "*" conceal cchar=× containedin=javaFold,javaParenT,javaParenT1,javaParenT2
syntax match eq "==" conceal cchar=≣ containedin=javaFold,javaParenT,javaParenT1,javaParenT2
syntax match neq "!=" conceal cchar=≠ containedin=javaFold,javaParenT,javaParenT1,javaParenT2
syntax match gteq ">=" conceal cchar=≥ containedin=javaFold,javaParenT,javaParenT1,javaParenT2
syntax match lteq "<=" conceal cchar=≤ containedin=javaFold,javaParenT,javaParenT1,javaParenT2
" syntax match commentStart "\/\*" conceal cchar=╔ containedin=javaComment
" syntax match commentBody "[^\/]\*[^\/]" conceal cchar=║ containedin=javaComment
" syntax match commentEnd "\*\/" conceal cchar=╚ containedin=javaComment
