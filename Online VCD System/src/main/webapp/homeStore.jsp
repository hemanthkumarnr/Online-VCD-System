<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@include file="header.jsp" %>
<%@include file="footer.jsp" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home</title>
<style>
h3
{
	color: yellow;
	text-align: center;
}
</style>
</head>
<body>
<div style="color: white; text-align: center; font-size: 30px;">Home <i class="fa fa-institution"></i></div>
<%
String msg=request.getParameter("msg");
if("added".equals(msg))
{
%>
<h3 class="alert">VCD added successfully!</h3>
<%} %>
<%
if("exist".equals(msg))
{
%>
<h3 class="alert">VCD already exist in you cart! Quantity  increased!</h3>
<%}%>
<%
if("invalid".equals(msg))
{
%>
<h3 class="alert">Something went wrong! Try Again!!!</h3>
<%} %>
<table>
        <thead>
          <tr>
            <th scope="col">StoreID</th>
            <th scope="col">Store Address</th>
           
            <th scope="col">View VCD's <i class='fas fa-plus'></i></th>
          </tr>
        </thead>
        <tbody>
<%
try{
	Connection con=ConnectionProvider.getCon();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select * from STOREDETAILS");
	while(rs.next())
	{
%>
          <tr>
            <td><%=rs.getString(1) %></td>
            <td><%=rs.getString(2) %></td>
          
            <td><a href="home.jsp?STOREID=<%=rs.getString(1) %>">View <i class='fas fa-cart-eye' ></i></a></td>
          </tr>
<%
}
}
catch(Exception e){
	System.out.println(e);
	}%>
        </tbody>
      </table>
      <br>
      <br>
      <br>

</body>
</html>