{ config, pkgs, ... }:

let
    customNeovim = import ~/.config/nvim/nvim.nix;
in

{
# Home Manager needs a bit of information about you and the
# paths it should manage.
	home.username = "jcts";
	home.homeDirectory = "/home/jcts";

# This value determines the Home Manager release that your
# configuration is compatible with. This helps avoid breakage
# when a new Home Manager release introduces backwards
# incompatible changes.
#
# You can update Home Manager without changing this value. See
# the Home Manager release notes for a list of state version
# changes in each release.
	home.stateVersion = "22.11";

# Let Home Manager install and manage itself.


	programs.home-manager.enable = true;

	home.packages = with pkgs; [htop 
	fish 
	git 
	git-crypt
	gnupg
	tmux];
	programs.fish = {
		enable = true;
		shellAliases = {
			ll = "ls -l";
			vim = "nvim";
			update = "sudo nixos-rebuild switch";
		};
	};

	programs.neovim = customNeovim pkgs;
} 
