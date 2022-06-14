<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@include file="header.jsp" %>
<%@include file="footer.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>My Cart</title>
<style>
h3
{
	color: green;
	text-align: center;
}
</style>
</head>
<body>
<div style="color: white; text-align: center; font-size: 30px;">My Cart <i class='fas fa-cart-arrow-down'></i></div>
<%
String msg=request.getParameter("msg");
if("notpossible".equals(msg))
{
%>
<h3 class="alert">There is only one Quantity! So click on remove!</h3>
<%} %>
<%
if("inc".equals(msg))
{
%>
<h3 class="alert">Quantity  Increased Successfully!</h3>
<%} %>
<%
if("dec".equals(msg))
{
%>
<h3 class="alert">Quantity  Decreased Successfully!</h3>
<%} %>
<%
if("remove".equals(msg))
{
%>
<h3 class="alert">Product Successfully Removed!</h3>
<%} %>
<table>
<thead>
<%
int total=0;
int sno=0;
try{
	Connection conn=ConnectionProvider.getCon();
	Statement stmt=conn.createStatement();
	ResultSet rs1=stmt.executeQuery("select sum(total) from cart where email='"+email+"'and address is NULL");
	while(rs1.next())
	{
		total=rs1.getInt(1);
	}


%>

          <tr>
            <th scope="col" style="background-color: black;font-weight:bold;">Total: <i class="fa fa-inr"></i><%out.print(total); %> </th>
            
            <th scope="col"><a href="addressPaymentForOrder.jsp">Proceed to order</a></th> 
          </tr>
        </thead>
        <thead>
          <tr>
            <th scope="col">S.No</th>
            <th scope="col">STORE_ID</th>
            <th scope="col">VCD_ID</th>
            <th scope="col">VCD_NAME</th>
            <th scope="col">Language</th>
            <th scope="col">Category</th>
            <th scope="col">Rating</th>
            
            <th scope="col">Quantity</th>
            <th scope="col"><i class="fa fa-inr"></i> price</th>
            
            <th scope="col">Sub Total</th>
            <th scope="col">Remove <i class='fas fa-trash-alt'></i></th>
          </tr>
        </thead>
        <tbody>
      <%
      ResultSet rs=stmt.executeQuery("select * from vcddetails inner join cart on vcddetails.vcdid=cart.product_id and cart.email='"+email+"' and cart.address is NULL");
      while(rs.next())
      {
    	  
      
      %>
  <tr>
            <%sno=sno+1;%>
            <td><%out.println(sno); %></td>
            <td><%=rs.getString(1) %></td>
            <td><%=rs.getString(2) %></td>
            <td><%=rs.getString(3) %></td>
            <td><%=rs.getString(4) %></td>
            <td><%=rs.getString(5) %></td>
            <td><%=rs.getString(6) %></td>
            
            <td><a href="incDecQuantityAction.jsp?id=<%=rs.getString(2)%>&quantity=inc"><i class='fas fa-plus-circle'></i></a><%=rs.getString(12) %>  <a href="incDecQuantityAction.jsp?id=<%=rs.getString(2)%>&quantity=dec"><i class='fas fa-minus-circle'></i></a></td>
            <td><i class="fa fa-inr"></i><%=rs.getString(13) %></td>

            <td></i><%=rs.getString(14) %></td>
            
            <td><a href="removeFromCart.jsp?id=<%=rs.getString(2)%>">Remove <i class='fas fa-trash-alt'></i></a></td>


          </tr>
          <%
      }
}
catch(Exception e)
{
	
}
%>
        </tbody>
      </table>
      <br>
      <br>
      <br>

</body>
</html>