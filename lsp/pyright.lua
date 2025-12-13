return {
  cmd = { "pyright-langserver", "--stdio" },
  filetypes = { "python", "py" },
  root_markers = {
    "pyproject.toml",
    "setup.py",
    "requirements.txt",
    ".git",
  },
  settings = {
    python = {
      analysis = {
        typeCheckingMode = "basic",
        autoSearchPaths = true,
      },
    },
  },
}

