<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Free Snow Bootstrap Website Template | Single :: w3layouts</title>
<link href="${contextPath}/css/bootstrap.css" rel='stylesheet' type='text/css' />
<link href="${contextPath}/css/style.css" rel='stylesheet' type='text/css' />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800' rel='stylesheet' type='text/css'>
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<script src="${contextPath}/js/jquery.min.js"></script>
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
     <!----details-product-slider--->
				<!-- Include the Etalage files -->
					<link rel="stylesheet" href="${contextPath}/css/etalage.css">
					<script src="${contextPath}/js/jquery.etalage.min.js"></script>
				<!-- Include the Etalage files -->
				<script>
						jQuery(document).ready(function($){
			
							$('#etalage').etalage({
								thumb_image_width: 300,
								thumb_image_height: 400,
								
								show_hint: true,
								click_callback: function(image_anchor, instance_id){
									alert('Callback example:\nYou clicked on an image with the anchor: "'+image_anchor+'"\n(in Etalage instance: "'+instance_id+'")');
								}
							});
							// This is for the dropdown list example:
							$('.dropdownlist').change(function(){
								etalage_show( $(this).find('option:selected').attr('class') );
							});

					});
				</script>
				<!----//details-product-slider--->	
</head>
<body>
	<jsp:include page="nav.jsp"/>
     <div class="main">
      <div class="shop_top">
		<div class="container">
			<div class="row">
				<div class="col-md-9 single_left">
				   <div class="single_image">
					     <ul id="etalage">
							<li>
								<a href="optionallink.html">
									<img class="etalage_thumb_image" src="${contextPath}/images/board2.png" />
									<img class="etalage_source_image" src="${contextPath}/images/board2.png" />
								</a>
							</li>
							<li>
								<img class="etalage_thumb_image" src="${contextPath}/images/board1.png" />
								<img class="etalage_source_image" src="${contextPath}/images/board1.png" />
							</li>
							<li>
								<img class="etalage_thumb_image" src="${contextPath}/images/board3.png" />
								<img class="etalage_source_image" src="${contextPath}/images/board3.png" />
							</li>
							<li>
								<img class="etalage_thumb_image" src="${contextPath}/images/board5.png" />
								<img class="etalage_source_image" src="${contextPath}/images/board5.png" />
							</li>
							<li>
								<img class="etalage_thumb_image" src="${contextPath}/images/board4.png" />
								<img class="etalage_source_image" src="${contextPath}/images/board4.png" />
							</li>
							<li>
								<img class="etalage_thumb_image" src="${contextPath}/images/board3.png" />
								<img class="etalage_source_image" src="${contextPath}/images/board3.png" />
							</li>
							<li>
								<img class="etalage_thumb_image" src="${contextPath}/images/board3.png" />
								<img class="etalage_source_image" src="${contextPath}/images/9.jpg" />
							</li>
						</ul>
					    </div>
				        <!-- end product_slider -->
				        <div class="single_right">
				        	<h3>${vehicule.model}</h3>
				        	<p class="m_10">Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse</p>
				        	<ul class="options">
								<h4 class="m_12">Select a Size(cm)</h4>
								<li><a href="#">151</a></li>
								<li><a href="#">148</a></li>
								<li><a href="#">156</a></li>
								<li><a href="#">145</a></li>
								<li><a href="#">162(w)</a></li>
								<li><a href="#">163</a></li>
							</ul>
				        	<ul class="product-colors">
								<h3>available Colors</h3>
								<li><a class="color1" href="#"><span> </span></a></li>
								<li><a class="color2" href="#"><span> </span></a></li>
								<li><a class="color3" href="#"><span> </span></a></li>
								<li><a class="color4" href="#"><span> </span></a></li>
								<li><a class="color5" href="#"><span> </span></a></li>
								<li><a class="color6" href="#"><span> </span></a></li>
								<div class="clear"> </div>
							</ul>
							<div class="btn_form">
							   <form>
								 <input type="submit" value="buy now" title="">
							  </form>
							</div>
							<ul class="add-to-links">
    			              <li><img src="${contextPath}/images/wish.png" alt=""><a href="#">Add to wishlist</a></li>
    			            </ul>
							<div class="social_buttons">
								<h4>95 Items</h4>
								<button type="button" class="btn1 btn1-default1 btn1-twitter" onclick="">
					              <i class="icon-twitter"></i> Tweet
					            </button>
					            <button type="button" class="btn1 btn1-default1 btn1-facebook" onclick="">
					              <i class="icon-facebook"></i> Share
					            </button>
					             <button type="button" class="btn1 btn1-default1 btn1-google" onclick="">
					              <i class="icon-google"></i> Google+
					            </button>
					            <button type="button" class="btn1 btn1-default1 btn1-pinterest" onclick="">
					              <i class="icon-pinterest"></i> Pinterest
					            </button>
					        </div>
				        </div>
				        <div class="clear"> </div>
				</div>
				
				<div class="col-md-3">
				  <div class="box-info-product">
				 
				 
				  <form:form  action="/single/${vehicule.idVehicule}/reserver" method="post" modelAttribute="reservation" onInput="out.value=(select.value*${vehicule.plj})+'DZD'">
					<p class="price2"><output name="out" for="numDays">${vehicule.plj}DZD</output></p>
					       <ul class="prosuct-qty">
					       
								<span>nombre de jours:</span>
								
								<form:select path="numDays" name="select" id="select" >
								<option selected="selected" value="1">1</option>
								<c:forEach begin="2" end="30" var="numDays">
									<option value="${numDays}">${numDays}</option>
									</c:forEach>
								</form:select>
								
								
								<span>Date de Debut: <strong> ${sessionScope.reservation.dateD}</strong> </span>
								<span>Date de Fin: <strong> ${sessionScope.reservation.dateR}</strong> </span>
								
							</ul>
							<button type="submit" name="Submit" class="exclusive">
							   <span>reserver</span>
							</button>
							</form:form>
				   </div>
			   </div>
			</div>		
			<div class="desc">
			   	<h4>Description</h4>
			   	<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum. Typi non habent claritatem insitam; est usus legentis in iis qui facit eorum claritatem. Investigationes demonstraverunt lectores</p>
			</div>
			<div class="row">
				<h4 class="m_11">Related Products in the same Category</h4>
				<div class="col-md-4 product1">
					<img src="${contextPath}/images/${vehicule.imagePath}" class="img-responsive" alt=""/> 
					<div class="shop_desc"><a href="single.html">
						</a><h3><a href="single.html"></a><a href="#">${vehicule.model}</a></h3>
						<p>Lorem ipsum consectetuer adipiscing </p>
						<span class="reducedfrom">${vehicule.plj}DZD</span>
						<span class="actual">$12.00</span><br>
						<ul class="buttons">
							<li class="cart"><a href="#">Add To Cart</a></li>
							<li class="shop_btn"><a href="#">Read More</a></li>
							<div class="clear"> </div>
					    </ul>
				    </div>
				</div>
				<div class="col-md-4 product1">
					<img src="${contextPath}/images/${vehicule.imagePath}" class="img-responsive" alt=""/> 
					<div class="shop_desc"><a href="single.html">
						</a><h3><a href="single.html"></a><a href="#">${vehicule.model}</a></h3>
						<p>Lorem ipsum consectetuer adipiscing </p>
						<span class="reducedfrom">${vehicule.plj}DZD</span>
						<span class="actual">$12.00</span><br>
						<ul class="buttons">
							<li class="cart"><a href="#">Add To Cart</a></li>
							<li class="shop_btn"><a href="#">Read More</a></li>
							<div class="clear"> </div>
					    </ul>
				    </div>
				</div>
				<div class="col-md-4">
					<img src="${contextPath}/images/${vehicule.imagePath}" class="img-responsive" alt=""/> 
					<div class="shop_desc"><a href="single.html">
						</a><h3><a href="single.html"></a><a href="#">${vehicule.model}</a></h3>
						<p>Lorem ipsum consectetuer adipiscing </p>
						<span class="reducedfrom">${vehicule.plj}DZD</span>
						<span class="actual">$12.00</span><br>
						<ul class="buttons">
							<li class="cart"><a href="#">Add To Cart</a></li>
							<li class="shop_btn"><a href="#">Read More</a></li>
							<div class="clear"> </div>
					    </ul>
				    </div>
				</div>
			</div>	
	     </div>
	   </div>
	  </div>
	

	 <jsp:include page="footer.jsp"/>

</body>	
</html>