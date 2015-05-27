function access1(){
	$( "#block-access1" ).show( "slow" );
	$( "#block-access2" ).hide();
	$( "#block-access3" ).hide();
	$( "#block-access4" ).hide();
}

function access2(){
	$( "#block-access2" ).show( "slow" );
	$( "#block-access1" ).hide();
	$( "#block-access3" ).hide();
	$( "#block-access4" ).hide();
}

function access3(){
	$( "#block-access3" ).show( "slow" );
	$( "#block-access1" ).hide();
	$( "#block-access2" ).hide();
	$( "#block-access4" ).hide();
}

function access4(){
	$( "#block-access4" ).show( "slow" );
	$( "#block-access1" ).hide();
	$( "#block-access2" ).hide();
	$( "#block-access3" ).hide();
}