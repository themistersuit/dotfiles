# Add `~/bin` to the `$PATH`
PATH="$PATH:$HOME/bin"
PATH="$PATH:$HOME/.rvm/bin"
export PATH

# Load the shell dotfiles, and then some:
# * ~/.profile can be used to extend `$PATH`.
# * ~/.profile can be used for other settings you don’t want to commit.
for file in ~/.{path,profile,inputrc,bash_prompt,exports,aliases,functions,extra}; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# init z https://github.com/rupa/z
. `brew --prefix`/etc/profile.d/z.sh

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob;

# Append to the Bash history file, rather than overwriting it
shopt -s histappend;

# Autocorrect typos in path names when using `cd`
shopt -s cdspell;

# Enable some Bash 4 features when possible:
# * `autocd`, e.g. `**/qux` will enter `./foo/bar/baz/qux`
# * Recursive globbing, e.g. `echo **/*.txt`
for option in autocd globstar; do
	shopt -s "$option" 2> /dev/null;
done;

# bash completion.
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi
