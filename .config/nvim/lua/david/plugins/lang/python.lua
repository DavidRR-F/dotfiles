local M = {}

function M.get_venv()
    local venv_path = require('venv-selector').retrieve_from_cache()
    if venv_path then
        return venv_path .. "/bin/python"
    else 
        return vim.fn.expand('$HOME/.pyenv/versions/neovim3/bin/python')
    end
end

function M.update_venv()
    local venv_path = require('venv-selector').get_active_venv()
    if venv_path then
        local py_path = venv_path .. "/bin/python"
        local black_path = venv_path .. "/bin/black"
        -- Update Pyright configuration
        require('lspconfig').pyright.setup {
            settings = {
                python = {
                    analysis = {
                        autoSearchPaths = true,
                        useLibraryCodeForTypes = true,
                    },
                    python_path = py_path
                }
            }
        }
        vim.g.conform_formatters = {
            python = {
                command = black_path,
                args = { "-" }
            }
        }
        require('neotest').setup({
          adapters = {
            require('neotest-python')({
              dap = { justMyCode = true },
              runner = "pytest",
              python = py_path,
            })
          }
        })
        -- Restart Pyright LSP server to apply changes
        vim.lsp.stop_client(vim.lsp.get_active_clients())
        vim.cmd [[LspStart]]
    end
end


return M

