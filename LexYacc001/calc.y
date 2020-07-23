// Cコードの記載 
%{ 
#include <stdio.h> 
#include <stdlib.h> 
#define YYDEBUG 1 
%} 


// トークンと非終端子の型宣言 
%union { 
    int          int_value; 
    double       double_value; 
} 


// トークンの宣言 
/* DOUBLE_LITERAL に関してはトークンの種類が分かるだけではなく、 
  値を持つので、その型(%unionのメンバ)も指定する。 */ 
%token <double_value>      DOUBLE_LITERAL 
%token ADD SUB MUL DIV CR LP RP 


// 非終端子の型宣言 
/* 規則部で利用される"$$"、"$1"、"$2"などの変数に代わる非終端子の 
   型宣言は必須。 */ 
%type <double_value> expression term primary_expression 


// 構文規則と、アクションを記述した規則部 
%% 
line_list 
    : line 
    | line_list line 
    ; 
line 
    : expression CR 
    { 
        printf(">>%lf\n", $1); 
    } 
    | error CR 
    { 
        yyclearin; 
        yyerrok; 
    } 
    ; 
expression 
    : term 
    | expression ADD term 
    { 
        $$ = $1 + $3; 
    } 
    | expression SUB term 
    { 
        $$ = $1 - $3; 
    } 
    ; 
term 
    : primary_expression 
    | term MUL primary_expression 
    { 
        $$ = $1 * $3; 
    } 
    | term DIV primary_expression 
    { 
        $$ = $1 / $3; 
    } 
    ; 
primary_expression 
    : DOUBLE_LITERAL 
    | LP expression RP 
    { 
        $$ = $2; 
    } 
    | SUB primary_expression 
    { 
        $$ = -$2; 
    } 
    ; 
%% 


int 
yyerror(char const *str) 
{ 
    extern char *yytext; 
    fprintf(stderr, "parser error near %s\n", yytext); 
    return 0; 
} 


int main(void) 
{ 
    extern int yyparse(void); 
    extern FILE *yyin; 


    yyin = stdin; 
    if (yyparse()) { 
        fprintf(stderr, "Error ! Error ! Error !\n"); 
        exit(1); 
    } 
} 
