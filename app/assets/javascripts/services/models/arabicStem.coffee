App.factory "ArabicStem",
[
  "railsResourceFactory",
  "railsSerializer"
(
  railsResourceFactory,
  railsSerializer
) ->

  ArabicStemResource = railsResourceFactory
    url: "/api/v1/arabic_stems"
    name: "ArabicStem"

  class ArabicStem extends ArabicStemResource

]
