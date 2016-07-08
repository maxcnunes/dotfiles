if [ "$(uname)" == "Darwin" ]; then
  brew install the_silver_searcher
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
  apt-get install silversearcher-ag
fi
