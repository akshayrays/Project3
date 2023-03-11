<%@page import="in.co.rays.project_3.controller.UserRegistrationCtl"%>
<%@page import="in.co.rays.project_3.util.ServletUtility"%>
<%@page import="in.co.rays.project_3.controller.LoginCtl"%>
<%@page import="in.co.rays.project_3.util.DataUtility"%>
<%@page import="in.co.rays.project_3.controller.ORSView"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login view</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>


<style type="text/css">
.log1 {
	padding-top: 5%;
}

.input-group-addon {
	box-shadow: 9px 8px 7px #001a33;
}

.grad {
	background-image: linear-gradient(to bottom right, skyBlue, black);
	background-size: cover;
	background-repeat: no-repeat;
}

i.css {
	border: 2px solid #8080803b;
	padding-left: 10px;
	padding-bottom: 11px;
	background-color: #ebebe0;
}

.p4 {
	background-image: url('<%=ORSView.APP_CONTEXT%>/img/wallp.jpg');
	/* / background-size: 1380px 610px; / */
	background-repeat: no-repeat;
	background-attachment: fixed;
	background-size: cover;
	padding-top: 80px;
	/* background-position: center top; */
}
</style>
</head>
<body class="p4">
	<div>
		<%@include file="Header.jsp"%>
	</div>
	<div>

		<main>
		<form action="<%=ORSView.LOGIN_CTL%>" method="post">

			<div class="row log1">
				<!-- Grid column -->
				
<!-- .col-*-* class- add desired no. of columns, * responsive size, a number -->
<!-- Bootstrap's grid system allows up to 12 columns across the page. If you do not want to use all 12 column individually, you can group the columns together to create wider columns -->

				<div class="col-md-4 "></div>
				<div class="col-md-4">
					<div class="card input-group-addon grad	">
						<div class="card-body">
						
<!-- A basic card is created with the .card class, and content inside the card has a .card-body class -->

							<h3 class="text-center text-dark">Login</h3>
							<!--Body-->
							<div>

								<jsp:useBean id="dto" class="in.co.rays.project_3.dto.UserDTO"
									scope="request"></jsp:useBean>
								<H4 align="center">
									<%
										if (!ServletUtility.getSuccessMessage(request).equals("")) {
									%>
									<div class="alert alert-success alert-dismissible">
										<button type="button" class="close" data-dismiss="alert">&times;</button>
										<%=ServletUtility.getSuccessMessage(request)%>
									</div>
										<!-- alert class-Creates an alert message box -->
							<!-- alert-dismissible-Together with the .close class, this class is used to close the alert -->
									<%
										}
									%>
								</H4>

								<H4 align="center">
									<%
										if (!ServletUtility.getErrorMessage(request).equals("")) {
									%>
									<div class="alert alert-danger alert-dismissible">
										<button type="button" class="close" data-dismiss="alert">&times;</button>
										<%=ServletUtility.getErrorMessage(request)%>
									</div>
					<!-- alert-danger class-Red alert box. Indicates a dangerous or potentially negative action -->
									<%
										}
									%>

								</H4>
								<%
									String uri = (String) request.getAttribute("uri");
								%>


								<input type="hidden" name="id" value="<%=dto.getId()%>">
								<input type="hidden" name="createdBy"
									value="<%=dto.getCreatedBy()%>"> <input type="hidden"
									name="modifiedBy" value="<%=dto.getModifiedBy()%>"> <input
									type="hidden" name="createdDatetime"
									value="<%=DataUtility.getTimestamp(dto.getCreatedDatetime())%>">
								<input type="hidden" name="modifiedDatetime"
									value="<%=DataUtility.getTimestamp(dto.getModifiedDatetime())%>">
							</div>

							<span class="pl-sm-5"><b>Email Id</b> <span
								style="color: red;">*</span></span> </br>

							<div class="col-sm-12">
								<div class="input-group"> <!-- input group-adding text or buttons on either side of textual inputs -->
									<div class="input-group-prepend"> <!-- prepend-add groups to the front of the input -->
										<div class="input-group-text"> 
											<i class="fa fa-envelope grey-text" style="font-size: 1rem;"></i>
									
										<!-- text- style the text that is displayed inside the group mtlb icons -->
										<!-- you are required to use inline HTML elements which include either <i> or <span> tags. -->
										
										</div>
									</div>
									<input type="text" class="form-control input-group-addon"
										name="login" placeholder="Enter Email-ID"
										value="<%=DataUtility.getStringData(dto.getLogin())%>">
								</div> <!-- form control se width 100% -->
								
							</div>

							<font color="red" class="pl-sm-5"> <%=ServletUtility.getErrorMessage("login", request)%></font></br>

							<span class="pl-sm-5"><b>Password</b> <span
								style="color: red;">*</span></span> </br>
							<div class="col-sm-12">
								<div class="input-group">
									<div class="input-group-prepend">
										<div class="input-group-text">
											<i class="fa fa-lock grey-text" style="font-size: 1rem;"></i>
										</div>
									</div>
									<input type="password" id="myInput"
										class="form-control input-group-addon" name="password"
										placeholder="Enter Password"
										value="<%=DataUtility.getStringData(dto.getPassword())%>">


								</div>


							</div>
							<font color="red" class="pl-sm-5"> <%=ServletUtility.getErrorMessage("password", request)%></font></br>
							</br>


							<div class="text-center">

								<input type="submit" name="operation"
									class="btn btn-success btn-md  hover-overlayed"
									style="font-size: 17px" value="<%=LoginCtl.OP_SIGN_IN%>">
									
				<!-- btn class-Creates a basic button (gray background and rounded corners) -->

								<input type="submit" name="operation"
									class="btn btn-primary btn-md" style="font-size: 17px"
									value="<%=UserRegistrationCtl.OP_SIGN_UP%>">
							</div>
							<div class="text-center">
								<a href="<%=ORSView.FORGET_PASSWORD_CTL%>"
									style="color: black; font-size: 15px;"><b>Forget my
										password ?</b></a>
							</div>
							<input type="hidden" name="uri" value="<%=uri%>">
						</div>
					</div>
				</div>
				<div class="col-md-4 mb-4"></div>
			</div>

		</form>
		</main>


	</div>

</body>
<%@include file="FooterView.jsp"%>
</html>