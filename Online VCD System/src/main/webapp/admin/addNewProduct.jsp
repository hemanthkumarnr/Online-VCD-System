<%@page import = "project.ConnectionProvider"%>
<%@page import = "java.sql.*"%>
<%@include file="adminHeader.jsp" %>
<%@include file="../footer.jsp" %>
<html>
<head>
<link rel="stylesheet" href="../css/addNewProduct-style.css">
<title>Add New VCD</title>
</head>
<body>
<%
String msg=request.getParameter("msg");
if("done".equals(msg))
{
%>
<h3 class="alert">VCD Added Successfully!</h3>
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
	ResultSet rs=st.executeQuery("select max(VCDID) from VCDDETAILS");
	while(rs.next()){
		id=rs.getInt(1);
		id=id+1;
	}
}catch(Exception e){
	
}
%>
<form action="addNewProductAction.jsp" method="post">
<h3 style="color: yellow;">VCD ID: <%out.println(id);%></h3>
<input type="hidden" name="id" value="<%out.print(id);%>">

<div class="left-div">
 <h3>Enter StoreID </h3>
<input class="input-style" type="text" name="Storeid" placeholder="Enter Store ID"  required>
<hr>
</div>

<div class="right-div">
 <h3>Enter VCD Name</h3>
<input class="input-style" type="text" name="name" placeholder="Enter VCD Name"  required>
<hr>
</div>

<div class="left-div">
<h3>VCD Language </h3>
<select class="input-style" name="language">
<option value="English">English</option>
<option value="Hindi">Hindi</option>
<option value="Regional Language">Regional Language</option>
</select>
<hr>
</div>

<div class="right-div">
<h3> VCD Category</h3>
<select class="input-style" name="category">
<option value="English">English</option>
<option value="Hindi">Hindi</option>
<option value="Regional">Regional</option>

</select>
<hr>
</div>

<div class="left-div">
<h3>VCD Rating</h3>
<select class="input-style" name="rating">
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
<input class="input-style" type="number" name="quantity" placeholder="Enter Quantity"  required>
<hr>
</div>


<div class="left-div">
<h3>Enter Cost</h3>
<input class="input-style" type="number" name="cost" placeholder="Enter Price"  required>
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
 <button class="button">Save <i class='far fa-arrow-alt-circle-right'></i></button>
</form>
</body>
<br><br><br>
</body>
</html>