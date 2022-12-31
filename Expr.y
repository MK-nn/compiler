%{

#include <stdio.h>
#include <ctype.h>
#include <math.h>

int  yylex(void);

int yyparse(void);

void yyerror(const char *s);

%}

%start input

%token NUM UMINUS

%left '+' '-'
%left '*' '/'
%right '^'
%right UMINUS

%%

input  : 
       | input expr '\n'        { printf("%d\n", $2); }
       | input error '\n'       { yyerrok; }
       ;

expr   : expr '+' expr          { $$ = $1 + $3; }
       | expr '-' expr          { $$ = $1 - $3; }
       | expr '*' expr          { $$ = $1 * $3; }
       | expr '/' expr          { $$ = $1 / $3; }
       | expr '^' expr          { $$ = pow($1, $3); }
       | '-' expr %prec UMINUS  { $$ = -$2; }
       | '(' expr ')'           { $$ = $2; }
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