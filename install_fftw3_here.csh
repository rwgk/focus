#! /bin/csh -fe
set verbose
set fftw=fftw-3.2.2
set prefix="$cwd"
gunzip -c "/net/cci-filer1/vol1/lbnl/rwgk/mirror/sci/$fftw.tar.gz" | tar xf -
cd "$fftw"
./configure --prefix="$prefix/base" --enable-single
make $*
make install
cd "$prefix"
rm -rf "$fftw"
