<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%
try{
	Connection con=ConnectionProvider.getCon();
	Statement st=con.createStatement();
	String q1="create table users(name varchar(100),email varchar(100)primary key,mobileNumber bigint,securityQuestion varchar(200),answer varchar(200),password varchar(100),address varchar(500),city varchar(100),state varchar(100),country varchar(100))";
	String q2="CREATE TABLE  STOREDETAILS(STOREID VARCHAR2(10),ADDRESS VARCHAR2(20), PHONENO VARCHAR2(10))";
	String q3="create table cart(email varchar(100),product_id int,quantity int,price int,total int,address varchar(500),city varchar(100),state varchar(100),country varchar(100),mobileNumber bigint,orderDate varchar(100),deliveryDate varchar(100),paymentMethod varchar(100),transactionId varchar(100),status varchar(10))";
	String q4="create table message(id int AUTO_INCREMENT,email varchar(100),subject varchar(200),body varchar(1000),PRIMARY KEY(id))";
	String q5="CREATE TABLE  VCDDETAILS(STOREID VARCHAR2(10),VCDID VARCHAR2(10),VCDNAME VARCHAR2(20),LANGUAGE VARCHAR2(20),CATEGORY VARCHAR2(20),RATING VARCHAR2(10),QUANTITY NUMBER,PRICE NUMBER,ACTIVE VARCHAR2(10)) ";

	System.out.print(q1);
	System.out.print(q2);
	System.out.print(q3);
	System.out.print(q4);
	//st.execute(q1);
	//st.execute(q2);
	//st.execute(q3);
	st.execute(q4);
	System.out.print("Table created");
	con.close();
}catch(Exception e){
	System.out.println(e);}
%>