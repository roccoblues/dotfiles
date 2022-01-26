all :sync

sync:
	mkdir -p ~/.config

	[ -f ~/.gemrc ] || ln -s $(PWD)/gemrc ~/.gemrc
	[ -f ~/.asdfrc ] || ln -s $(PWD)/asdfrc ~/.asdfrc
	[ -f ~/.zshrc ] || ln -s $(PWD)/zshrc ~/.zshrc
	[ -f ~/.gitconfig ] || ln -s $(PWD)/gitconfig ~/.gitconfig

	[ -f ~/.config/starship.toml ] || ln -s $(PWD)/starship.toml ~/.config/starship.toml

clean:
	rm -f ~/.gemrc
	rm -f ~/.asdfrc
	rm -f ~/.zshrc
	rm -f ~/.gitconfig
	rm -f ~/.config/starship.toml

.PHONY: all clean sync
