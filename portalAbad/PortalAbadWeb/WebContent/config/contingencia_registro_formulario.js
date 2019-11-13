function validarFormulario(form, url){
	$('#alerta').hide();
	$('#emailText').parent().removeClass('has-error');
	$('#passwordText').parent().removeClass('has-error');
	$('#confPasswordText').parent().removeClass('has-error');
	$('#referenciaText').parent().removeClass('has-error');
	$('#usuarioText').parent().removeClass('has-error');
	var valiOk=true;	
	var email=form.emailText.value;
	var pass=form.passwordText.value;
	var conPass=form.confPasswordText.value;
	var referenciaText = form.referenciaText.value;
	var usuarioText = form.usuarioText.value;
	usuarioText = usuarioText.toUpperCase();
	pass = pass.toUpperCase();
	conPass = conPass.toUpperCase();
	if(referenciaText==""){
		$("#referenciaText").parent().addClass('has-error');
		$('#alertaMsg').text('Debe ingresar una referencia');
		$('#alerta').show();
		valiOk=false;
	}
	else if(!validarNumeros(referenciaText)){
		$("#referenciaText").parent().addClass('has-error');
		$('#alertaMsg').text('Debe ingresar una referencia válida');
		$('#alerta').show();
		valiOk=false;
	}
	else if(usuarioText==""){
		$("#usuarioText").parent().addClass('has-error');
		$('#alertaMsg').text('Debe ingresar un usuario');
		$('#alerta').show();
		valiOk=false;
	}
	else if(!validarReferencia(usuarioText)){
		$("#usuarioText").parent().addClass('has-error');
		$('#alertaMsg').text('Código de usuario no válido');
		$('#alerta').show();
		valiOk=false;
	}
	else if(email==""){
		$('#emailText').parent().addClass('has-error');
		$('#alertaMsg').text('Debe Ingresar el correo electrónico');
		$('#alerta').show();	
		valiOk=false;
	}else if(!validarEmail(email)){
		$('#emailText').parent().addClass('has-error');
		$('#alertaMsg').text('El campo correo electrónico no es válido');
		$('#alerta').show();		
		valiOk=false;
	}else if(pass==""){
		$('#passwordText').parent().addClass('has-error');
		$('#alertaMsg').text('Debe Ingresar la contraseña nueva');
		$('#alerta').show();		
		valiOk=false;
	}else if(!validarClave(pass)){
		$('#passwordText').parent().addClass('has-error');	
		$('#alertaMsg').text('Por favor ingrese una clave válida:(8 dígitos, alfanumérica sin caracteres especiales %&$/)');
		$('#alerta').show();	
		valiOk=false;
	}else if(pass.toUpperCase()==usuarioText.toUpperCase()){
		$('#passwordText').parent().addClass('has-error');	
		$('#alertaMsg').text('La clave no puede ser el código de usuario');
		$('#alerta').show();	
		valiOk=false;
	}else if(pass.toUpperCase()==referenciaText.toUpperCase()){
		$('#passwordText').parent().addClass('has-error');	
		$('#alertaMsg').text('La clave no puede ser la referencia');
		$('#alerta').show();	
		valiOk=false;
	}else if(conPass==""){
		$('#confPasswordText').parent().addClass('has-error');
		$('#alertaMsg').text('Debe confirmar la contraseña nueva');
		$('#alerta').show();		
		valiOk=false;
	}else if(!(conPass===pass)){
		$('#passwordText').parent().addClass('has-error');
		$('#confPasswordText').parent().addClass('has-error');
		$('#alertaMsg').text('La contraseña no Coincide debe ser válida: (8 dígitos, alfanumérica sin caracteres especiales %$#)');
		$('#alerta').show();
		valiOk=false;
	}
	if(valiOk){
		form.usuarioText.value = usuarioText;
		form.passwordText.value = pass;
		form.confPasswordText.value = conPass;
		form.action=url;
		form.submit();
	}
}

function validarFirma(form, url){
	$('#alerta').hide();
	$('#pdClaveOperaciones').parent().removeClass('has-error');
	$('#pdToken').parent().removeClass('has-error');	
	var valiOk=true;
	var pdToken=form.pdToken.value.toUpperCase();
	var pdClaveOperaciones=form.pdClaveOperaciones.value.toUpperCase();
	
	if(pdClaveOperaciones==""){
		$('#pdClaveOperaciones').parent().addClass('has-error');
		$('#alertaMsg').text('Debe Ingresar la clave de operaciones');
		$('#alerta').show();	
		valiOk=false;
	}
	else if(!validarClave(pdClaveOperaciones))
	{
		$('#pdClaveOperaciones').parent().addClass('has-error');
		$('#alertaMsg').text('Debe Ingresar una clave de operaciones válida');
		$('#alerta').show();	
		valiOk=false;
	}
	else if(pdToken=="")
	{
		$('#pdToken').parent().addClass('has-error');
		$('#alertaMsg').text('Debe Ingresar la clave del token');
		$('#alerta').show();	
		valiOk=false;
	}
	else if(!validarNumeros(pdToken)){
		$('#pdToken').parent().addClass('has-error');
		$('#alertaMsg').text('Debe Ingresar una clave de token válida');
		$('#alerta').show();	
		valiOk=false;
	}
	if(valiOk){
		form.action=url;
		form.pdToken.value = pdToken;
		form.pdClaveOperaciones.value = pdClaveOperaciones;
		form.submit();
	}
}
function validarReferencia (texto)
{
	expr =/^[a-zA-Z0-9]+$/;
	return texto.match(expr);
}
function validarClave (texto)
{
	expr =/^[a-zA-Z0-9]{8}/;
	return texto.match(expr);
}
function validarEmail( email ) {
    expr = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z\-])+\.)+([a-zA-Z]{2,4})+$/;
    return email.match(expr);        
}
function validarNumeros(Numero)
{
	expr = /^[0-9]{8}/;
	return Numero.match(expr);
}
function cerrarAlerta(id){
	$(id).hide();
}
$(document).ready(function(){
    $('[data-toggle="popover"]').popover();   
});
//Ini cmc 17-04-2018
$(document).ready(function(){
	//Ini cmc 21-05-2018
	var codReferencia = $("#referenciaCod").val();		
	var codUsuario = $("#usuarioCod").val();	
	$("#volver").click(function(){	
	window.location.href="LogonAnonimoServlet?proceso=contingencia_registro_pr&operacion=contingencia_registro_op&accion=inicio&codReferencia=" + codReferencia+"&codUsuario="+codUsuario;								
	//Fin CMC 21-05-2018
	});	
});
//Fin cmc 17-04-2018