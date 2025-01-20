local M = {}

M.yaml_schemas = {
    ["Generic"] = "https://json.schemastore.org/json",
    ["Kubernetes"] = "https://json.schemastore.org/kubernetes.json",
    ["Ansible"] = "https://json.schemastore.org/ansible-playbook.json",
    ["GitLab CI"] = "https://json.schemastore.org/gitlab-ci.json",
    ["GitHub Actions"] = "https://json.schemastore.org/github-workflow.json",
    ["Helm"] = "https://json.schemastore.org/helm-chart.json",
    ["Docker Compose"] = "https://raw.githubusercontent.com/docker/compose/master/compose.schema.json",
}


function M.switch_project_schema()
    local pickers = require("telescope.pickers")
    local finders = require("telescope.finders")
    local actions = require("telescope.actions")
    local action_state = require("telescope.actions.state")

    pickers.new({}, {
        prompt_title = "Select YAML Schema",
        finder = finders.new_table({
            results = vim.tbl_keys(M.yaml_schemas),
        }),
        sorter = require("telescope.config").values.generic_sorter({}),
        attach_mappings = function(_, map)
            actions.select_default:replace(function()
                actions.close(_)
                local selection = action_state.get_selected_entry().value
                local schema_url = M.yaml_schemas[selection]
                if not schema_url then
                    vim.notify("Invalid schema selected!", vim.log.levels.ERROR)
                    return
                end

                -- Update yamlls settings dynamically
                local clients = vim.lsp.get_active_clients()
                for _, client in ipairs(clients) do
                    if client.name == "yamlls" then
                        client.config.settings.yaml.schemas = { [schema_url] = "/*" }
                        client.notify("workspace/didChangeConfiguration")
                        vim.notify("Switched to schema: " .. selection)
                        return
                    end
                end

                vim.notify("YAML LSP (yamlls) is not active!", vim.log.levels.WARN)
            end)

            return true
        end,
    }):find()
end

local function get_key_by_value(tbl, value_to_find)
    for key, value in pairs(tbl) do
        if value == value_to_find then
          return key
        end
    end
    return ""
end

function M.get_active_lsp_with_schema()
    local clients = vim.lsp.get_active_clients()
    local active_lsps = {}

    for _, client in ipairs(clients) do
        table.insert(active_lsps, client.name)

        -- If the client is `yamlls`, try to retrieve the schema
        if client.name == "yamlls" and client.config.settings.yaml.schemas then
            local client_schemas = client.config.settings.yaml.schemas
            local file_path = vim.fn.expand("%:p")

            -- Find the matching schema for the current file
            for schema, pattern in pairs(client_schemas) do
                if file_path:match(pattern:gsub("%*", ".*")) then
                    return "%#LSPInfo# " .. client.name .. " (" .. get_key_by_value(M.yaml_schemas, schema) .. ")"
                end
            end
        end
    end

    -- Return all active LSPs if not `yamlls` or no schema matches
    return table.concat(active_lsps .. "%#LSPInfo#", ", ")
end

function M.config()
  vim.api.nvim_set_hl(0, 'LSPInfo', { fg = '#cba6f7', bg = 'NONE' })
  vim.api.nvim_create_user_command("SwitchYamlSchema", M.switch_project_schema, {})
  vim.api.nvim_set_keymap('n', '<Leader>fy', ':SwitchYamlSchema<CR>', { noremap = true, silent = true })
end

return M

