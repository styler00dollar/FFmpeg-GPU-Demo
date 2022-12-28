# !/bin/bash
TORCH_ROOT=${1-"/opt/conda/lib/python3.8/site-packages/torch"}
TORCH_INCPATH="-I$TORCH_ROOT/include/torch/csrc/api/include -I$TORCH_ROOT/include"
TORCH_LIBPATH=$TORCH_ROOT/lib

./configure --enable-nonfree --enable-cuda-nvcc --enable-libnpp --extra-cflags=-I/usr/local/cuda/include \
--extra-ldflags=-L/usr/local/cuda/lib64 --disable-static --enable-shared --enable-opengl \
--enable-libtensorrt \
--extra-ldflags=-L$TORCH_LIBPATH \
--extra-cflags="$TORCH_INCPATH" \
--nvccflags="-gencode=arch=compute_89,code=sm_89 -lineinfo -Xcompiler -fPIC -I./ $TORCH_INCPATH" 
