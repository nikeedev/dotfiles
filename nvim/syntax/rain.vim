if exists("b:current_syntax")
    finish
endif

syntax keyword rainStatement if else match int string float object struct char

syntax region rainComment start="//" end="$"

syntax region String   start=+"+    end=+"+         skip=+\\"+
syn match rainOp display "\%(+\| -\|/\|*\|=\|\^\|&\||\|!\|>\|<\|%\::\|:=\|:\)=\?"
syn keyword rainBoolean true false 

hi def link rainComment    Comment
hi def link rainStatement  Statement
hi def link rainType       Type
hi def link rainOp         Operator
hi def link rainBoolean    Boolean

