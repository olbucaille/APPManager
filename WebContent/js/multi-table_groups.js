$( "#access1" ).click(function() {
	$( "#block-access1" ).show( "slow" );
	$( "#block-access2" ).hide();
	$( "#block-access3" ).hide();
	$( "#block-access4" ).hide();
});

$( "#access2" ).click(function() {
	$( "#block-access2" ).show( "slow" );
	$( "#block-access1" ).hide();
	$( "#block-access3" ).hide();
	$( "#block-access4" ).hide();
});

$( "#access3" ).click(function() {
	$( "#block-access3" ).show( "slow" );
	$( "#block-access1" ).hide();
	$( "#block-access2" ).hide();
	$( "#block-access4" ).hide();
});

$( "#access4" ).click(function() {
	$( "#block-access4" ).show( "slow" );
	$( "#block-access1" ).hide();
	$( "#block-access2" ).hide();
	$( "#block-access3" ).hide();
});