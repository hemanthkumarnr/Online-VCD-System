<%@page import="project.ConnectionProvider"%>
<%@page import=" java.sql.*" %>
<%@include file="adminHeader.jsp" %>
<%@include file="../footer.jsp" %>
<html>
<head>
<link rel="stylesheet" href="../css/addNewProduct-style.css">
<title>Edit Store Details</title>
<style>
.back
{
  color: back;
  margin-left: 2.5%
}
</style>
</head>
<body>
<br>
<br>
<%
String STOREID=request.getParameter("STOREID");
try{
	Connection con=ConnectionProvider.getCon();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("Select * from STOREDETAILS where STOREID='"+STOREID+"'");
	while(rs.next())
	{
		
	
%>

<form action="editStoreAction.jsp" method="post">
<input type="hidden" name="STOREID" value="<% out.print(STOREID); %>">
<div class="left-div">
 <h3>Enter Address</h3>
<input class="input-style" type="text" name="ADDRESS" value="<%=rs.getString(2)%>"required> 
<hr>
</div>

<div class="right-div">
<h3>Enter Phone Number</h3>
<input class="input-style" type="text" name="PHONENO" value="<%=rs.getString(3)%>"required>
<hr>
</div>
<button class="button" >Save</button>
<!-- <input type="submit" class="button" value="Save"> -->
</form>
<h2><a class="back" href="allVCDStoreEdit.jsp"><i class='fas fa-arrow-circle-left'> Back</i></a></h2>
 <%
}
}
catch(Exception e)
{
	System.out.println(e);
}

%> 

<br><br><br>
</body>
</html>