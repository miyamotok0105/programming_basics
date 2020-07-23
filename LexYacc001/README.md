
参考
    
https://alpha-netzilla.blogspot.com/2010/07/lexyacc.html


言語は字句解析と構文解析の組み合わせ。
字句解析は分割することで、lexかflexを使用。
構文解析は解析木を構築することで、bisonかyaccを使用。
yaccでlexするか、bisonでflexするか。
bisonの方がエラーは見やすいらしい。


```
% yacc -dv calc.y 
% lex calc.l 
% gcc -o calc y.tab.c lex.yy.c
```

```
% bison --yacc -dv calc.y 
% flex calc.l 
% gcc -o calc y.tab.c lex.yy.c
```
