mkdir -p wasm
docker run --rm -v $(pwd):/src trzeci/emscripten emcc arithmetic_operators.cpp \
  -s WASM=1 \
  -s "MODULARIZE=1" \
  -s "EXPORTED_FUNCTIONS=['_add', '_subtract', '_multiply', '_divide']" \
  -s "EXTRA_EXPORTED_RUNTIME_METHODS=['cwrap']" \
  -o wasm/arithmetic_operators.js