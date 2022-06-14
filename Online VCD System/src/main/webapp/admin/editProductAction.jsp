<%@page import = "project.ConnectionProvider"%>
<%@page import = "java.sql.*"%>

<%
String STOREID=request.getParameter("Storeid");
String VCDID=request.getParameter("VCDID");
String VCDNAME=request.getParameter("name");
String LANGUAGE=request.getParameter("language");
String CATEGORY=request.getParameter("category");
String RATING=request.getParameter("rating");
String QUANTITY=request.getParameter("quantity");
String PRICE=request.getParameter("price");
String ACTIVE=request.getParameter("active");
try{
	Connection con=ConnectionProvider.getCon();
	Statement st=con.createStatement();
	st.executeUpdate("update VCDDETAILS set STOREID='"+STOREID+"',VCDNAME='"+VCDNAME+"',LANGUAGE='"+LANGUAGE+"',CATEGORY='"+CATEGORY+"',RATING='"+RATING+"',QUANTITY='"+QUANTITY+"',PRICE='"+PRICE+"',ACTIVE='"+ACTIVE+"'where VCDID='"+VCDID+"'");
	/* if(ACTIVE.equals("No")){
		st.executeUpdate("delete from cart where VCDID='"+VCDID+"' and address is NULL");
	} */
	response.sendRedirect("allProductEditProduct.jsp?msg=done");	
}catch(Exception e){
	response.sendRedirect("allProductEditProduct.jsp?msg=wrong");	
}
%>