function bloquearPantalla(divPrincipal, divMensaje){
	$('#'+divPrincipal).block({ 
        message: $('#'+divMensaje), 
        css: {
        	border: '1px solid', 
            padding: '15px',
            '-webkit-border-radius': '10px', 
            '-moz-border-radius': '10px', 
            opacity: '1.5', 
            color: '#000'
        },
		overlayCSS: { backgroundColor: 'transparent' } 
    });
}

function activarPantalla(divPrincipal){
	$('#'+divPrincipal).unblock();
};

function cerrarAlerta(id){
	$(id).hide('100');
}