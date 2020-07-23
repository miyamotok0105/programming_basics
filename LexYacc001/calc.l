/* Cコードの記載 */
%{ 
#include <stdio.h> 
#include "y.tab.h" 


/* yywrap関数の定義がないとlexのライブラリのリンクが必要になり、 
  環境によってコンパイルが面倒なことになることがあるらしい。 */ 
int 
yywrap(void) 
{ 
    return 1; 
} 
%} 


/* 規則部 */ 
/* 入力された文字列が正規表現にマッチした場合、 
   その後ろのCのコードが実行される。 */ 
%% 
"+"             return ADD; 
"-"             return SUB; 
"*"             return MUL; 
"/"             return DIV; 
"("             return LP; 
")"             return RP; 
"\n"            return CR; 

([1-9][0-9]*)|0|([0-9]+\.[0-9]*) { 
    double temp; 
    sscanf(yytext, "%lf", &temp); 
    yylval.double_value = temp; 
    return DOUBLE_LITERAL; 
} 
[ \t] ; 
. { 
    fprintf(stderr, "lexical error.\n"); 
    exit(1); 
} 
%% 