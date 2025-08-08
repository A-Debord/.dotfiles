
export PATH=/home/adrien/.local/bin:$PATH

# ccache
# export PATH=/usr/lib/ccache:$PATH

# distcc
export CCACHE_PREFIX="icecc"

# clang + libstdc++
export CXX="clang++-15"
export CC="clang-15"
export LDFLAGS="-lstdc++ -lm"

# Sofa
export SOFAPYTHON_CHECK=0
export SOFA_STABLE_NAMES=1
export SOFA_POOL_THREADS=15
export ANATOSCOPE_DATA_DIR=/mnt/data/data/sofa
export ASAN_SYMBOLIZER_PATH=/usr/bin/llvm-symbolizer-15
export OPENBLAS_CORETYPE=Haswell 
export OPENBLAS_NUM_THREADS=1 
export OPENBLAS_VERBOSE=1 
export NPY_DISABLE_SVML=1 
export NPY_DISABLE_CPU_FEATURES=AVX512F,AVX512CD,AVX512_SKX,AVX512_CLX,AVX512_CNL,AVX512_ICL

# calculator 
function = 
{
  echo "$@" | bc -l
}

sofa ()
{
  # release/bin/cli -a -n 4 --pull -m -p cimgplugin $@
  release/bin/cli -a -n 4 --pull -m -d -p cimgplugin $@ ; echo "exit code $?"
}

scli ()
{
  # release/bin/cli -a -n 4 --pull -m -p cimgplugin $@
  release/bin/cli $@ ; echo "exit code $?"
}

dsofa ()
{
  # ASAN_OPTIONS=detect_leaks=0 debug/bin/cli -a -n 4 --pull -m -p cimgplugin $@
  ASAN_OPTIONS=detect_leaks=0 debug/bin/cli -a -n 4 --pull -m -d -p cimgplugin $@ ; echo "exit code $?"
}

sr()
{
  SOFA_SAVE_REGRESSION=1 $@
}

pdb()
{
  SOFAPYTHON_DEBUGPY=1 $@
}

draw()
{
  SOFA_DRAW_DEBUG=1 $@
}

ko()
{
  KEEP_OUTPUT=1 $@
}

b()
{
  make release && $@
}

rsofa()
{
  release/bin/runSofa2 $@ ; echo "exit code $?"
}

asofa()
{
  ANATO_RENDER_ANTIALIASING_SAMPLES=0 release/bin/AnatoRun $@ ; echo "exit code $?"
}

basofa()
{
  ANATO_RENDER_ANTIALIASING_SAMPLES=0 release/bin/AnatoRun -b -a 4 $@ ; echo "exit code $?"
}

create-branch ()
{
  git -C $1 checkout -b $(make branch)
}

cb(){
  create-branch $1
}

editor ()
{
  SOFA_EDITOR="/usr/bin/code --goto {filename}:{lineno}" $@
}

repair(){
  git -C $1 checkout -b $(make branch) || 1
  git -C $1 checkout master
  git -C $1 reset --hard origin/master
  git -C $1 checkout $(make branch)
}

git-tree ()
{
  git log --graph --abbrev-commit --decorate --oneline
}

wplexus ()
{
  wakeonlan c8:d3:ff:44:94:e6
}

kplexus ()
{
  ssh adrien@plexus sudo poweroff
}