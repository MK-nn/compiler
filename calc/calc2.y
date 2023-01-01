%{

#include <stdio.h>

int  yylex(void);

int yyparse(void);

void yyerror(const char *s);

%}

%start input

%%

input  : expr '\n'       { printf("%d\n", $1); }
       ;

expr   : expr '+' term   { $$ = $1 + $3; }
       | expr '-' term   { $$ = $1 - $3; }
       | term
       ;

term   : term '*' factor { $$ = $1 * $3; }
       | term '/' factor { $$ = $1 / $3; }
       | factor
       ;

factor : '(' expr ')'    { $$ = $2; }
       | '0'             { $$ = 0; }
       | '1'             { $$ = 1; }
       | '2'             { $$ = 2; }
       | '3'             { $$ = 3; }
       | '4'             { $$ = 4; }
       | '5'             { $$ = 5; }
       | '6'             { $$ = 6; }
       | '7'             { $$ = 7; }
       | '8'             { $$ = 8; }
       | '9'             { $$ = 9; }
       ;

%%

yylex()
{
  int c;

  while ((c = getchar()) == ' ');
  return c;
}
