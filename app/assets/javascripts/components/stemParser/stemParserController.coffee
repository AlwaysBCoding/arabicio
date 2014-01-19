App.controller "StemParserController",
[
  "$scope",
  "$http"
(
  $scope,
  $http
) ->

  $scope.parseWord = (word) ->
    $http
      method: "GET"
      url: "/api/v1/analyze_word?word=#{word}"
    .success (data, status, headers, config) ->
      $scope.stems = data.arabic_stems
    .error (data, status, headers, config) ->
      alert status
]
