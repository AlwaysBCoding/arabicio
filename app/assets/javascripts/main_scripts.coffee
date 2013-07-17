$ ->
	$(".conjugate-root-form").on "ajax:success", (e, data) ->
		update_conjugation_table(data)

	update_conjugation_table = (data) ->
		console.log data
		$(".word-root1").text data['root'][0]
		$(".word-root2").text data['root'][1]
		$(".word-root3").text data['root'][2]
		$(".word-form").text "FORM " + data['form']
		$(".word-subform").text data['subform'] + " root"
