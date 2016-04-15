INCLUDE = -I./include
CC = g++
CFLAGS = -std=c++14 -Wall -O1 #-Q -M -H
LD = g++
LDFLAGS =  -Wall -O1 #-Q -M -H
ODIR = ./obj
SDIR = ./src
DIST = ./bin
SRCS = $(wildcard ./src/*.cpp)
OBJS = $(SRCS:./src/%.c=./obj/%.o)
TARGET = $(DIST)/a.out

all: $(TARGET)

alljs: $(TARGET).js

$(TARGET).js: CC = emcc
$(TARGET).js: CFLAGS += -Demscripten=true
$(TARGET).js: INCLUDE += -I/usr/local/include/
#$(TARGET).js: CFLAGS += --llvm-opts 0
$(TARGET).js: LD = emcc
#$(TARGET).js: LDFLAGS += -O1 --llvm-lto 0
#$(TARGET).js: LDFLAGS += --pre-js ./src/em-pre.js --post-js ./src/em-post.js
$(TARGET).js: LDFLAGS += -s EXCEPTION_DEBUG=1 -s ASSERTIONS=1 -s EXPORTED_FUNCTIONS="['_main']"
#$(TARGET).js: LDFLAGS += -s BINARYEN=1 -s BINARYEN_METHOD='native-wasm,asmjs'
#$(TARGET).js: -shared --memory-init-file 0 -s ALLOW_MEMORY_GROWTH=1 -O3 -g3 --js-opts 1 --closure 2
$(TARGET).js: $(OBJS:./obj%.o=./obj/%.bc)
	if [ ! -d $(DIST) ]; then mkdir $(DIST); fi
	$(LD) -o $@ $(INCLUDE) $(LDFLAGS) $^

$(TARGET): $(OBJS)
	if [ ! -d $(DIST) ]; then mkdir $(DIST); fi
	$(LD) -o $@ $(INCLUDE) $(LDFLAGS) $^

$(ODIR)/%.o: $(SDIR)/%.c
	if [ ! -d $(ODIR) ]; then mkdir $(ODIR); fi
	$(CC) -o $@ $(CFLAGS) $(INCLUDE) -c $<




.PHONY: clean
clean:
	rm -rf $(ODIR)/* $(DIST)/*
