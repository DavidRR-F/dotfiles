return {
  name = {
    lsp = "yamlls"
  },
  lsp = {
    settings = {
      yaml = {
        format = {
          enable = true,
          bracketSpacing = true,
        },
        hover = true,
        validate = true,
        schemas = {
          kubernetes = {
            "configmap.yml",
            "deployment.yml",
            "service.yml",
            "ingress.yml",
            "secret.yml",
            "persistentClaim.yml",
            "configmap.yaml",
            "deployment.yaml",
            "service.yaml",
            "ingress.yaml",
            "secret.yaml",
            "persistentClaim.yaml",
            "job.yml",
            "job.yaml"
          },
          -- Kustomize Schema
          ["https://json.schemastore.org/kustomization.json"] = {
            "kustomization.yml",
            "kustomization.yaml",
          },
          -- Helm Schema
          ["https://json.schemastore.org/chart.json"] = {
            "**/templates/*.yml",
            "**/templates/*.yaml",
            "values.yml",
            "values.yaml",
          },
          -- GitLab Schema
          ["https://gitlab.com/gitlab-org/gitlab/-/raw/master/app/assets/javascripts/editor/schema/ci.json"] = {
            ".gitlab-ci.yml",
            "*-common.yml",
            "*-template.yml",
            ".gitlab-ci.yaml",
            "*-common.yaml",
            "*-template.yaml",
          },
          -- Ansible Playbooks Schema
          ["https://raw.githubusercontent.com/ansible/ansible-lint/main/src/ansiblelint/schemas/ansible.json#/$defs/playbook"] = {
            "**/playbooks/*.yml",
            "**/playbooks/*.yaml",
          },
          -- Ansible Inventory Schema
          ["https://raw.githubusercontent.com/ansible/ansible-lint/main/src/ansiblelint/schemas/inventory.json"] = {
            "*inventory.yml",
            "*inventory.yaml",
          }
        },
        schemaStore = {
          enable = true
        },
      }
    },
    filetypes = { "yaml", "yml" },
    single_file_support = true,
  }
}
