vim.cmd [[
try
  set background=dark
  colorscheme gruvbox-baby
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]]
