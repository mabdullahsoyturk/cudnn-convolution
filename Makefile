CXX := nvcc
TARGET := convolution
CUDNN_PATH := cudnn
HEADERS := -I $(CUDNN_PATH)/include
LIBS := -L $(CUDNN_PATH)/lib64 -L/usr/local/lib
CXXFLAGS := -arch=compute_35 -std=c++11

all: convolution

convolution: $(TARGET).cu
	$(CXX) $(CXXFLAGS) $(HEADERS) $(LIBS) $(TARGET).cu -o $(TARGET) -lcudnn

.phony: clean

clean:
	rm $(TARGET) || echo -n ""
