local map = vim.keymap.set
local opts = { noremap = true, silent = true }

local vscode = require("vscode")

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Disable Space before assigning it as leader
map("n", "<Space>", "<Nop>", opts)

-- Paste without overwriting the unnamed register
map("v", "p", '"_dP', opts)

-- Escape: hide suggestions and clear search highlight
map({ "n", "i", "v" }, "<Esc>", function()
    vscode.action("hideSuggestWidget")

    if vim.fn.mode() == "n" then
        vim.cmd("nohlsearch")
    end

    vim.api.nvim_feedkeys(
        vim.api.nvim_replace_termcodes("<Esc>", true, false, true),
        "n",
        false
    )
end, opts)

-- Accept inline suggestion
map({ "n", "i" }, "<Tab>", function()
    vscode.action("editor.action.inlineSuggest.commit")
end, opts)

-- Show hover / diagnostics
map("n", "<leader>sd", function()
    vscode.action("editor.action.showHover")
end, { desc = "Show Hover" })
