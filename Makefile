all :sync

sync:
	[ -f ~/.gemrc ] || ln -s $(PWD)/gemrc ~/.gemrc
	[ -f ~/.asdfrc ] || ln -s $(PWD)/asdfrc ~/.asdfrc
	[ -f ~/.zshrc ] || ln -s $(PWD)/zshrc ~/.zshrc
	[ -f ~/.gitconfig ] || ln -s $(PWD)/gitconfig ~/.gitconfig

	mkdir -p ~/.config
	[ -f ~/.config/starship.toml ] || ln -s $(PWD)/starship.toml ~/.config/starship.toml

	[ -f ~/Library/Application\ Support/Code/User/settings.json ] || ln -s $(PWD)/vscode-settings.json ~/Library/Application\ Support/Code/User/settings.json

	mkdir -p ~/.k9s
	[ -f ~/.k9s/config.yml ] || ln -s $(PWD)/k9s.yml ~/.k9s/config.yml

clean:
	rm -f ~/.gemrc
	rm -f ~/.asdfrc
	rm -f ~/.zshrc
	rm -f ~/.gitconfig
	rm -f ~/.config/starship.toml
	rm -f ~/Library/Application\ Support/Code/User/settings.json
	rm -f ~/.k9s/config.yml

.PHONY: all clean sync
