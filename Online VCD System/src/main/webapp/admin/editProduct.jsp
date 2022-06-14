<%@page import = "project.ConnectionProvider"%>
<%@page import = "java.sql.*"%>
<%@include file="adminHeader.jsp" %>
<%@include file="../footer.jsp" %>
<html>
<head>
<link rel="stylesheet" href="../css/addNewProduct-style.css">
<title>Edit New Product</title>
<style>
.back
{
  color: white;
  margin-left: 2.5%
}
</style>
</head>
<body>
 <h2><a class="back" href="allProductEditProduct.jsp"><i class='fas fa-arrow-circle-left'> Back</i></a></h2>
<%
String VCDID=request.getParameter("VCDID");
try{
	Connection con=ConnectionProvider.getCon();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select * from VCDDETAILS where VCDID='"+VCDID+"'");
	while(rs.next())
	{

%>
<form action="editProductAction.jsp" method="post">
<input type="hidden" name="VCDID" value="<% out.print(VCDID);%>">

<div class="left-div">
 <h3>Enter StoreID </h3>
<input class="input-style" type="text" name="Storeid" value="<%=rs.getString(1) %> "  required>
<hr>
</div>

<div class="right-div">
 <h3>Enter VCD Name</h3>
<input class="input-style" type="text" name="name" value="<%=rs.getString(3) %>" required>
<hr>
</div>

<div class="left-div">
<h3>VCD Language </h3>
<select class="input-style" name="language"  required>
<option value="English">English</option>
<option value="Hindi">Hindi</option>
<option value="Regional Language">Regional Language</option>
</select>
<hr>
</div>

<div class="right-div">
<h3>Enter Category</h3>
 <select class="input-style" name="category" required>
<option value="English">English</option>
<option value="Hindi">Hindi</option>
<option value="Regional">Regional</option>
</select>
<hr>
</div>

<div class="left-div">
<h3>VCD Rating</h3>
<select class="input-style" name="rating"  required>
<option value="5 Star">5 Star</option>
<option value="4 Star">4 Star</option>
<option value="3 Star">3 Star</option>
<option value="2 Star">2 Star</option>
<option value="1 Star">1 Star</option>
</select>   
<hr>
</div>


<div class="right-div">
<h3>Enter Quantity</h3>
<input class="input-style" type="number" name="quantity" value="<%=rs.getString(7) %>" required>
<hr>
</div>

<div class="left-div">
<h3>Enter Price</h3>
  <input class="input-style" type="number" name="price" value="<%=rs.getString(8) %>" required>
<hr>
</div>

<div class="right-div">
<h3>Active</h3>
<select class="input-style" name="active">
<option value="Yes">Yes</option>
<option value="No">No</option>
</select>
 <hr>
</div>
 <button class="button" type="submit">Save<i class='far fa-arrow-alt-circle-right'></i></button>
</form>
<h2><a class="back" href="allProductEditProduct.jsp"><i class='fas fa-arrow-circle-left'> Back</i></a></h2>
<%
}
}catch(Exception e){
	System.out.println(e);
}
%>

</body>
<br><br><br>
</body>
</html>