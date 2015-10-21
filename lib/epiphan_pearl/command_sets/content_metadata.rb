module EpiphanPearl
  class ContentMetadata < CommandSet
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
