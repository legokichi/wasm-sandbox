

## build


emcc -O2 src/main.cpp -o main.html -s BINARYEN=1 -s BINARYEN_METHOD='native-wasm,asmjs'

## reference

* http://qiita.com/ukyo/items/f71265fdee79b26354b9
* https://github.com/kripken/emscripten/wiki/WebAssembly
* https://github.com/WebAssembly/binaryen
* http://qiita.com/HirokiMiyaoka@github/items/89975a9e8205ced3603f
