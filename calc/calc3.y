%{

#include <stdio.h>
#include <ctype.h>

int  yylex(void);

int yyparse(void);

void yyerror(const char *s);

%}

%start input

%token NUM

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
       | NUM
       ;

%%

yylex()
{
  int c;

  while ((c = getchar()) == ' ');
  if (isdigit(c)) {
    yylval = c - '0';
    while (isdigit(c = getchar()))
      yylval = yylval * 10 + (c-'0');
    ungetc(c, stdin);
    return NUM;
  }else 
    return c;
}
