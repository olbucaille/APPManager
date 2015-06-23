function accessAPP(){
	$( "#block-accessAPP" ).show();
	$( "#block-accessTeam" ).hide();
	$( "#block-accessAffect" ).hide();
}

function accessTeam(){
	$( "#block-accessTeam" ).show();
	$( "#block-accessAPP" ).hide();
	$( "#block-accessAffect" ).hide();
}

function accessAffect(){
	$( "#block-accessAffect" ).show();
	$( "#block-accessAPP" ).hide();
	$( "#block-accessTeam" ).hide();
}

function Deplacer(l1, l2) {
	if (l1.options.selectedIndex >= 0) {
		o = new Option(l1.options[l1.options.selectedIndex].text,
				l1.options[l1.options.selectedIndex].value, true,
				true);
		l2.options[l2.options.length] = o;
		l1.options[l1.options.selectedIndex] = null;
	} else {
		alert("Aucune activité sélectionnée");
	}
}