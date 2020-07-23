

```
yacc -dv mycalc.y
lex mycalc.l
gcc -o calc y.tab.c lex.yy.c
./calc
```

## 参考

http://kmaebashi.com/programmer/devlang/yacclex.html


