# idirs2-lsp-vscode-plus

idris2-lsp-vscodeを拡張したツールの開発を行う。

## 支援ツールの概要

プログラム中の任意の部分式に対する型を簡潔に表示し、各部分式がどのような証明に相当するのかを明確に読み取れるようにする。

## 実行例

```
$ ghc Mainn.hs
$ ./Main "f1 : a -> b -> a" "f2 : c -> d"
"f1 f2 : b -> (c -> d)"
```