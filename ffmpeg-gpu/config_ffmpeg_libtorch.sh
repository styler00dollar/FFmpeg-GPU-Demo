# !/bin/bash
TORCH_ROOT=${1-"/opt/conda/lib/python3.8/site-packages/torch"}
TORCH_INCPATH="-I$TORCH_ROOT/include/torch/csrc/api/include -I$TORCH_ROOT/include"
TORCH_LIBPATH=$TORCH_ROOT/lib

./configure --enable-nonfree --enable-cuda-nvcc --enable-libnpp --extra-cflags=-I/usr/local/cuda/include \
--extra-ldflags=-L/usr/local/cuda/lib64 --disable-static --enable-shared --enable-opengl \
--enable-libtensorrt \
--extra-ldflags=-L$TORCH_LIBPATH \
--extra-cflags="$TORCH_INCPATH" \
--nvccflags="-gencode=arch=compute_52,code=sm_52 \  
-gencode=arch=compute_60,code=sm_60 \  
-gencode=arch=compute_61,code=sm_61 \  
-gencode=arch=compute_70,code=sm_70 \  
-gencode=arch=compute_75,code=sm_75 \ 
-gencode=arch=compute_80,code=sm_80 \ 
-gencode=arch=compute_86,code=sm_86 \ 
-gencode=arch=compute_87,code=sm_87 \
-gencode=arch=compute_89,code=sm_89 \
-gencode=arch=compute_90,code=sm_90 \ 
-gencode=arch=compute_90,code=compute_90 -lineinfo -Xcompiler -fPIC -I./ $TORCH_INCPATH" 