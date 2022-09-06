require("mason").setup()

require("mason-lspconfig").setup({
    ensure_installed = {
        "sumneko_lua",
        "pyright",
    }
})

local lsp_options = require("user.plugins.lsp-options")

local cmp_status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_status_ok then
    print("Failed to load plugin 'cmp_nvim_lsp'")
    return
end

local capabilities = cmp_nvim_lsp.update_capabilities(vim.lsp.protocol.make_client_capabilities())

require("mason-lspconfig").setup_handlers {
    -- The first entry (without a key) will be the default handler
    -- and will be called for each installed server that doesn't have
    -- a dedicated handler.
    function (server_name) -- default handler (optional)
        require('lspconfig')[server_name].setup {
            on_attach = lsp_options.on_attach,
            flags = lsp_options.lsp_flags,
            capabilities = capabilities,
        }
    end,
    -- Next, you can provide targeted overrides for specific servers.
    ["sumneko_lua"] = function ()
        require('lspconfig')['sumneko_lua'].setup {
            on_attach = lsp_options.on_attach,
            flags = lsp_options.lsp_flags,
            capabilities = capabilities,
            settings = {
                Lua = {
                    diagnostics = {
                        globals = {'vim'},
                    }
                }
            }
        }
    end
}

