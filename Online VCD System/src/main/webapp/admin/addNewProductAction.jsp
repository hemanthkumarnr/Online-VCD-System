<%@page import = "project.ConnectionProvider"%>
<%@page import = "java.sql.*"%>
<%
String STOREID=request.getParameter("Storeid");
String VCDID=request.getParameter("id");
String VCDNAME=request.getParameter("name");
String LANGUAGE=request.getParameter("language");
String CATEGORY=request.getParameter("category");
String RATING=request.getParameter("rating");
String QUANTITY=request.getParameter("quantity");
String COST=request.getParameter("cost");
String ACTIVE=request.getParameter("active");

try{
	Connection con=ConnectionProvider.getCon();
	PreparedStatement ps=con.prepareStatement("Insert into VCDDETAILS values(?,?,?,?,?,?,?,?,?)");
	ps.setString(1, STOREID);
    ps.setString(2, VCDID);
    ps.setString(3, VCDNAME);
    ps.setString(4, LANGUAGE);
    ps.setString(5, CATEGORY);
    ps.setString(6, RATING);
    ps.setString(7, QUANTITY);
    ps.setString(8, COST);
    ps.setString(9, ACTIVE);
	ps.executeUpdate();
	response.sendRedirect("addNewProduct.jsp?msg=done");
}catch(Exception e){
	response.sendRedirect("addNewProduct.jsp?msg=wrong");	
}
%>