module EpiphanPearl
  class ContentMetadata < ParameterSet
    register_parameters [
      {
        :key => "author"
      },
      {
        :key => "comment"
      },
      {
        :key => "copyright"
      },
      {
        :key => "title"
      }
    ]
  end
end
