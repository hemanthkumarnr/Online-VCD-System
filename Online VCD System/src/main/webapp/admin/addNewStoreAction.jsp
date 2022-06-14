<%@page import="project.ConnectionProvider"%>
<%@page import=" java.sql.*" %>
<%
String STOREID=request.getParameter("id");
String ADDRESS=request.getParameter("saddress");
String PHONENO=request.getParameter("sphone");

try{
	Connection con=ConnectionProvider.getCon();
	PreparedStatement ps=con.prepareStatement("insert into STOREDETAILS values(?,?,?)");
	ps.setString(1,STOREID);
	ps.setString(2,ADDRESS);
	ps.setString(3,PHONENO);
	ps.executeUpdate();
	con.commit();
	response.sendRedirect("addNewStore.jsp?msg=done");
}

catch(Exception e)
{
	response.sendRedirect("addNewStore.jsp?msg=wrong");
}
%>