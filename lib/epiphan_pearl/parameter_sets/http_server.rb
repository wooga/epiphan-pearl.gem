module EpiphanPearl
  class HttpServer < ParameterSet
    register_parameters [
      {
        :key => "http_port",
        :display_name => "port"
      },
      {
        :key => "http_sport",
        :display_name => "ssl_port"
      },
      {
        :key => "http_usessl",
        :display_name => "use_ssl",
        :value_class => [TrueClass, FalseClass]
      }
    ]
  end
end
