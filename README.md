# コンパイラ
Yacc と Lex を用いたコンパイラを作成する
## 実行
- 実行ファイルの作成
```
// 変数i の計算式を受理する
// ex. i+i, i*i
$make calc1

// 1桁同士の数の四則演算を行う
// ex. 2+3, 4*3
$make calc2

// 2桁以上の数の四則演算を行う
// ex. 32-22, 23*4
$make calc3 

// 四則演算の結果をメモリにに保存できる
// ex. M[0] = 1 + 1, (M[0]で2が出力される)
$make calc4 

// log exp sqrt の計算を追加した
// ex. sqrt(4), log(exp(4))
$make calc5
```

- 不要なファイルの削除
```
$make clean
```

## ref
- [コンパイラ構成法 原田賢一著 共立出版](https://www.amazon.co.jp/%E3%82%B3%E3%83%B3%E3%83%91%E3%82%A4%E3%83%A9%E6%A7%8B%E6%88%90%E6%B3%95-%E5%8E%9F%E7%94%B0-%E8%B3%A2%E4%B8%80/dp/4320029224/ref=asc_df_4320029224/?tag=jpgo-22&linkCode=df0&hvadid=295719984664&hvpos=&hvnetw=g&hvrand=4146022006975487855&hvpone=&hvptwo=&hvqmt=&hvdev=c&hvdvcmdl=&hvlocint=&hvlocphy=1009701&hvtargid=pla-539930253820&psc=1&th=1&psc=1)