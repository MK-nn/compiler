%{

#include <math.h>
#include <stdio.h>

int yylex();
int yyparse(void);

void yyerror(const char *s);

#define M_SIZE 16
double Memory[M_SIZE];

%}

%start input

%union{
  int    ival;
  double rval;
}

%token MEM LOG EXP SQRT UMINUS
%token <ival> INTC;
%token <rval> REALC;

%type <ival> mcell;
%type <rval> expr;

%left '+' '-'
%left '*' '/'
%right '^'
%right UMINUS

%%

input  : 
       | input expr '\n'        { printf("%f\n", $2); }
       | input error '\n'       { yyerrok; }
       ;

expr   : mcell '=' expr         { $$ = Memory[$1] = $3; }
       | expr '+' expr          { $$ = $1 + $3; }
       | expr '-' expr          { $$ = $1 - $3; }
       | expr '*' expr          { $$ = $1 * $3; }
       | expr '/' expr          { $$ = $1 / $3; }
       | expr '^' expr          { $$ = pow($1, $3); }
       | '-' expr %prec UMINUS  { $$ = -$2; }
       | '(' expr ')'           { $$ = $2; }
       | LOG '(' expr ')'       { $$ = log($3); }
       | EXP '(' expr ')'       { $$ = exp($3); }
       | SQRT '(' expr ')'      { $$ = sqrt($3); }
       | mcell                  { $$ = Memory[$1]; }
       | INTC                   { $$ = (double)$1; }
       | REALC                  { $$ = $1; }
       ;

mcell  : MEM '[' INTC ']'       { if ($3 >= 0 && $3 <= M_SIZE)
                                    $$ = $3;
                                  else {
                                    printf("Memory Fault\n");
                                    $$ = 0;
                                  }
                                }
       ;

%%

main()
{
  yyparse();
}

yyerorr(char *msg)
{
  printf("%s\n", msg);
}