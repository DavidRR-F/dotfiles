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
        ["https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/v1.27.3-standalone-strict/all.json"] = {
          "configmap.{yml,yaml}",
          "deployment.{yml,yaml}",
          "service.{yml,yaml}",
          "ingress.{yml,yaml}",
          "secret.{yml,yaml}",
        },
        -- Kustomize Schema
        ["https://json.schemastore.org/kustomization.json"] = {
          "kustomization.{yml,yaml}"
        },
        -- Gitlab Schema
        ["https://gitlab.com/gitlab-org/gitlab/-/raw/master/app/assets/javascripts/editor/schema/ci.json"] = {
          ".gitlab-ci*.{yml,yaml}",
          "*-common.{yml,yaml}",
          "*-template.{yml,yaml}"
        },
      },
      schemaStore = {
        enable = false
      },
    }
  },
  filetypes = { "yaml" },
  single_file_support = true
}
