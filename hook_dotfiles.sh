#ment for a resh installation
" in here are things to do only once

DIR="$( cd "$( dirname "${BASH_SOURCE}" )/" && pwd )"
echo $DIR

cat <<EOT >> ~/.bashrc
if [ -f ~/datenspeicher/dotfiles/shell/distribute ]; then
    . ~/datenspeicher/dotfiles/shell/distribute
fi
EOT

# read -p "Continue? (Y/N): " confirm && [[ $confirm == [yY] || $confirm == [yY][eE][sS] ]] || exit 1
echo "install pyenv?"
read pyenv_promt
if [ pyenv_promt = "y" ]; then
  curl https://pyenv.run | bash
  cat <<EOF >> ~/.bashrc
  export PATH="/home/${HOME}duck_mx/.pyenv/bin:$PATH"
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
fi
EOT

# ln -s $DIR ~/test2
ln -s $DIR .

echo :source "$DIR/vim/.vimrc" >> ~/.vimrc

echo <<EOT >> ~/.config/nvim/init.vim
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc
echo :source ~/.vimrc
EOT
