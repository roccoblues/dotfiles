all :sync

sync:
	mkdir -p ~/.config

	[ -f ~/.gemrc ] || ln -s $(PWD)/gemrc ~/.gemrc
	[ -f ~/.asdfrc ] || ln -s $(PWD)/asdfrc ~/.asdfrc
	[ -f ~/.zshrc ] || ln -s $(PWD)/zshrc ~/.zshrc

	[ -f ~/.config/starship.toml ] || ln -s $(PWD)/starship.toml ~/.config/starship.toml

clean:
	rm -f ~/.gemrc
	rm -f ~/.asdfrc
	rm -f ~/.zshrc

.PHONY: all clean sync
