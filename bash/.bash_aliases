
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

sofa ()
{
  SOFA_ERROR_CYCLIC_UPDATE=1 SOFA_ERROR_READ_LOCKED_DATA=1 SOFA_ERROR_DANGLING_END_EDIT=1 SOFA_ERROR_WRITE_LOCKED_DATA=1 debug/bin/cli -a -n 4 --pull -l sofacommon -l sofageneral -p sofaqt $1
}

create-branch ()
{
  git -C $1 checkout -b $(make branch)
}

git-tree ()
{
  git log --graph --abbrev-commit --decorate --oneline
}