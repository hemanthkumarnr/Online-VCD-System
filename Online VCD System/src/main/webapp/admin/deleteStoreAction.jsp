<%@page import="project.ConnectionProvider"%>
<%@page import=" java.sql.*" %>
<%
String STOREID=request.getParameter("STOREID");

try{
	Connection con=ConnectionProvider.getCon();
	Statement st=con.createStatement();
	st.executeUpdate("delete from STOREDETAILS where STOREID='"+STOREID+"' ");
	
	con.commit();
	response.sendRedirect("allVCDStoreEdit.jsp?msg=delete");
}

catch(Exception e)
{
	System.out.println(e);
	response.sendRedirect("allVCDStoreEdit.jsp?msg=wrong");
}
%>