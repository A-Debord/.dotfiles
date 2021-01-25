export PATH=/home/adrien/.local/bin:$PATH

# ccache
export PATH=/usr/lib/ccache:$PATH

# distcc
export CCACHE_PREFIX="distcc"

# clang + libstdc++
export LDFLAGS="-lstdc++ -lm"

# Qt

export Qt5_DIR=/mnt/data/Qt/5.12.0/gcc_64/lib/cmake/Qt5

# calculator 
function = 
{
  echo "$@" | bc -l
}

sofa ()
{
  release/bin/cli -a -n 4 --pull -m -p sofaqt -p cimgplugin $1
}

dsofa ()
{
  ASAN_OPTIONS=detect_leaks=0 debug/bin/cli -a -n 4 --pull -m -p sofaqt -p cimgplugin $1
}

srsofa()
{
  SOFA_SAVE_REGRESSION=1 sofa $1
}

rsofa()
{
  release/bin/runSofa2 $1
}

asofa()
{
  ANATO_RENDER_ANTIALIASING_SAMPLES=0 release/bin/AnatoRun $1
}

create-branch ()
{
  git -C $1 checkout -b $(make branch)
}

cb(){
  create-branch $1
}

git-tree ()
{
  git log --graph --abbrev-commit --decorate --oneline
}