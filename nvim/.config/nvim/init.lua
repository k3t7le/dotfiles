-- 기본 옵션
vim.opt.number = true
vim.opt.relativenumber = false
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.smartindent = true
vim.opt.termguicolors = true
vim.opt.clipboard = "unnamedplus"

--검색
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true

-- 리더 키
vim.g.mapleader = " "

-- lazy.nvim bootstrap
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  { "hrsh7th/nvim-cmp" },
  { "hrsh7th/cmp-buffer" },
  { "hrsh7th/cmp-path" },
})

-- nvim-cmp 최소 자동완성 설정
local cmp = require("cmp")

cmp.setup({

  mapping = cmp.mapping.preset.insert({
    ["<Tab>"] = cmp.mapping.select_next_item(),
    ["<S-Tab>"] = cmp.mapping.select_prev_item(),
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
    ["<Esc>"] = cmp.mapping.abort(),
  }),

  sources = {
    { name = "path" },   -- ./ ../ 폴더 자동완성
    { name = "buffer" } -- 현재 파일 기준
  },
})

