<%
   StringBuffer inputRedirect;  //almacena todos los tags <input> que se redireccionarán al aplicativo seleccionado
   String refBBVAeComm = ""; //almacena la Referencia de tipo de convenio de eCommerce

   inputRedirect = new StringBuffer();
   java.util.Enumeration paramNames = request.getParameterNames();
   while(paramNames.hasMoreElements()) {
      String paramName = (String)paramNames.nextElement();
      String[] paramValues = request.getParameterValues(paramName);
      if (!paramName.equalsIgnoreCase("proceso") & !paramName.equalsIgnoreCase("operacion") & !paramName.equalsIgnoreCase("accion") & !paramName.equalsIgnoreCase("RefBBVAeComm") & !paramName.equalsIgnoreCase("PIN")) {
         String paramValue = paramValues[0];
         inputRedirect.append( "<input type=\"hidden\" name=\"" + paramName + "\" style=\"visibility: hidden\" value=\"" + paramValues[0].trim() + "\">\n");
      }
      else if (paramName.equalsIgnoreCase("RefBBVAeComm") | paramName.equalsIgnoreCase("PIN")){
         refBBVAeComm= paramValues[0].trim().toString();
      }
   }
%>
