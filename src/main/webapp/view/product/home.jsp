<%@ page language="java" contentType="text/html; charset=UTF-8"
      pageEncoding="UTF-8"%>
<%@ page import="com.springspartans.shopkart.model.Product" %>      
<%@ page import="com.springspartans.shopkart.model.Customer" %>      
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ShopKart | Product Home</title>
    <link rel="stylesheet" href="../../css/home.css"/>
    <link rel="stylesheet" href="../../css/colorScheme.css" />
</head>
<body>
    <%@ include file="../../templates/header.jsp" %>

    <div style="margin-top: 100px">
    	<% if (customer != null) { %>
    		<div class="welcome-msg">Hello <span style="color : var(--high-text-button)"><%= customer.getName() %></span>, welcome to our E-commerce website!</div>
  		<% } %>
	    <div class="big-banner">
	        <div class="banner-images">
	            <img src="../../images/banners/banner1.jpg" alt="Banner 1" />
	            <img src="../../images/banners/banner2.jpg" alt="Banner 2" />
	            <img src="../../images/banners/banner3.jpg" alt="Banner 3" />
	            <img src="../../images/banners/banner4.jpg" alt="Banner 4" />
	        </div>
    	</div>
	
	    <div class="collection">
	      <% String category = (String)request.getAttribute("category"); %>
	      <% if (category != null && !category.equals("All")) { %>
	      	<div class="msg">Shop for <%= category %></div>
	      <% } else { %>
	      	<div class="msg">Our Products</div>
	      <% } %>
	    </div>
	    
	    <% List<Product> productList = (List<Product>)request.getAttribute("productList"); %>
	    <% if (productList == null || productList.size() == 0) { %>
	    	<div class="error">
	    		<h2>Looks like we haven't got anything for you right now!</h2>
	    		<h2>Try removing the search filters if any or please visit us later</h2>
	    	</div>
	    <% } else { %>
	    	<div class="grid-container">
		      <% for (Product product : productList) { %>
			      <div class="grid-element">
			        <a href="/product/<%= product.getId() %>">
			          <img
			            src="../../images/product/<%= product.getImage() %>"
			            alt=<%= product.getImage() %>
			          />
			        </a>
			        <p class="details1-product"><b><%= product.getName() %></b></p>
			        <p class="details2-product">₹<%= product.getPrice() %></p>
			      </div>
		      <% } %>
	    </div>
	    <% } %>	    
    </div>
	<%@ include file="../../templates/footer.jsp" %>
  </body>
</html>