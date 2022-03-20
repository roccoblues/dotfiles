all :sync

sync:
	stow --verbose --restow */
	[ -f ~/Library/Application\ Support/Code/User/settings.json ] || ln -s $(PWD)/vscode-settings.json ~/Library/Application\ Support/Code/User/settings.json
	[ -d ~/.tmux/plugins/tpm ] || git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

clean:
	stow --verbose --delete */
	rm -f ~/Library/Application\ Support/Code/User/settings.json

.PHONY: all clean sync
