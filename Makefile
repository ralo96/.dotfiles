install:
ifeq (, $(shell which stow))
$(error "You need to install stow to do this.")
endif
# Test if files exist, if they do, make a backup of the old
ifneq (,$(wildcard ~/.emacs.d))
	mv ~/.emacs.d ~/.emacs.d.bak
endif
ifneq (,$(wildcard ~/.emacs))
	mv ~/.emacs ~/.emacs.bak
endif
ifneq (,$(wildcard ~/.vimrc))
	mv ~/.vimrc ~/.vimrc.bak
endif
ifneq (,$(wildcard ~/.bashrc))
	mv ~/.bashrc ~/.bashrc.bak
endif
ifneq (,$(wildcard ~/.gitconfig))
	mv ~/.gitconfig ~/.gitconfig.bak
endif
	stow vim
	stow emacs
	stow git
	stow bash

clean:
ifneq (,$(wildcard ~/.emacs.d))
	rm -rf ~/.emacs.d
endif
ifneq (,$(wildcard ~/.emacs))
	rm ~/.emacs
endif
ifneq (,$(wildcard ~/.vimrc))
	rm ~/.vimrc
endif
ifneq (,$(wildcard ~/.bashrc))
	rm ~/.bashrc
endif
ifneq (,$(wildcard ~/.bashrc))
	rm ~/.bash_profile
endif
ifneq (,$(wildcard ~/.gitconfig))
	rm ~/.gitconfig
endif
