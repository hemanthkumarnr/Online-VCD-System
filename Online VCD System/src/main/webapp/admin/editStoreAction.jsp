<%@page import="project.ConnectionProvider"%>
<%@page import=" java.sql.*" %>
<%
String STOREID=request.getParameter("STOREID");
String ADDRESS=request.getParameter("ADDRESS");
String PHONENO=request.getParameter("PHONENO");
/* System.out.println(STOREID+" "+ADDRESS+" "+PHONENO); */
try{
	Connection con=ConnectionProvider.getCon();
	Statement st=con.createStatement();
	st.executeUpdate("update STOREDETAILS set ADDRESS='"+ADDRESS+"',PHONENO='"+PHONENO+"' where STOREID='"+STOREID+"' ");

	con.commit();
	response.sendRedirect("allVCDStoreEdit.jsp?msg=done");
}

catch(Exception e)
{
	System.out.println(e);
	response.sendRedirect("allVCDStoreEdit.jsp?msg=wrong");
}
%>