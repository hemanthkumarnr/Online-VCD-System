<%@page import="project.ConnectionProvider"%>
<%@page import=" java.sql.*" %>
<%@include file="adminHeader.jsp" %>
<%@include file="../footer.jsp" %>
<html>
<head>
<link rel="stylesheet" href="../css/addNewProduct-style.css">
<title>Add New Product</title>
</head>
<body>
<%
String msg=request.getParameter("msg");

if("done".equals(msg))
{
%>
<h3 class="alert">VCD Store Added Successfully!</h3>
<%} %>

<%
if("wrong".equals(msg))
{
%>
<h3 class="alert">Some thing went wrong! Try Again!</h3>
<%} %>
<%
int id=1;
try{
	Connection con=ConnectionProvider.getCon();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select max(STOREID) from STOREDETAILS");
	while(rs.next())
	{
		id=rs.getInt(1);
		id=id+1;
	}
}
catch(Exception e){
	/* System.out.println(e); */
}
%>

<form action="addNewStoreAction.jsp" method="post">

<h3 style="color: #379ae7;">Store ID: <%out.println(id); %> </h3>

<input type="hidden" name="id" value="<%out.print(id); %>">

<div class="left-div">
<h3>Enter Address</h3>
 <input class="input-style" type="text" name="saddress" placeholder="Enter Store Address" required>
<hr>
</div>

<div class="right-div">
<h3>Enter Phone Number</h3>
 <input class="input-style" type="text" name="sphone" placeholder="Enter Store PhoneNumber" required>
<hr>
</div>


<br>
<br>
<button class="button" >Save</button>
 <!-- <input type="submit" class="button" value="Save"/> -->
</form>

<br><br><br>
</body>
</html>