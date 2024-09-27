if exists("b:current_syntax")
    finish
endif

syntax keyword rainConditions if else match 

syntax keyword rainRepeat for return println print

syntax keyword rainTypes int string bool char float i8 i16 i64 u8 u16 u32 u64 f64 null  

syntax keyword rainLabels case default goto break

syntax match rainOperators /\v[+\-\/*=^&|!><%"::":"=:"]/ 
syntax keyword rainBoolean true false 
set iskeyword=a-z,A-Z,-,*,_,!,@

" Char literals
syntax region rainChar start=/\v'/ skip=/\v\\./ end=/\v'/ contains=rainEscapes

syntax region rainString start=/\v"/ skip=/\v\\./ end=/\v"/ contains=rainEscapes

syn match rainComment "//.*$"

" Escape literals \n, \r, ....
syntax match rainEscapes display contained "\\[nr\"']"

syntax match rainConstant /\v[a-zA-Z0-9]/

hi link rainConstant   Constant
hi link rainComment    Comment
hi link rainKeywords   Keyword
hi link rainTypes      Type
hi link rainOp         Operator
hi link rainBoolean    Boolean
hi link rainString     String
hi link rainChar       Character
hi link rainEscapes    SpecialChar
hi link rainConditions Conditional
hi link rainRepeat     Repeat
hi link rainLabels     Label

let b:current_syntax = "rain"
