$( "#button-div1" ).click(function() {
	$( "#div1" ).show( "slow" );
	$( "#div2" ).hide();
	$( "#div3" ).hide();
});

$( "#button-div2" ).click(function() {
	$( "#div2" ).show( "slow" );
	$( "#div1" ).hide();
	$( "#div3" ).hide();
});

$( "#button-div3" ).click(function() {
	$( "#div3" ).show( "slow" );
	$( "#div1" ).hide();
	$( "#div2" ).hide();
});