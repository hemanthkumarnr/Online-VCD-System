<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@include file="footer.jsp" %>
<html>
<head>
<link rel="stylesheet" href="css/bill.css">
<title>Bill</title>
</head>
<body>

<%
int sno=0;
int total=0;
String email=session.getAttribute("email").toString();
try{
	Connection con=ConnectionProvider.getCon();
    Statement st=con.createStatement();
	ResultSet rs1=st.executeQuery("select * from users where email='"+email+"'");
	while(rs1.next())
	{
		%>
		<h3>Online VCD System</h3>
		<hr>
		<div class="left-div"><h3>Name:<%=rs1.getString(1) %>  </h3></div>
		<div class="right-div-right"><h3>Email:<%=email %>  </h3></div>
		<div class="right-div"><h3>Mobile Number:<%=rs1.getString(3) %>  </h3></div>  

		<div class="right-div-right"><h3>City:<%=rs1.getString(8)%> </h3></div> 
		<div class="right-div"><h3>Address: <%=rs1.getString(7) %>  </h3></div> 
		
		<div class="left-div"><h3>State:<%=rs1.getString(9) %>  </h3></div>
		<div class="right-div-right"><h3>Country:<%=rs1.getString(10) %>  </h3></div>  
		<br><br>
		<table id="customers">
<h3>Product Details</h3>
  <tr>
    <th>S.No</th>
    <th>VCD Id</th>
    <th>Quantity</th>
    <th>Cost</th>
    <th>Sub Total</th>
  </tr>
		
		<%
  ResultSet rs2=st.executeQuery("select * from cart where email='"+email+"'   ");
  while(rs2.next())
  {
	  sno=sno+1;
  %>
  <tr>
    <td><%out.println(sno); %></td>
    <td><%=rs2.getString(2) %></td>
    <td><%=rs2.getString(3) %></td>
    <td><%=rs2.getString(4) %></td>
    <td><%=rs2.getString(5) %></td>
  </tr>
  <tr>
  <%} %>
  
  <br><br>
		<table id="customers">

  <!-- <tr>
    <th></th>
    <th></th>
    <th></th>
    <th></th>
    <th></th>
  </tr> -->
		
		<%
  ResultSet rs3=st.executeQuery("select  sum (total)  from cart where email='"+email+"'");
  while(rs3.next())
  {
	  total=rs3.getInt(1);
  %>
  <tr>
    <td></td>
    <td></td>
    <td></td>
    <td></td>
    <td>Sub Total:</td>
    <td><%out.println(total); %></td>
  </tr>
  <tr></tr>
  
		<%} %>
		
		
<br><br><br>	
		<%
  ResultSet rs4=st.executeQuery("select * from cart where email='"+email+"'  ");
  while(rs4.next())
  {
	  
  %>
  
  <tr>
<div class="left-div"><h3>Order Date: <%=rs4.getString(11) %></h3></div>
<div class="right-div-right"><h3>Payment Method: <%=rs4.getString(13) %>  </h3></div>
<div class="right-div"><h3>Expected Delivery: <%=rs4.getString(12) %> </h3></div> 

<div class="left-div"><h3>Transaction Id:  <%=rs4.getString(14) %></h3></div>
  </tr>
		<%} %>
		
	<tr>
<a href="continueShopping.jsp"><button class="button left-button">Continue Shopping</button></a>
<a onclick="window.print();"><button class="button right-button">Print</button></a>
<br><br><br><br>
		
		</tr>
		
		
		
		<hr>
	<%} 
}catch(Exception e)
{
	
}
	
	
	%>




</body>
</html>