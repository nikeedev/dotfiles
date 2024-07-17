if exists("b:current_syntax")
    finish
endif

syntax keyword rainConditions if else match 

syntax keyword rainRepeat for return println print

syntax keyword rainTypes int string bool char float i8 i16 i64 u8 u16 u32 u64 f64 null 

syntax keyword rainLabels case default 

syntax region rainComment start="//" end="$"

syntax match rainOperators /\v[+\-\/*=^&|!><%"::":"=:"]/ 
syntax keyword rainBoolean true false 
set iskeyword=a-z,A-Z,-,*,_,!,@

" Char literals
syntax region rainChar start=/\v'/ skip=/\v\\./ end=/\v'/ contains=rainEscapes

syntax region rainString start=/\v"/ skip=/\v\\./ end=/\v"/ contains=rainEscapes

" Escape literals \n, \r, ....
syntax match rainEscapes display contained "\\[nr\"']"

syntax match rainConstant /\v[a-zA-Z0-9]/

hi def link rainConstant   Constant
hi def link rainComment    Comment
hi def link rainKeywords   Keyword
hi def link rainTypes      Type
hi def link rainOp         Operator
hi def link rainBoolean    Boolean
hi def link rainString     String
hi def link rainChar       Character
hi def link rainEscapes    SpecialChar
hi def link rainConditions Conditional
hi def link rainRepeat     Repeat
hi def link rainLabels     Label

let b:current_syntax = "rain"
