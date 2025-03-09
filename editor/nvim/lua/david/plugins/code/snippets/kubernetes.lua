local ls = require("luasnip")
local lse = require("luasnip.extras")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local rep = lse.rep

ls.add_snippets("yaml", {
    -- Deployment
    s("kdep", {
        t({
            "apiVersion: apps/v1",
            "kind: Deployment",
            "metadata:",
            "  name: ",
        }),
        i(1, "my-app"),
        t({
            "",
            "spec:",
            "  replicas: 1",
            "  selector:",
            "    matchLabels:",
            "      app: ",
        }),
        i(2, "my-app"),
        t({
            "",
            "  template:",
            "    metadata:",
            "      labels:",
            "        app: ",
        }),
        rep(2),
        t({
            "",
            "    spec:",
            "      containers:",
            "      - name: ",
        }),
        i(3, "my-app-container"),
        t({
            "",
            "        image: ",
        }),
        i(4, "nginx:latest"),
        t({
            "",
            "        ports:",
            "        - containerPort: ",
        }),
        i(5, "80"),
    }),

    -- Service
    s("ksvc", {
        t({
            "apiVersion: v1",
            "kind: Service",
            "metadata:",
            "  name: ",
        }),
        i(1, "my-service"),
        t({
            "",
            "spec:",
            "  selector:",
            "    app: ",
        }),
        i(2, "my-app"),
        t({
            "",
            "  ports:",
            "  - protocol: TCP",
            "    port: ",
        }),
        i(3, "80"),
        t({
            "",
            "    targetPort: ",
        }),
        i(4, "80"),
    }),

    -- ConfigMap
    s("kcm", {
        t({
            "apiVersion: v1",
            "kind: ConfigMap",
            "metadata:",
            "  name: ",
        }),
        i(1, "my-config"),
        t({
            "",
            "data:",
        }),
    }),

    -- Pod
    s("kpod", {
        t({
            "apiVersion: v1",
            "kind: Pod",
            "metadata:",
            "  name: ",
        }),
        i(1, "my-pod"),
        t({
            "",
            "spec:",
            "  containers:",
            "  - name: ",
        }),
        i(2, "my-container"),
        t({
            "",
            "    image: ",
        }),
        i(3, "nginx"),
        t({
            "",
            "    ports:",
            "    - containerPort: ",
        }),
        i(4, "80"),
    }),

    -- Ingress
    s("king", {
        t({
            "apiVersion: networking.k8s.io/v1",
            "kind: Ingress",
            "metadata:",
            "  name: ",
        }),
        i(1, "my-ingress"),
        t({
            "",
            "spec:",
            "  rules:",
            "  - host: ",
        }),
        i(2, "example.com"),
        t({
            "",
            "    http:",
            "      paths:",
            "      - path: /",
            "        pathType: Prefix",
            "        backend:",
            "          service:",
            "            name: ",
        }),
        i(3, "my-service"),
        t({
            "",
            "            port:",
            "              number: ",
        }),
        i(4, "80"),
    }),

    -- PersistentVolumeClaim
    s("kpvc", {
        t({
            "apiVersion: v1",
            "kind: PersistentVolumeClaim",
            "metadata:",
            "  name: ",
        }),
        i(1, "my-pvc"),
        t({
            "",
            "spec:",
            "  accessModes:",
            "  - ReadWriteOnce",
            "  resources:",
            "    requests:",
            "      storage: ",
        }),
        i(2, "1Gi"),
    }),

    -- Job
    s("kjob", {
        t({
            "apiVersion: batch/v1",
            "kind: Job",
            "metadata:",
            "  name: ",
        }),
        i(1, "my-job"),
        t({
            "",
            "spec:",
            "  template:",
            "    spec:",
            "      containers:",
            "      - name: ",
        }),
        i(2, "my-job-container"),
        t({
            "",
            "        image: ",
        }),
        i(3, "busybox"),
        t({
            "",
            "        command: ",
        }),
        i(4, "['echo', '$HOME']"),
        t({
            "      restartPolicy: Never",
        }),
    }),

    -- Secret
    s("ksec", {
        t({
            "apiVersion: v1",
            "kind: Secret",
            "metadata:",
            "  name: ",
        }),
        i(1, "my-secret"),
        t({
            "",
            "type: Opaque",
            "data:",
        }),
    }),

    -- Patch
    s("kpat", {
      t({
        "patches:",
        "  - target:",
        "      version: v1",
        "      kind: ",
      }),
      i(1, "Deployment"),
      t({
        "",
        "      name: "
      }),
      i(2, "deployment"),
      t({
        "",
        "    patch: |-",
        "      - op: "
      }),
      i(3, "add"),
      t({
        "",
        "        path: "
      }),
      i(4, "/spec/template/metadata/labels/type"),
      t({
        "",
        "        value: "
      }),
      i(5, "proxy"),
    }),
})
