-- require('telescope').load_extension('dap')
--
require('telescope').setup {
  defaults = {
file_ignore_patterns = {".git/", ".cache", "%.o", "%.a", "%.out", "%.class",
		"%.pdf", "%.mkv", "%.mp4", "%.zip"},  }
}
