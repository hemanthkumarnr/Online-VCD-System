<%@page import = "project.ConnectionProvider"%>
<%@page import = "java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/signup-style.css">
<title>ForgotPassword</title>
</head>
<body>
<div id='container'>
  <div class='signup'>
     <form action="forgotPasswordAction.jsp" method="post">
      <input type="email" name="email" placeholder="Enter Email" required>
     <input type="number" name="mobileNumber" placeholder="Enter Mobile Number" required>
     <select name="securityQuestion">
      <option value="What was you first car?">What was you first car?</option>
        <option value="What is your last name?">What is you last name?</option>
         <option value="What elementary school did you attend?">What elementary school did you attend?</option>
         <option value="What is the name of town where you were born?">What is the name of town where you were born?</option>
     </select>
      <input type="text" name="answer" placeholder="Enter Answer" required>
    <input type="password" name="newPassword" placeholder="Enter the new Password" required>
    <input type="submit" value="Save">
     </form>
      <h2><a href="login.jsp">Login</a></h2>
  </div>
  <div class='whyforgotPassword'>
   <%
   String msg=request.getParameter("msg");
   if("done".equals(msg)){
   %>
<h1>Password Changed Successfully!</h1>
<%} %>
<%
  if("invalid".equals(msg)){
%>
<h1>Some thing Went Wrong! Try Again !</h1>
<%} %>
   <h2>Online VCD System</h2>
    <p>The Online VCD System is a application where users can purchase VCDs online.</p>
  </div>
</div>
</body>
</html>