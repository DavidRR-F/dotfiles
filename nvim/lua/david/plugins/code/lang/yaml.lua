return {
  settings = {
    yaml = {
      format = {
        enable = true,
        bracketSpacing = true,
      },
      hover = true,
      validate = true,
      completion = true,
      schemas = {
        -- Kubernetes Schema
        ["https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/v1.27.3-standalone-strict/all.json"] = function()
          local cwd = vim.fn.getcwd()
          local bufname = vim.api.nvim_buf_get_name(0)
          return bufname:match(cwd .. "/.*/kustomize/.*%.ya?ml$")
        end,
        -- Kustomize Schema
        ["https://json.schemastore.org/kustomization.json"] = function()
          local bufname = vim.api.nvim_buf_get_name(0)
          return bufname:match("kustomization%.ya?ml$")
        end,
        -- Helm Schema
        ["https://json.schemastore.org/helm-values.json"] = function()
          local bufname = vim.api.nvim_buf_get_name(0)
          return bufname:match("values%.ya?ml$") or bufname:match(".*/templates/.*%.ya?ml$")
        end,
        -- Gitlab Schema
        ["https://gitlab.com/gitlab-org/gitlab/-/raw/master/app/assets/javascripts/editor/schema/ci.json"] = function()
          local bufname = vim.api.nvim_buf_get_name(0)
          return bufname:match("%.gitlab%-ci%.ya?ml$") or bufname:match(".*%-common%.ya?ml$") or bufname:match(".*%-template%.ya?ml$")
        end,
      }
    }
  },
  filetypes = { "yaml", 'yaml.gitlab' },
  single_file_support = true
}
