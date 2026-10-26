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

local function spell_highlights()
  vim.api.nvim_set_hl(0, "SpellBad", {
    undercurl = true,
    sp = "#454545",
  })
end

vim.api.nvim_create_autocmd("ColorScheme", {
  callback = spell_highlights,
})

spell_highlights()
