<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@include file="header.jsp" %>
<%@include file="footer.jsp" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home</title>
</head>
<body>
<div style="color: white; text-align: center; font-size: 30px;">Home <i class="fa fa-institution"></i></div>
<table>
        <thead>
          <tr>
            <th scope="col">Store ID</th>
            <th scope="col">Store Address</th>
            
            <th scope="col">View <i class='fas fa-cart-eye'></i></th>
          </tr>
        </thead>
        <tbody>
<%
int z=0;
try{
	String search=request.getParameter("search");
	Connection con=ConnectionProvider.getCon();
	Statement st=con.createStatement();
	//ResultSet rs=st.executeQuery("select *from STOREDETAILS where name like '%"+search+"%' or category like '%"+search+"%' and active='Yes'");
	ResultSet rs=st.executeQuery("select *from STOREDETAILS where ADDRESS like '%"+search+"%'");
	while(rs.next())
	{
		z=1;
%>
          <tr>
            <td><%=rs.getString(1) %></td>
            <td><%=rs.getString(2) %></td>
          
           <span></span> <td><a href="home.jsp?STOREID=<%=rs.getString(1) %>">View <i class='fas fa-eye'></i></a></td> </span> 
          </tr>
<%
}
}
catch(Exception e){
	System.out.println(e);
	}%>
        </tbody>
      </table>
      	<%if(z==0){ %>
	<h1 style="color:white; text-align: center;">Nothing to show</h1>
	<%} %>
	
      <br>
      <br>
      <br>
      <div class="footer">
          <p>All right reserved by VCDs System</p>
      </div>

</body>
</html>