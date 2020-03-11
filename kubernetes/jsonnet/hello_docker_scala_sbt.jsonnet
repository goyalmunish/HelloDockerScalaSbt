local namespace = std.extVar('namespace');
local utils = import 'utils.jsonnet';

local obj_name = 'hello-docker-scala-sbt';

local basic_scala_service = function(namespace) (
  local ports = [
    {
      name: 'web',
      port: 8080,
      targetPort: 'server-web',
      protocol: 'TCP',
    },
  ];

  utils.basic_service(obj_name, ports, service_type='NodePort', namespace=namespace)
);

local debug_scala_server = function(namespace) (
  local ports = [
    {
      name: 'web',
      port: 8080,
      targetPort: 5000,
      protocol: 'TCP',
    },
  ];

  utils.basic_service(obj_name, ports, service_name='debug-scala-server', service_type='NodePort', namespace=namespace)
);


local basic_scala_deployment = function(namespace) (
  local containers = [
    {
      name: obj_name,
      image: 'goyalmunish/hello-docker-scala-sbt:latest',
      imagePullPolicy: 'Always',
      ports: [
        {
          name: 'server-web',
          containerPort: 3000,
        },
      ],
    },
  ];

  utils.basic_deployment(obj_name, containers, namespace=namespace)
);


[debug_scala_server(namespace=namespace), basic_scala_service(namespace=namespace), basic_scala_deployment(namespace=namespace)]
