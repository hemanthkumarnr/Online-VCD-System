<%@page import="java.util.Date" %>
<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@page import="java.text.SimpleDateFormat" %>


<%
String email=session.getAttribute("email").toString();
String address = request.getParameter("address");
String city = request.getParameter("city");
String state = request.getParameter("state");
String country = request.getParameter("country");
String mobileNumber = request.getParameter("mobileNumber");
String paymentMethod = request.getParameter("paymentMethod");
String transactionId = "";
transactionId =request.getParameter("transactionId");
String status = "bill";
String orderDate="27/05/2022";
String deliveryDate="03/06/2022";

Date today = new Date();
SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("dd-mm-yyyy");
String ddmmyyyyToday = DATE_FORMAT.format(today);

try
{
	Connection con=ConnectionProvider.getCon();
	PreparedStatement ps=con.prepareStatement("update users set address=?,city=?,state=?,country=?,mobileNumber=? where email=?");
	ps.setString(1,address);
	ps.setString(2,city);
	ps.setString(3,state);
	ps.setString(4,country);
	ps.setString(5,mobileNumber);
	ps.setString(6,email);
	ps.executeUpdate();
	
	PreparedStatement ps1=con.prepareStatement("update cart set address=?,city=?,state=?,country=?,mobileNumber=?,orderDate=?,deliveryDate=?,paymentMethod=?,transactionId=?,status=? where email=? and address is NULL");
	ps1.setString(1,address);
	ps1.setString(2,city);
	ps1.setString(3,state);
	ps1.setString(4,country);
	ps1.setString(5,mobileNumber);
	ps1.setString(6,orderDate);
	ps1.setString(7,deliveryDate);
	ps1.setString(8,paymentMethod);
	ps1.setString(9,transactionId);
	ps1.setString(10,status);
	ps1.setString(11,email);
	ps1.executeUpdate();
	response.sendRedirect("billnew.jsp");
}
catch(Exception e)
{
	System.out.println(e);
}

%>