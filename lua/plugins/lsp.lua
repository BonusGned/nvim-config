return {
    {
        "neovim/nvim-lspconfig",
        config = function()
            local capabilities = vim.lsp.protocol.make_client_capabilities()
            capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

            -- Setup language servers using new vim.lsp.config
            vim.lsp.config("pyright", {
                settings = {
                    pyright = {
                        -- Using Ruff's import organizer
                        disableOrganizeImports = true,
                    },
                    python = {
                        analysis = {
                            -- Ignore all files for analysis to exclusively use Ruff for linting
                            ignore = { "*" },
                            typeCheckingMode = "off", -- Using mypy
                        },
                    },
                },
            })
            vim.lsp.config("ruff", {})
            vim.lsp.config("solc", {})
            vim.lsp.config("marksman", {})
            vim.lsp.config("jsonls", {})
            vim.lsp.config("yamlls", {})
            vim.lsp.config("ts_ls", {
                on_attach = function(_client, buffer)
                    local function goto_source_definition()
                        local position_params = vim.lsp.util.make_position_params()
                        vim.lsp.buf.execute_command({
                            command = "_typescript.goToSourceDefinition",
                            arguments = { vim.api.nvim_buf_get_name(0), position_params.position },
                        })
                    end
                    local opts = { buffer = buffer }
                    vim.keymap.set("n", "<leader>ds", goto_source_definition, opts)
                end,
                handlers = {
                    ["workspace/executeCommand"] = function(_err, result, ctx, _config)
                        if ctx.params.command ~= "_typescript.goToSourceDefinition" then
                            return
                        end
                        if result == nil or #result == 0 then
                            return
                        end
                        vim.lsp.util.jump_to_location(result[1], "utf-8")
                    end,
                },
            })
            -- vim.lsp.config("eslint", {})
            vim.lsp.config("cssls", {
                capabilities = capabilities,
            })
            vim.lsp.config("gopls", {})
            vim.lsp.config("sqls", {
                on_attach = function(client, bufnr)
                    require("sqls").on_attach(client, bufnr)
                end,
            })
            vim.lsp.config("rust_analyzer", {
                settings = {
                    ["rust-analyzer"] = {
                        procMacro = { enable = false },
                        diagnostics = {
                            disabled = { "unresolved-proc-macro" },
                            enable = true,
                            experimental = {
                                enable = true,
                            },
                        },
                    },
                },
            })
            -- Global mappings.
            -- See `:help vim.diagnostic.*` for documentation on any of the below functions
            vim.keymap.set("n", "<leader>lD", vim.diagnostic.open_float)
            vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
            vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
            vim.keymap.set("n", "<leader>ld", vim.diagnostic.setloclist)

            -- Use LspAttach autocommand to only map the following eys
            -- after the language server attaches to the current buffer
            vim.api.nvim_create_autocmd("LspAttach", {
                group = vim.api.nvim_create_augroup("UserLspConfig", {}),
                callback = function(ev)
                    -- Enable completion triggered by <c-x><c-o>
                    vim.bo[ev.buf].omnifunc = "v:lua.vm.lsp.omnifunc"

                    local opts = { buffer = ev.buf }
                    -- vim.keymap.set("n", "gd", vim.lsp.buf.declaration, opts)
                    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
                    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
                    vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
                    -- vim.keymap
                    --     .set('n', '<Leader>sa', vim.lsp.buf.add_workspace_folder, opts)
                    -- vim.keymap.set('n', '<Leader>sr', vim.lsp.buf.remove_workspace_folder,
                    --                opts)
                    -- vim.keymap.set('n', '<Leader>sl', function()
                    --     print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
                    -- end, opts)
                    vim.keymap.set("n", "<Leader>D", vim.lsp.buf.type_definition, opts)
                    vim.keymap.set("n", "<Leader>lr", vim.lsp.buf.rename, opts)
                    vim.keymap.set({ "n", "v" }, "<Leader>la", vim.lsp.buf.code_action, opts)
                    -- vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
                    vim.keymap.set("n", "<Leader>lf", function()
                        vim.lsp.buf.format({ async = true })
                    end, opts)
                    vim.keymap.set("n", "<Leader>lu", function()
                        local bufnr = ev.buf
                        local clients = vim.lsp.get_active_clients({ bufnr = bufnr })
                        for _, client in ipairs(clients) do
                            if client.name == "ruff" then
                                vim.lsp.buf.code_action({
                                    context = { only = { "source.organizeImports.ruff" } },
                                    apply = true,
                                })
                                vim.lsp.buf.code_action({
                                    context = { only = { "source.fixAll.ruff" } },
                                    apply = true,
                                })
                                return
                            end
                        end
                        vim.notify("Ruff LSP not attached for this buffer", vim.log.levels.WARN)
                    end, opts)
                end,
            })
        end,
    },
}
