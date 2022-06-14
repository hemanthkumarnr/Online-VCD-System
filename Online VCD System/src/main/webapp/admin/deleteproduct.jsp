<%@page import="project.ConnectionProvider"%>
<%@page import=" java.sql.*" %>
<%
String VCDID=request.getParameter("VCDID");

try{
	Connection con=ConnectionProvider.getCon();
	Statement st=con.createStatement();
	st.executeUpdate("delete from VCDDETAILS where VCDID='"+VCDID+"' ");
	
	con.commit();
	response.sendRedirect("allProductEditProduct.jsp?msg=delete");
}

catch(Exception e)
{
	System.out.println(e);
	response.sendRedirect("allProductEditProduct.jsp?msg=wrong");
}
%>