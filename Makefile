all :sync

sync:
	[ -f ~/.gemrc ] || ln -s $(PWD)/gemrc ~/.gemrc
	[ -f ~/.asdfrc ] || ln -s $(PWD)/asdfrc ~/.asdfrc
	[ -f ~/.zshrc ] || ln -s $(PWD)/zshrc ~/.zshrc
	[ -f ~/.gitconfig ] || ln -s $(PWD)/gitconfig ~/.gitconfig

	mkdir -p ~/.config
	[ -f ~/.config/starship.toml ] || ln -s $(PWD)/starship.toml ~/.config/starship.toml

	mkdir -p ~/.config/nvim
	[ -f ~/.config/nvim/init.vim ] || ln -s $(PWD)/init.vim  ~/.config/nvim/init.vim

	[ -f ~/Library/Application\ Support/Code/User/settings.json ] || ln -s $(PWD)/vscode-settings.json ~/Library/Application\ Support/Code/User/settings.json

clean:
	rm -f ~/.gemrc
	rm -f ~/.asdfrc
	rm -f ~/.zshrc
	rm -f ~/.gitconfig
	rm -f ~/.config/starship.toml
	rm -f ~/.config/nvim/init.vim
	rm -f ~/Library/Application\ Support/Code/User/settings.json

.PHONY: all clean sync
