$ ->
	$(".conjugate-root-form").on "ajax:success", (e, data) ->
		update_conjugation_table(data)

	update_conjugation_table = (data) ->
		console.log data

		$(".word-root1field").text data['root'][0]
		$(".word-root2field").text data['root'][1]
		$(".word-root3field").text data['root'][2]
		$(".word-form-field").text "FORM " + data['form']
		$(".word-subform-field").text data['subform'] + " root"

		$(".word-active-participle-field").text data["conjugations"]["participles"]["active_participle"]
		$(".word-passive-participle-field").text data["conjugations"]["participles"]["passive_participle"]
		# $(".word-verbal-noun-field").text data["participles"]["verbal_noun"]

		present_tense_conjugations = data["conjugations"]["present"]
		past_tense_conjugations = data["conjugations"]["past"]

		_.each present_tense_conjugations, (value, key) ->
			$("tr[data-perspective='#{key}']").find("td.present-tense-conjugation").text(value)

		_.each past_tense_conjugations, (value, key) ->
			$("tr[data-perspective='#{key}']").find("td.past-tense-conjugation").text(value)
