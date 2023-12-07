syntax keyword rainStatement if else match int string float object struct char

syntax match rainComment "\//"
syntax region String   start=+"+    end=+"+         skip=+\\"+
syn match rainOp display "\%(+\|-\|/\|*\|=\|\^\|&\||\|!\|>\|<\|%\)=\?"
syn keyword rainBoolean true false 
syn match rainOp display "\%(||\|::\|:=\|:\)\?"

hi def link rainComment    Comment
hi def link rainStatement  Statement
hi def link rainType       Type
hi def link rainOp         Operator
hi def link rainBoolean    Boolean

