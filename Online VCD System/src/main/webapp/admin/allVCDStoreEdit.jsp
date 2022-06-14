<%@page import="project.ConnectionProvider"%>
<%@page import=" java.sql.*" %>
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
	color: green;
	text-align: center;
}
span{
color:red;
text-align:center;
}
</style>
</head>
<body>
<div style="color: Black;font-family: 'Ubuntu';font-weight=bold; text-align: center; font-size: 30px;">All VCD Store Details </div>
<br>
<%
String msg=request.getParameter("msg");
if("done".equals(msg))
{
%>
<h3 class="alert">VCD Store Successfully Updated!</h3>
<%} %>

<%
if("wrong".equals(msg))
{
%>
<h3 class="alert" ><span>Some thing went wrong! Try again!</span></h3>
<%} %>

<%
if("delete".equals(msg))
{
%>
<h3 class="alert">Store Deleted Successfully</h3>
<%} %>
<table>
        <thead>
          <tr>
            <th scope="col">StoreID</th>
            <th scope="col">Store Address</th>
            <th scope="col">Phone Number</th>
             <th scope="col">Edit</th>
             <th scope="col">Delete</th>
          </tr>
        </thead>
        <tbody>
       <%
       try{
    	   Connection con=ConnectionProvider.getCon();
    	   Statement st=con.createStatement();
    	   ResultSet rs= st.executeQuery("select * from STOREDETAILS");
    	   while(rs.next())
    	   {
       %>
          <tr>
            <td><%=rs.getString(1) %></td>
            <td><%=rs.getString(2) %></td>
            <td><%=rs.getString(3) %></td>
            
            <td><a href="editStore.jsp?STOREID=<%=rs.getString(1)%>"><i class='fas fa-pen-fancy'></i></a></td>
            <td><a href="deleteStoreAction.jsp?STOREID=<%=rs.getString(1)%>"> <i class='fas fa-trash'></i></a></td>
          </tr>
         <%
    	   }
         }
         
         catch(Exception e)
       {
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