<%@page import = "project.ConnectionProvider"%>
<%@page import = "java.sql.*"%>
<%@include file="adminHeader.jsp" %>
<%@include file="../footer.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home</title>
<style>
h3
{
	color: Green;
	text-align: center;
}

</style>
</head>
<body>
<div style="color: Black;font-family: 'Ubuntu';font-weight=bold; text-align: center; font-size: 30px;">All Product Details </div>
<%
   String msg=request.getParameter("msg");
if("done".equals(msg))
{
%>
<h3 class="alert">Product Successfully Updated!</h3>
<%} %>
<%
if("wrong".equals(msg))
{
%>

<h3 class="alert" Style="color:red;">Some thing went wrong! Try again!</h3> 
<%} %>

<%
if("delete".equals(msg))
{
%>
<h3 class="alert">Product Deleted</h3>
<%} %>
<table>
        <thead>
          <tr>
          	<th scope="col">Store ID</th>
            <th scope="col">VCD ID</th>
            <th scope="col">VCD Name</th>
            <th scope="col">Language</th>
            <th scope="col">Category</th>
            <th scope="col">Rating</th>
             <th scope="col">Quantity</th>
            
            <th scope="col"><i class="fa fa-inr"></i> Price</th>
            <th>Status</th>
            <th scope="col">Edit <i class='fas fa-pen-fancy'></i></th>
            <th scope="col">Delete <i class='fas fa-trash'></i></th>
            
          </tr>
        </thead>
        <tbody>
       <%
       try{
    	   Connection con=ConnectionProvider.getCon();
    	   Statement st=con.createStatement();
    	   ResultSet rs=st.executeQuery("select *from VCDDETAILS");
    	   while(rs.next())
    	   {
       %>
          <tr>
            <td><%=rs.getString(1) %></td>
            <td><%=rs.getString(2) %></td>
            <td><%=rs.getString(3) %></td>
            <td><%=rs.getString(4) %></td>
            <td><%=rs.getString(5) %></td>
            <td><%=rs.getString(6) %></td>
            <td><%=rs.getString(7) %></td>
            <td><i class="fa fa-inr"></i> </i><%=rs.getString(8) %></td>
            <td><%=rs.getString(9) %></td>
            <td><a href="editProduct.jsp?VCDID=<%=rs.getString(2) %>">Edit <i class='fas fa-pen-fancy'></i></a></td>
            <td><a href="deleteproduct.jsp?VCDID=<%=rs.getString(2)%>"> <i class='fas fa-trash'></i></a></td>
          </tr>
         <%
    	   }}
       catch(Exception e){
    	   System.out.println(e);
       }
         %>
        </tbody>
      </table>
      <br>
      <br>
      <br>

</body>
</html>