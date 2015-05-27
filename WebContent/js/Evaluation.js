function cross_evaluation() {
	$( "#cross_evaluation" ).show( "slow" );
	$( "#auto_evaluation" ).hide();
};

function auto_evaluation() {
	$( "#auto_evaluation" ).show( "slow" );
	$( "#cross_evaluation" ).hide();
};
$(document).ready(function() {
    var $contenu_div = $('#contenu');
    var page = $('#evaluation_list li a:first').text(); // par défaut c'est Index
     
    // au clic sur un lien du menu
    $('#evaluation_list li a').on('click', function() {
        var url = $(this).attr('href'); // on récupère le href
         
        // on récupère le nom de la page demandée
        var pageDemandee = $(this).text();
        // si on appelle une page qui n est pas celle affichée
        if(pageDemandee != page) { 
        	
            //on met en mémoire la page
            page = pageDemandee;
            
            // chargement dans la div
            $.ajax({
                url: url,
                cache: false,
                success: function() {
                	 $contenu_div.hide().load('Auto_Evaluation.jsp').fadeIn();
                }
            });
        }
        return false;
    });
});