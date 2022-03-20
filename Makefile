all :sync

sync:
	[ -f ~/.gemrc ] || ln -s $(PWD)/gemrc ~/.gemrc
	[ -f ~/.asdfrc ] || ln -s $(PWD)/asdfrc ~/.asdfrc
	[ -f ~/.zshrc ] || ln -s $(PWD)/zshrc ~/.zshrc
	[ -f ~/.gitconfig ] || ln -s $(PWD)/gitconfig ~/.gitconfig
	[ -f ~/.tmux.conf ] || ln -s $(PWD)/tmux.conf ~/.tmux.conf

	mkdir -p ~/.config
	[ -f ~/.config/starship.toml ] || ln -s $(PWD)/starship.toml ~/.config/starship.toml

	mkdir -p ~/.config/nvim
	[ -f ~/.config/nvim/init.vim ] || ln -s $(PWD)/init.vim  ~/.config/nvim/init.vim
	mkdir -p ~/.config/nvim/ulti-snippets
	[ -f ~/.config/nvim/ulti-snippets/go.snippets ] || ln -s $(PWD)/go.snippets  ~/.config/nvim/ulti-snippets/go.snippets

	mkdir -p ~/.newsboat
	[ -f ~/.newsboat/config ] || ln -s $(PWD)/newsboat.config ~/.newsboat/config

	mkdir -p ~/.config/alacritty/
	[ -f ~/.config/alacritty/alacritty.yml ] || ln -s $(PWD)/alacritty.yml ~/.config/alacritty/alacritty.yml

	[ -f ~/Library/Application\ Support/Code/User/settings.json ] || ln -s $(PWD)/vscode-settings.json ~/Library/Application\ Support/Code/User/settings.json

	[ -d ~/.tmux/plugins/tpm ] || git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

clean:
	rm -f ~/.gemrc
	rm -f ~/.asdfrc
	rm -f ~/.zshrc
	rm -f ~/.gitconfig
	rm -f ~/.tmux.conf
	rm -f ~/.config/starship.toml
	rm -f ~/.config/nvim/init.vim
	rm -f ~/.config/nvim/ulti-snippets/go.snippets
	rm -f ~/.config/alacritty/alacritty.yml
	rm -f ~/.newsboat/config
	rm -f ~/Library/Application\ Support/Code/User/settings.json

.PHONY: all clean sync
