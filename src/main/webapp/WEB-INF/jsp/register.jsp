<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>| Register </title>
<link href="css/bootstrap.css" rel='stylesheet' type='text/css' />
<link href="css/style.css" rel='stylesheet' type='text/css' />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800' rel='stylesheet' type='text/css'>
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<script src="js/jquery.min.js"></script>
<script type="text/javascript">
        $(document).ready(function() {
            $(".dropdown img.flag").addClass("flagvisibility");

            $(".dropdown dt a").click(function() {
                $(".dropdown dd ul").toggle();
            });
                        
            $(".dropdown dd ul li a").click(function() {
                var text = $(this).html();
                $(".dropdown dt a span").html(text);
                $(".dropdown dd ul").hide();
                $("#result").html("Selected value is: " + getSelectedValue("sample"));
            });
                        
            function getSelectedValue(id) {
                return $("#" + id).find("dt a span.value").html();
            }

            $(document).bind('click', function(e) {
                var $clicked = $(e.target);
                if (! $clicked.parents().hasClass("dropdown"))
                    $(".dropdown dd ul").hide();
            });


            $("#flagSwitcher").click(function() {
                $(".dropdown img.flag").toggleClass("flagvisibility");
            });
        });
     </script>
 </head>
<body>
<jsp:include page="nav.jsp"/>
     <div class="main">
      <div class="shop_top">
	     <div class="container">
						<form:form action="/register" method="post" modelAttribute="user"> 
								<div class="register-top-grid">
										<h3>INFORMATION PERSONNELLE</h3>
										<form:input type="hidden" value="ROLE_CLIENT" path="rol"/>
										<div>
											<span>Nom<label>*</label></span>
								      <form:input path="name" type="text" required="required"/> 
											
										</div>
										<div>
											<span>Prénom<label>*</label></span>
											<form:input path="lastName" type="text" required="required"/> 
										</div>
										<div>
											<span>E-mail<label>*</label></span>
											<form:input path="email" type="text" required="required"/> 
										</div>
										<div>
											<span>Numéro de téléphone<label>*</label></span>
								      <form:input path="mobile" type="text" required="required"/> 
											
										</div>
										<div>
											<span>Numéro de permis<label>*</label></span>
											<form:input path="numPermit" type="text" required="required"/> 
										</div>
										<div class="clear"> </div>
											<a class="news-letter" href="#">
												<label class="checkbox"><input type="checkbox" name="checkbox" checked=""><i> </i>S'abonner a la NEWSLETTER </label>
											</a>
										<div class="clear"> </div>
								</div>
								<div class="clear"> </div>
								<div class="register-bottom-grid">
										<h3>INFORMATIONS DE CONNEXION</h3>
										<div>
											<span>MOT DE PASSE<label>*</label></span>
											<form:input name="pass" id="password" path="pass" type="text" required="required"/> 
										</div>
										<div>
											<span>Confirmer mot de passe<label><output name="output"/>${passErr}*</label></span>
									
											<input name="password_confirm" required="required" type="password" id="password_confirm" oninput="check(this)" />
<script language='javascript' type='text/javascript'>
    function check(input) {
        if (input.value != document.getElementById('password').value) {
            input.setCustomValidity('Mot de passes non identiques');
        } else {
            // input is valid -- reset the error message
            input.setCustomValidity('');
        }
    }
                         </script>
										</div>
										<div class="clear"> </div>
								</div>
								<div class="clear"> </div>
								<input style="background-color:#DDD;font-family:'Open Sans', sans-serif'-webkit-appearance: none;-moz-appearance: none; appearance: none;" type="submit" value="S'inscrire">
					</form:form>
					</div>
		   </div>
	  </div>
	  
		 <jsp:include page="footer.jsp"/>

</body>	

</html>