#ment for a resh installation

DIR="$( cd "$( dirname "${BASH_SOURCE}" )/" && pwd )"
echo $DIR

cat <<EOT >> ~/.bashrc
if [ -f ~/dotfiles/shell/distribute ]; then
    . ~/dotfiles/shell/distribute
fi
EOT

# ln -s $DIR ~/test2
ln -s $DIR .

echo :source "$DIR/vim/.vimrc" >> ~/.vimrc
