# Pull base image.
FROM alvstakahashi/stm32toolchain:1

WORKDIR /home/toppers

# Install
RUN wget https://www.toppers.jp/download.cgi/asp-1.9.3.tar.gz && \
wget https://www.toppers.jp/download.cgi/asp_arch_arm_m4_gcc-1.9.5.tar.gz && \
wget https://www.toppers.jp/download.cgi/cfg-linux-static-1_9_6.gz && \
tar zxf asp-1.9.3.tar.gz && \
tar zxf asp_arch_arm_m4_gcc-1.9.5.tar.gz && \
gzip -cd cfg-linux-static-1_9_6.gz > cfg && \
chmod 755 cfg && \
mkdir -p asp/cfg/cfg && \
mv cfg asp/cfg/cfg && \
mkdir -p asp/OBJ && \
cd asp/OBJ  && \
../configure -T stm32f401nucleo_gcc -dROM && \
make depend && make 

WORKDIR /home/toppers

# ‹N“®ƒVƒFƒ‹bash
CMD ["/bin/bash"]

