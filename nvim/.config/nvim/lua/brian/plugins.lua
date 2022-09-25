local install_path = vim.fn.stdpath("data").."/site/pack/packer/start/packer.nvim"
local packer_bootstrap
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    packer_bootstrap = vim.fn.execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
    vim.cmd [[packadd packer.nvim]]
end

local status_ok, packer = pcall(require, "packer")
if not status_ok then
    print("Failed to load plugin 'packer'")
    return
end

packer.init {
    display = {
        open_fn = function()
            return require("packer.util").float { border = "rounded" }
        end,
    },
}

return packer.startup({
    function(use)
        use "wbthomason/packer.nvim"
        use "arcticicestudio/nord-vim"
        use "lukas-reineke/indent-blankline.nvim"
        use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }
        use {
            "nvim-lualine/lualine.nvim",
            requires = { "kyazdani42/nvim-web-devicons", opt = true }
        }
        -- use {
        --     "kyazdani42/nvim-tree.lua",
        --     requires = { "kyazdani42/nvim-web-devicons" },
        --     tag = "nightly"
        -- }
        -- use {
        --     "phaazon/hop.nvim",
        --     branch = "v2",
        -- }
        use "preservim/nerdcommenter"

        --------------------
        use {
            "akinsho/bufferline.nvim",
            tag = "v2.*",
            requires = { "kyazdani42/nvim-web-devicons" }
        }
        use {
            "nvim-neo-tree/neo-tree.nvim",
            branch = "v2.x",
            requires = {
                "nvim-lua/plenary.nvim",
                "kyazdani42/nvim-web-devicons",
                "MunifTanjim/nui.nvim",
            }
        }
        use {
            "nvim-telescope/telescope.nvim",
            tag = "0.1.0",
            requires = { "nvim-lua/plenary.nvim" },
        }
        use {
            "goolord/alpha-nvim",
            requires = { "kyazdani42/nvim-web-devicons" },
        }
        use {
            "sindrets/diffview.nvim",
            requires = { "nvim-lua/plenary.nvim" },
        }
        -- LSP
        use "williamboman/mason.nvim"
        use "williamboman/mason-lspconfig.nvim"
        use "neovim/nvim-lspconfig"

        -- Auto complete
        use 'hrsh7th/cmp-nvim-lsp'
        use 'hrsh7th/cmp-buffer'
        use 'hrsh7th/cmp-path'
        use 'hrsh7th/cmp-cmdline'
        use 'hrsh7th/nvim-cmp'
        use 'L3MON4D3/LuaSnip'
        use 'saadparwaiz1/cmp_luasnip'

        use "windwp/nvim-autopairs"

        if packer_bootstrap then
            require("packer").sync()
        end
    end,
    config = {
        compile_path = vim.fn.stdpath "data" .. "/site/pack/loader/start/packer.nvim/plugin/packer.lua"
    }
})
