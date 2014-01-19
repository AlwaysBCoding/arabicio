App.directive "stemParser", [ () ->

  restrict: "E"
  template: """
            <input type="text" key-enter="parseWord(arabicWord)" ng-model="arabicWord">
            </input>
            """

]
