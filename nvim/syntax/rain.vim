if exists("b:current_syntax")
    finish
endif

syntax keyword rainKeywords if else match for null return 
syntax keyword rainTypes int string bool char float i8 i16 i64 u8 u16 u32 u64 f64

syntax region rainComment start="//" end="$"

syntax region rainString   start=+"+    end=+"+         skip=+\\"+
syntax match rainOp /\v[+\-\/*=^&|!><%"::":"=:"]/
syntax keyword rainBoolean true false 
set iskeyword=a-z,A-Z,-,*,_,!,@

" Char literals
syntax region rainChar start=/\v'/ skip=/\v\\./ end=/\v'/ contains=rainEscapes

" Escape literals \n, \r, ....
syntax match rainEscapes display contained "\\[nr\"']"


hi def link rainComment    Comment
hi def link rainKeywords   Keywords
hi def link rainTypes      Type
hi def link rainOp         Operator
hi def link rainBoolean    Boolean
hi def link rainString     String
hi def link rainChar       Character
hi def link rainEscapes    SpecialChar

let b:current_syntax = "rain"
