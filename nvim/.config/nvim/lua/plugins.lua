return require('packer').startup(function()
	use 'wbthomason/packer.nvim'
	use {
		'scrooloose/nerdtree',
		on = 'NERDTreeToggle'
	}
	use 'ctrlpvim/ctrlp.vim'
	use 'vim-airline/vim-airline'
	use 'vim-airline/vim-airline-themes'
	use 'edkolev/tmuxline.vim'
	use 'yggdroot/indentline'
	use 'gruvbox-community/gruvbox'
        use 'dense-analysis/ale'
        use 'Shougo/deoplete.nvim'
        use 'deoplete-plugins/deoplete-clang'
        use 'sebastianmarkow/deoplete-rust'
	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate'
	}
end)
