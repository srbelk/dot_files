return{
  {
    "nvim-treesitter/nvim-treesitter",
    opts_extend = {"ensure_installed"},
    opts = {
        ensure_installed = {
	    "bash",
	    "c",
	    "lua",
	    "json",
	    "jsonc",
	    "markdown",
	    "python",
	    "solidity",
	    "toml",
	    "yaml",
	}	    
    }
  }
}
