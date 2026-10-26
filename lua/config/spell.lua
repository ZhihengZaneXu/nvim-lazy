local spell_dir = vim.fn.stdpath("config") .. "/spell"
vim.fn.mkdir(spell_dir, "p")

vim.opt.spellfile = spell_dir .. "/en.utf-8.add"

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "text", "markdown", "tex", "typst" },
  callback = function()
    vim.opt_local.spell = true
    vim.opt_local.spelllang = "en_us"
  end,
})
