App.directive "stemParser", [ () ->

  restrict: "E"
  template: """
            <input type="text" key-enter="parseWord(arabicWord)" ng-model="arabicWord">
            </input>

            <div class="stems-container">
              <ul class="stems">
                <li ng-repeat="stem in stems">
                  <pre>ROOT: {{stem.root}}</pre>
                  <pre>MEASURES: {{stem.measures}}</pre>
                  <pre>PERFECT KICKER: {{stem.perfect_kicker}}</pre>
                  <pre>IMPERFECT KICKER: {{stem.imperfect_kicker}}</pre>
                  <pre>NOTES: {{stem.notes}}</pre>
                  <pre>MEASURE I VERBAL NOUNS: {{stem.verbal_nouns}}</pre>
                  <ul class="meanings">
                    <li ng-repeat="meaning in stem.english_meanings">
                      <pre>MEASURE: {{meaning.measure}}</pre>
                      <pre>{{meaning.meaning}}</pre>
                    </li>
                  </ul>
                </li>
              </ul>
            </div>
            """
]
