<%@ page import="java.util.*" %>
<%@ page import="Util.*" %>
<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Search</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link
            href="https://fonts.googleapis.com/css2?family=Lobster&family=Roboto:wght@300&display=swap"
            rel="stylesheet">
    <link rel="stylesheet" href="index.css">
    <script src="https://kit.fontawesome.com/3204349982.js"
            crossorigin="anonymous"></script>

    <style>
    	@font-face {
		    font-family: 'Lobster';
		    src: url("Lobster 1.4.otf");
		}
		body {
		    color: #7F7F7F;
		    font-size: 12px;
		    font-family: 'Roboto', sans-serif;
		    margin: 0% 0%;
		}
		.navigationBar {
		    display: flex;
		    justify-content: center;
		    border-bottom: 1px solid lightgray;
		}
		#logo {
		    color: rgb(100, 0, 100);
		    font-family: Lobster, "sans-serif";
		    font-size: 2.8em;
		    position: absolute;
		    top: 1px;
		    left: 2%;
		}
		.navigation {
		    list-style-type: none;
		    display: flex;
		    position: absolute;
		    top: 0%;
		    right: 5%;
		}
		.navigation .upRight-corner {
		    
		    text-decoration: none;
		    color: gray;
		    font-size: 1.2em;
		    font-family: Roboto, sans-serif;
		}
		img {
			border-radius: 10px;
		    object-fit: cover;
		    width: 160px;
		    height: 160px;
		    display: block;
		    margin-top: 10px;
		    
		}
		.search {
			margin-top: 5%;
		    margin-left: 100px;
		    padding: 20px 15px;
		    display: flex;
		}
		#searchButton button {
		    background: rgb(30, 32, 23);
		    color: white;
		    font-size: 20px;
		    cursor: pointer;
		    border-radius: 5px;
		    width: 40px;
		    height: 35px;
		    position: absolute;
		    left: 25%;
		}
		#searchField {
		    align-items: center;
		    display: flex;
		    height: 35px;
		    width: 3.5%;
		}
		#cityName{
			width: 450%;
		    color: gray;
		
		}
		#searchButton button:hover {
		    background: rgb(171, 51, 43);
		}
		form.example::after {
		    content: "";
		    clear: both;
		    display: table;
		}
		#header {
		    background: rgb(247, 190, 195);
		    text-align: center;
		    height: 80px;
		    line-height: 80px;
		    font-family: Roboto, sans-serif;
		    font-size: 1.1em;
		}
		#searching {
		    width: 85%;
		    margin-left: auto;
		    margin-right: auto;
		    font-family: Times;
		    font-size: 120%;
		}
		.section {
		    display: flex;
		    padding-bottom: 25px;
		    padding-left: 5%;
		}
		.section .texts {
		    padding-top: 20px;
		    padding-left: 20px;
		    margin-top: 20px;
		}
		::placeholder {
			font-family: Times;
		}
	</style>
</head>

<body onunload="window.location='logout.jsp'">
	<!-- TODO -->
	<nav class="navigationBar">
	    <div>
	        <a href="search.jsp" id="logo">City Info In Los Angeles County Region</a >
	    </div>
	    <ul class="navigation">
	        <li>
	            <a href="search.jsp" id="logo" class="upRight-corner">Home</a >
	        </li>
	    </ul>
	</nav>

	<form action="MySearchDispatcher" method="GET">
	    <div class="search">
	        <div id="searchField">
	            <div id="search-bar">
	            	<input type="text" name="cityName" id="cityName" placeholder="Enters name to search" required>
	            </div>
	        </div>
	        <div id="searchButton">
	            <button type="submit"><i class="fa fa-search"></i></button>
	        </div>
	    </div>
	</form>
	
	<div id="searching">
		<%
			List<City> validCities = (List<City>) request.getSession().getAttribute("searchResult");
		%>
		<% //if (session.getAttribute("fileRead") == null || CityInfoParser.records.size() == 0) { 
			//session.setAttribute("resultSize", 0);
			//session.setAttribute("searchBy", null);
		  //} %>
	    <h1> <%= request.getSession().getAttribute("resultSize") %> Results for "<%= request.getSession().getAttribute("searchBy") %>" </h1>
	  
	    <% if (validCities != null) { %>
	    	<hr>
	    	<%
	    		for(int num = 0; num < validCities.size(); num ++) {
	        		City c = validCities.get(num);
	        		String cityName = c.getName();%>
	        		<div class="section">
	           		<div class="texts">
	               	<a style="font-size:120%;" href="details.jsp?businessName=<%= c.getName() %>">
	               	<%= c.getName() %></a >
	               	<p>Total Population: <%= c.getPop()%></p>
	               	<p>Per Capita Income: <%= c.getPcInc()%></p>
	               	<p>Total Number of Household: <%= c.getHousehold()%></p>
	             	<br>
	           		</div>
	       			</div>
	   		<hr>
	      	<% } session.removeAttribute("searchBy"); session.removeAttribute("resultSize"); session.removeAttribute("searchResult");%>
	      	<% }%>
	    
	</div>

</body>
</html>