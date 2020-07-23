# programming_basics

プログラミング言語作成の基礎について学んでいこうと思ってる途中。

参考
http://kmaebashi.com/programmer/devlang/index.html

字句解析
ソースコードを字句というトークンに分割する処理。

構文解析
トークンから解析木を構築する。


```
if(a == 10) {
    printf("hoge!");
} else {
    printf("hoge?");
}
```

下記が分割されたトークン


```
if
(
a
==
10
)
{
printf
(
"hoge!"
)
;
}
else
{
printf
(
"hoge?"
;
)
}
```


トークンを構文解析して解析木を構築する。

if文の下の階層に条件式、thenブロック、elseブロックと続く。
条件式の下に=演算子、その下に変数aと数値10。
then節の下にprintf関数、その下に"hoge!"。elseも同様。

字句解析をするプログラムを、レキシカルアナライザ(lexical analyzer)と呼び、これを自動生成するのがlex.

構文解析をするプログラムをパーサ(parser)と呼ぶ。yaccはこれを自動生成する。


### lex


```
brew install flex
macはbisonは元から入ってる。
```


### いろんな言語

- ruby内部    
yaccとか呼んでて面白い。

https://github.com/ruby/ruby/search?q=yacc&unscoped_q=yacc

- python内部    
自前で書いてるようだ。

https://github.com/python/cpython/tree/master/Parser


- C#内部。    

まだ探してる段階。
roslynはC#によるC#用のコンパイラなので、言語自体のコンパイラとは違うはず。


https://github.com/dotnet/roslyn/tree/master/src/Compilers/CSharp/Portable/Parser





