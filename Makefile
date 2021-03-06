CXXFLAGS := -g -std=c++11 -Wall -pedantic
MAKEFLAGS += --quiet
LDFLAGS = -framework Carbon -framework OpenGL -framework GLUT

LIB := -L lib -lstdc++ -lGL -lGLU -lGLUT
INC := -I include

BIN_DIR := bin
SRC_DIR := src

TARGET := $(BIN_DIR)/demo

SRC_EXT := cpp

SOURCES := $(shell find $(SRC_DIR) -type f -name *.$(SRC_EXT))

demo: $(TARGET)
	@echo 'running ticket'
	./$<

$(TARGET): $(SOURCES)
	@echo 'building...'
	$(CXX) $(CXXFLAGS) $(LDFLAGS) $(INC) $^ -o $@

clean:
	@echo 'cleaning...' 
	$(RM) -r $(TARGET)

.PHONY: clean
