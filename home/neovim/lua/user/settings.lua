local opt = {
  number = true,
  mouse = 'a',
  hlsearch = false,
  tabstop = 4,
  shiftwidth = 4,
  termguicolors = true,
  relativenumber = true,
  wrap = true,
  foldenable = false,
  foldmethod = 'indent',
  foldlevel = 5,
  showmatch = true,
}

for k, v in pairs(opt) do
  vim.opt[k] = v
end

vim.g.netrw_banner = 0
vim.g.netrw_winsize = 30

vim.g.mapleader = ','
