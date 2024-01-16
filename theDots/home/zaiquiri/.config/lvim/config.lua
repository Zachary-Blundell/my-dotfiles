-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny
require("zaiquiri.options")
require("zaiquiri.keymaps")
require("zaiquiri.null_ls")
require("zaiquiri.marks")
require("zaiquiri.cmp")

-- require("zaiquiri.catppuccin")
-- require("zaiquiri.harpoon")


vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
vim.cmd([[
let g:LanguageClient_serverCommands = {
    \ 'sql': ['sql-language-server', 'up', '--method', 'stdio'],
    \ }
]])

lvim.plugins = {
    { "tpope/vim-fugitive" },
    { "chentoast/marks.nvim" },
    { "catppuccin/nvim",     name = "catppuccin", priority = 1000 },
    { "ThePrimeagen/harpoon" },
    {
        "iamcco/markdown-preview.nvim",
        config = function() vim.fn["mkdp#util#install"]() end,
    },
    { "windwp/nvim-ts-autotag" },
    -- { 'tzachar/cmp-ai',        dependencies = 'nvim-lua/plenary.nvim' },
    -- { 'hrsh7th/nvim-cmp',      dependencies = { 'tzachar/cmp-ai' } },
}
-- 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
