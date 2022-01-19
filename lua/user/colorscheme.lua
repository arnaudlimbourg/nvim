-- colorscheme gruvbox-baby
vim.cmd [[
try
  set background=dark
  colorscheme nord
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]]
