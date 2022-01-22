<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<!DOCTYPE html>
<html>
<head>
<title>Login Page</title>
<!--Made with love by Mutiullah Samim -->

<!--Bootsrap 4 CDN-->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">

<!--Fontawesome CDN-->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.3.1/css/all.css"
	integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU"
	crossorigin="anonymous">

<!--Custom styles-->
<link rel="stylesheet" type="text/css" href="styles.css">
<style type="text/css">
/* Made with love by Mutiullah Samim*/
@import url('https://fonts.googleapis.com/css?family=Numans');

html, body {
	background-image: url('images/TT.jpg');
	background-size: cover;
	background-repeat: no-repeat;
	height: 100%;
	font-family: 'Numans', sans-serif;
}

.container {
	height: 100%;
	align-content: center;
}

.card {
	height: 370px;
	margin-top: auto;
	margin-bottom: auto;
	width: 400px;
	background-color: rgba(0, 0, 0, 0.5) !important;
}

.social_icon span {
	font-size: 60px;
	margin-left: 10px;
	color: #FFC312;
}

.social_icon span:hover {
	color: white;
	cursor: pointer;
}

.card-header h3 {
	color: white;
}

.social_icon {
	position: absolute;
	right: 20px;
	top: -45px;
}

.input-group-prepend span {
	width: 50px;
	background-color: #FFC312;
	color: black;
	border: 0 !important;
}

input:focus {
	outline: 0 0 0 0 !important;
	box-shadow: 0 0 0 0 !important;
}

.remember {
	color: white;
}

.remember input {
	width: 20px;
	height: 20px;
	margin-left: 15px;
	margin-right: 5px;
}

.login_btn {
	color: white;
	background-color: #7C4AB5;
	width: 100px;
}

.login_btn:hover {
	color: white;
	background-color: black;
}

.links {
	color: white;
}

.links a {
	margin-left: 4px;
}
</style>
</head>
<script type="text/javascript">
	$(document).ready(function() {
		var msg=document.getElementById("msg").value;
		if(msg!=null)
			{
			 if(msg==0)
				alert("Email incorrect merci de ressaier !!");
			}
			
	});
</script>
<body>
	<div class="container">
		<div class="d-flex justify-content-center h-100">
			<div class="card">
				<div class="card-header">
					<h3>Email</h3>
					<input type="hidden" id="msg" name="msg" value="<%=request.getParameter("msg") %>">
					<div class="d-flex justify-content-end social_icon">
						<span><i class="fab fa-facebook-square"
							style="color: white;"></i></span> <span><i
							class="fab fa-google-plus-square" style="color: white;"></i></span> <span><i
							class="fab fa-twitter-square" style="color: white;"></i></span>
					</div>
				</div>
				<div class="card-body">
					
						<div class="input-group form-group">
							<div class="input-group-prepend">
								<span class="input-group-text" style="background-color: #7C4AB5"><i
									class="fas fa-user" style="color: white;"></i></span>
							</div>
							<input type="text" required autofocus class="form-control"
								name="login" placeholder="Email">
						</div>
						<div class="form-group">
							<a href="Login.jsp"><input type="submit" value="Envoyer"
								class="btn float-right login_btn">
						</div></a>
					
				</div>
				<div class="card-footer">
					
					<div class="d-flex justify-content-center">
						<a href="Login.jsp">Retourner</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>