# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi
if [ -d "$HOME/.cabal/bin" ] ; then
    PATH="$HOME/.cabal/bin:$PATH"
fi

# set terminal emulator
export TERM="xterm-256color"

# set locale
export LANG="en_US.UTF-8"
export LANGUAGE="en_US:en"

# Compiler and Linker Flags
export CPPFLAGS="-D_FORTIFY_SOURCE=2"
export CFLAGS="-march=native -O2 -pipe -fstack-protector --param=ssp-buffer-size=4 -fdiagnostics-color=auto"
export CXXFLAGS="-march=native -O2 -pipe -fstack-protector --param=ssp-buffer-size=4 -fdiagnostics-color=auto"
export LDFLAGS="-Wl,-O1,--sort-common,--as-needed,-z,relro,-flto"
export MAKEFLAGS="-j4"
export DEBUG_CFLAGS="-g -fvar-tracking-assignments"
export DEBUG_CXXFLAGS="-g -fvar-tracking-assignments"

# (Java) use system anti-aliased fonts and make swing use the GTK look and feel
export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true -Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel'

# enable ccache
export PATH="/usr/lib/ccache/bin/:$PATH"

export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

alias vim=nvim
alias pw="pass -c"

alias lcd='cd -- "$(ls -dt -- */ | head -1)"'

[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

export LESS='-R'
export LESSOPEN='|~/.lessfilter %s'

alias gitc='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
