export PATH=/home/adrien/.local/bin:$PATH

# ccache
export PATH=/usr/lib/ccache:$PATH

# distcc
export CCACHE_PREFIX="distcc"

# clang + libstdc++
export LDFLAGS="-lstdc++ -lm"

# Sofa
export SOFAPYHON_MYPY_NO_SITE_PACKAGES=0
export ANATOSCOPE_DATA_DIR=/mnt/data/data/sofa

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