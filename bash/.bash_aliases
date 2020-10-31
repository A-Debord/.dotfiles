
# ccache
export PATH=/usr/lib/ccache:$PATH

# clang + libstdc++
export LDFLAGS="-lstdc++ -lm"

# Qt

export Qt5_DIR=/mnt/data/Qt/5.12.0/gcc_64/lib/cmake/Qt5

# calculator 
function = 
{
  echo "$@" | bc -l
}
