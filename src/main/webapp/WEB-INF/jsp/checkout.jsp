<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
         <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%> 
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
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
        function annulerReservation(idVehicule){
        	
        	$.ajax({
                type: "GET",
                url: "/cart/remove",
                data: { idVehicule : idVehicule },
                contentType: "application/json;charset=utf-8",
                dataType: "json",
                success: function (result) {
                    debugger;
                    location.reload();
                }
                ,
                error: function (response) {
                    debugger;
                    alert('error');
                }
            });
        }
     </script>
 </head>
<body>
 <jsp:include page="nav.jsp"/>
 	
     <div class="main">
      <div class="shop_top">
		<div class="container">
	
		<c:choose>
		<c:when test="${numReservation == 0}" >
			<h4 class="title">Vous n'avez Aucune Reservation</h4>
			<p class="cart">Veuillez visiter la page de reservation.<br>Cliquez<a href="/shop"> ici</a> pour faire des reservations.</p>
			</c:when>
			<c:otherwise>
			<h4 class="title">Vos Reservations :</h4>
			
			
			
							<c:forEach begin="0" end="${(numVehicules/4) }" var="row">
	               <div class="row shop_box-top">
						<c:forEach begin="${row*4}" end="${(row*4)+3 }" items="${vPage}" var="Vehicule">	
				<div class="col-md-3 shop_box"><a href="/single/${Vehicule.idVehicule}?dateD=${sessionScope.filter.dateD}&dateR=${sessionScope.filter.dateR}">
					<img src="${contextPath}/images/${Vehicule.imagePath}" class="img-responsive" alt="carPic"/>
					
					<div class="shop_desc">
						<h3><a href="#">${Vehicule.model}</a></h3>
						<p>${Vehicule.marque} </p>
						<span class="actual">${Vehicule.plj}</span><br>
						<ul class="buttons">
							<li class="cart"><a onClick="annulerReservation('${Vehicule.idVehicule}');">annuler Reservation id=${Vehicule.idVehicule}</a></li>
							
							<div class="clear"> </div>
					    </ul>
				    </div>
				</a></div>
			
				</c:forEach>
					</div>
					</c:forEach>
					
					
			</c:otherwise>
			</c:choose>
	
	     </div>
	   </div>
	  </div>
	  
	  <jsp:include page="footer.jsp"/>

</body>
</html>