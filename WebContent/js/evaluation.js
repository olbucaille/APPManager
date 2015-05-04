$(window).load(function(){
$( ".slider" ).slider({
    value: 2,
    min: 1,
    max: 5,
    step: 1,
    slide: function( event, ui ) {
    	switch(ui.value){
    	
    	case 1:
    		 $( "#progress-bar" ).css({
    		      "background-color": "#f63a0f",
    		      "width": "0%"
    		    });
    		break;
		case 2:
			 $( "#progress-bar" ).css( {
				 "background-color": "#f27011",
		      "width": "25%"
		    });
		    break;
		case 3:
			$( "#progress-bar" ).css( {
  		      "background-color": "#f2b01e",
		      "width": "050%"
		    });
			break;
		case 4:
			$( "#progress-bar" ).css({
  		      "background-color": "#f2d31b",
		      "width": "75%"
		    });
			break;
		case 5:
			$( "#progress-bar" ).css({
  		      "background-color": "#86e01e",
		      "width": "100%"
		    });
			break;
    	}
       
        
    }
})
.each(function() {

  //
  // Add labels to slider whose values 
  // are specified by min, max and whose
  // step is set to 1
  //

  // Get the options for this slider
  var opt = $(this).data().uiSlider.options;
  
  // Get the number of possible values
  var vals = opt.max - opt.min;
  
  // Space out values
  for (var i = 0; i <= vals; i++) {
    
    var el = $('<label>'+(i+1)+'</label>').css('left',(i/vals*100)+'%');
  
    $( ".slider" ).append(el);
    
  }
  
});
$( "#slider-value" ).html(  $('#slider').slider('value') );
$( "#progress-bar" ).css( "width","=+50");
});



