-- require('telescope').load_extension('dap')
--
  require("project_nvim").setup {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  }
require('telescope').load_extension('projects')
require('telescope').setup {
  defaults = {
file_ignore_patterns = {".git/", ".cache", "%.o", "%.a", "%.out", "%.class",
		"%.pdf", "%.mkv", "%.mp4", "%.zip"},  }
}

