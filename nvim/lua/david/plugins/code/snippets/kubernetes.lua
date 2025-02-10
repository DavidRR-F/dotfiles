local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

ls.add_snippets("yaml", {
  -- Kubernetes Deployment
  s("kdep", {
    t({
      "apiVersion: apps/v1",
      "kind: Deployment",
      "metadata:",
      "  name: ",
      "spec:",
      "  replicas: ",
      "  selector:",
      "    matchLabels:",
      "      app: ",
      "  template:",
      "    metadata:",
      "      labels:",
      "        app: ",
      "    spec:",
      "      containers:",
      "      - name: ",
      "        image: ",
      "        ports:",
      "        - containerPort: ",
    }),
  }),

  -- Kubernetes Service
  s("ksvc", {
    t({
      "apiVersion: v1",
      "kind: Service",
      "metadata:",
      "  name: ",
      "spec:",
      "  selector:",
      "    app: ",
      "  ports:",
      "  - protocol: TCP",
      "    port: ",
      "    targetPort: ",
    }),
  }),

  -- Kubernetes Pod
  s("kpod", {
    t({
      "apiVersion: v1",
      "kind: Pod",
      "metadata:",
      "  name: ",
      "spec:",
      "  containers:",
      "  - name: ",
      "    image: ",
      "    ports:",
      "    - containerPort: ",
    }),
  }),

  -- Kubernetes Ingress
  s("king", {
    t({
      "apiVersion: networking.k8s.io/v1",
      "kind: Ingress",
      "metadata:",
      "  name: ",
      "spec:",
      "  rules:",
      "  - host: ",
      "    http:",
      "      paths:",
      "      - path: /",
      "        pathType: Prefix",
      "        backend:",
      "          service:",
      "            name: ",
      "            port:",
      "              number: ",
    }),
  }),

  -- Kubernetes ConfigMap
  s("kcm", {
    t({
      "apiVersion: v1",
      "kind: ConfigMap",
      "metadata:",
      "  name: ",
      "data:",
      "  config.json: |",
    }),
  }),

  -- Kubernetes PersistentVolumeClaim (PVC)
  s("kpvc", {
    t({
      "apiVersion: v1",
      "kind: PersistentVolumeClaim",
      "metadata:",
      "  name: ",
      "spec:",
      "  accessModes:",
      "  - ReadWriteOnce",
      "  resources:",
      "    requests:",
      "      storage: ",
    }),
  }),

  -- Kubernetes Secret
  s("ksec", {
    t({
      "apiVersion: v1",
      "kind: Secret",
      "metadata:",
      "  name: ",
      "type: Opaque",
      "data:",
      "  username: ",
      "  password: ",
    }),
  }),
})
