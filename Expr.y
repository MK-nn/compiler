%{

#include <stdio.h>
#include <ctype.h>

int  yylex(void);

int yyparse(void);

void yyerror(const char *s);

%}

%start input

%%

input  : expr '\n'  
       ;

expr   : expr '+' term
       | expr '-' term
       | term
       ;

term   : term '*' factor
       | term '/' factor
       | factor
       ;

factor : 'i'
       | '(' expr ')'
       ;

%%

yylex()
{
  return getchar();
}