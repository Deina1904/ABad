function MostrarRegistro()
{
	document.getElementById("acepto").style.display = "initial";
	$( "#ConsultaOperaciones" ).hide(  );
	$( "#TerminosYCondiciones" ).show(  );
}
function Finalizar(referencia,usuario)
{
	elemento = document.getElementById("acepto");
	if(elemento.checked ) 
	{
		document.getElementById("Formulario").submit();
		//Ini cmc 17-04-2018		      
		window.open("https://www.bbvanet.com.co/principal2.html");
		//fin cmc 17-04-2018
	}
	else
	{
		alert('Para continuar usted debe de aceptar los términos y condiciones de BBVA NetCash');
	}
}
function ConsultarOp(url)
{
	var xmlhttp;
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("ConsultaOperaciones").innerHTML = xmlhttp.responseText;
			inclusionDinamica();
		}
	};
	var referencia = document.getElementById("referencia").value;
	var usuario = document.getElementById("usuario").value;	
	var parametro = "referencia="+referencia+"&usuario="+usuario;
	xmlhttp.open("POST", url, true);
	xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	xmlhttp.send(parametro);
	
	$( "#TerminosYCondiciones" ).hide( );
	$( "#ConsultaOperaciones" ).show();
}
function VerMas(url)
{
	$("#CampoConsulta").val("");
	ConsultarNombre("");
	$("#Tabla tr:last").remove();
	var xmlhttp;
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			$("#Tabla").append(xmlhttp.responseText);
			inclusionDinamica();
			var trs=$("#Tabla tr").length-4; // Se restan cuatro valores (Cabecera, filtro, titulo y ver mas resultados)
			if($("#Tabla tr td div tr").length==4) // Al iniciar el popover se agregan 4 tr mas y deben disminuirce del numero de resultados
			{
				trs-=4;
			}
			$("#res_mostrados").text(trs);
		}
	};
	xmlhttp.open("GET", url, true);
	xmlhttp.send();
}
function inclusionDinamica()
{
	document.getElementById("ConsultaOperaciones").style.overflow = "auto";
	$.datepicker.regional['es'] = 
	{
		closeText: 'Cerrar',
		prevText: '<Ant',
		nextText: 'Sig>',
		currentText: 'Hoy',
		monthNames: ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'],
		monthNamesShort: ['Ene','Feb','Mar','Abr', 'May','Jun','Jul','Ago','Sep', 'Oct','Nov','Dic'],
		dayNames: ['Domingo', 'Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sábado'],
		dayNamesShort: ['Dom','Lun','Mar','Mié','Juv','Vie','Sáb'],
		dayNamesMin: ['Do','Lu','Ma','Mi','Ju','Vi','Sá'],
		weekHeader: 'Sm',
		dateFormat: 'yy-mm-dd',
		firstDay: 1,
		isRTL: false,
		showMonthAfterYear: false,
		yearSuffix: ''
	};
	$.datepicker.setDefaults($.datepicker.regional['es']);

	var tmp = $.fn.popover.Constructor.prototype.show;
	$.fn.popover.Constructor.prototype.show = function () {
	  tmp.call(this);
	  if (this.options.callback) {
	    this.options.callback();
	  }
	};
	$('[data-toggle="popover"]').popover( {content: $('#MenuFiltro').html(),html: true,
		callback: function() { 
			dateHistory2();
	  } 
	}).click(function (e) {
	        e.preventDefault();
	 });
}
function FiltrarTabla(url)
{
	var parametro;
	var ValidaOk =true ;
	$("#FechaProcesoDesde").parent().removeClass('has-error');
	$("#FechaProcesoHasta").parent().removeClass('has-error');
	$("#ImporteDesde").parent().removeClass('has-error');
	$("#ImporteHasta").parent().removeClass('has-error');
	var FechaProcesoDesde = document.getElementById("FechaProcesoDesde").value;
	var ImporteDesde = parseFloat(document.getElementById("ImporteDesde").value);
	var FechaProcesoHasta = document.getElementById("FechaProcesoHasta").value;
	var ImporteHasta = parseFloat(document.getElementById("ImporteHasta").value);
	
	if(FechaProcesoDesde=="" && !(FechaProcesoHasta==""))
	{
		$("#FechaProcesoDesde").parent().addClass('has-error');
		$("#FechaProcesoHasta").parent().addClass('has-error');
		$('#alertaMsg').text('Debe ingresar las 2 fechas de pago');
		$('#alerta').show();
		ValidaOk =false ;
	}
	if(FechaProcesoHasta=="" && !(FechaProcesoDesde==""))
	{
		$("#FechaProcesoDesde").parent().addClass('has-error');
		$("#FechaProcesoHasta").parent().addClass('has-error');
		$('#alertaMsg').text('Debe ingresar las 2 fechas de pago');
		$('#alerta').show();
		ValidaOk =false ;
	}
	if (!(document.getElementById("ImporteHasta").value=="") && document.getElementById("ImporteDesde").value=="")
	{
		$("#ImporteDesde").parent().addClass('has-error');
		$("#ImporteHasta").parent().addClass('has-error');
		$('#alertaMsg').text('Debe ingresar los 2 campos de importe');
		$('#alerta').show();
		ValidaOk =false ;
	}
	if (!(document.getElementById("ImporteDesde").value=="") && document.getElementById("ImporteHasta").value=="")
	{
		$("#ImporteDesde").parent().addClass('has-error');
		$("#ImporteHasta").parent().addClass('has-error');
		$('#alertaMsg').text('Debe ingresar los 2 campos de importe');
		$('#alerta').show();
		ValidaOk =false ;
	}
	if (!(document.getElementById("ImporteHasta").value=="") && !(document.getElementById("ImporteDesde").value==""))
	{
		if(ImporteDesde >= ImporteHasta)
		{
			$("#ImporteDesde").parent().addClass('has-error');
			$("#ImporteHasta").parent().addClass('has-error');
			$('#alertaMsg').text('El formato de los importes no es válido');
			$('#alerta').show();
			ValidaOk =false ;
		}
	}
	if(document.getElementById("ImporteHasta").value=="" && document.getElementById("ImporteDesde").value=="")
	{
		ImporteDesde = "";
		ImporteHasta = "";
	}
	if(ValidaOk)
	{
		var xmlhttp;
		if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
			xmlhttp = new XMLHttpRequest();
		} else {// code for IE6, IE5
			xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
		}
		xmlhttp.onreadystatechange = function() {
			if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
				document.getElementById("ConsultaOperaciones").innerHTML = xmlhttp.responseText;
				inclusionDinamica();
			}
		};
		parametro = "FechaProcesoDesde=" + FechaProcesoDesde + "&ImporteDesde=" + ImporteDesde +  "&FechaProcesoHasta=" + FechaProcesoHasta + "&ImporteHasta=" + ImporteHasta;
		xmlhttp.open("POST", url, true);
		xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xmlhttp.send(parametro);
	}
}
function validate_fechaMayorQue(fechaInicial,fechaFinal)
{
    valuesStart=fechaInicial.split("-");
    valuesEnd=fechaFinal.split("-");
    ValidaOk = true;
    // Verificamos que la fecha no sea posterior a la actual
    var FechaInicio=new Date(valuesStart[2],(valuesStart[1]-1),valuesStart[0]);
    var FechaFin=new Date(valuesEnd[2],(valuesEnd[1]-1),valuesEnd[0]);
    if(FechaInicio>=FechaFin)
    {
    	ValidaOk=false;
    }
    return ValidaOk;
}
function ConsultarNombre(dato)
{
	Nombre = dato.toUpperCase();
	var DatoCoincidente = new RegExp(Nombre+".*","g");
	var trs=$("#Tabla tr").length-4;
	var Resultados=0;
	if(Nombre.length !=0)
	{
		$("#ver_mas_resultados").hide();
		for(var i=1;i<=trs;i++)
		{
			$("#Fila"+i).hide();
			var Dato=document.getElementById("NomFiche"+i).innerHTML.toUpperCase();
			if(Dato.match(DatoCoincidente))
			{
				Resultados++;
				$("#Fila"+i).show();
			}
			$("#res_mostrados").text(Resultados);
		}
	}
	else
	{
		$("#ver_mas_resultados").show();
		for(var i=1;i<=trs;i++)
		{
			Resultados++;
			$("#Fila"+i).show();
		}
		$("#res_mostrados").text(Resultados);
	}
}
function cerrarAlerta(id)
{
	$(id).hide();
}



function dateHistory2() {
	
	$("#FechaProcesoDesde").datepicker(
	{
		onSelect:function()
		{
			des = $("#FechaProcesoDesde").val();
			date2History2(des);
		},
		changeYear: true,
		changeMonth: true,
		dateFormat: "yy-mm-dd",
	    showOn: "button",
		buttonImage: "/images/botonCalendario.png",
		buttonImageOnly: true,
		maxDate: '0D',
		minDate:'-3Y',
		buttonText :"Desde"
	});	
};

function date2History2(des){
	has = $("#FechaProcesoHasta").val("");
	$("#FechaProcesoHasta").datepicker("destroy");
	$('#ImgeCalendar2').css('display','none');
	$("#FechaProcesoHasta").datepicker({
		onSelect: function(){
			has = $("#FechaProcesoHasta").val();
		},
		changeYear: true,
		changeMonth: true,
		dateFormat: "yy-mm-dd",
		showOn: "button",
		buttonImage: "/images/botonCalendario.png",
		buttonImageOnly: true,
		maxDate: '0D',
		minDate:des,
		buttonText :'Hasta'
	});	
	
}