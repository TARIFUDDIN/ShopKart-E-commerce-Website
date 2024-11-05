<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<title>ShopKart | Error 400</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/error.css" />
</head>
<body>
	<div class="error-no">Error 400!</div>
	<div class="error-name">Page Bad Request</div>
	<div class="error-msg">
		<p><b>Oops!</b> It seems there was an issue with your request. The server could not understand what you were trying to do. This might be due to a malformed request or invalid parameters.</p>
		
		<p>Double-check the URL for any typos. Ensure that all required fields are filled out correctly. If you were trying to upload a file, make sure it meets the necessary requirements. If the problem persists, feel free to contact our support team for assistance!</p>
	</div>
	<button class="go-back" onclick="window.location.href='/product'">
		Back to Product Catalog
	</button>
</body>
</html>