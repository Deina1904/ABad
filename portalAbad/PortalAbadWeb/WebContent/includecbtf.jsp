<%@ page errorPage="error_jsp.jsp"%>
<jsp:useBean id="datos" type="java.util.Hashtable" scope="request" />
<jsp:useBean id="urls" type="java.util.Hashtable" scope="request" />
<%
String valor;
char coma = ',';
%>
<%
response.setHeader("Pragma","No-Cache");
response.setDateHeader("Expires",0);
response.setHeader("Cache-Control","no-Cache");
%>
