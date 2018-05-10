<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%> 
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Free Snow Bootstrap Website Template | Shop :: w3layouts</title>
<link href="${contextPath}/css/bootstrap.css" rel='stylesheet' type='text/css' />
<link href="${contextPath}/css/style.css" rel='stylesheet' type='text/css' />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800' rel='stylesheet' type='text/css'>
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<script src="${contextPath}/js/jquery.min.js"></script>
<script type="text/javascript">
        $(document).ready(function() {
        	updateMarqueList( );
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
            
 function updateModelList(){
            	
                
            	var selectedMarque = $('#marque').find(":selected").text();
            	var selectedCategory = $('#category').find(":selected").text();
            	
            	$("#model").empty();
            	
          
            	
            	$.ajax({
                    type: "GET",
                    url: "/shop/getModelList",
                    data: { marque: selectedMarque , category: selectedCategory },
                    contentType: "application/json;charset=utf-8",
                    dataType: "json",
                    success: function (result) {
                        debugger;
                        
                        $("#model").append("<option value='' selected='selected'>Model</option>");
                        $.each(result , function(index, element){
                    	   $("#model").append("<option>"+ element +"</option>");
                       });
                    },
                    error: function (response) {
                        debugger;
                        alert('error');
                    }
                });
	       
            }function updateMarqueList( ){
              	
                
              	var selectedCategory = $('#category').find(":selected").text();
             
              	$("#marque").empty();
              	
              	$.ajax({
                      type: "GET",
                      url: "/shop/getMarqueList",
                      data: { category : selectedCategory },
                      contentType: "application/json;charset=utf-8",
                      dataType: "json",
                      success: function (result) {
                          debugger;
                          $("#marque").append("<option value='' selected='selected'>Marque</option>");
                          $.each(result , function(index, element){
                      	   $("#marque").append("<option>"+ element +"</option>")   
                         });
                          updateModelList( );
                      },
                      error: function (response) {
                          debugger;
                          alert('error');
                      }
                  });
  	       
              	
             
               
              }
        
            $("#marque").change(updateModelList);
            	
            $("#category").change(updateMarqueList);
             
           
        });
     </script>
</head>
<body>
	<jsp:include page="nav.jsp"/>
     <div class="main">
     	<!-- onInput="document.forms.namedItem('filterForm').submit()" -->
     <form:form  modelAttribute="filter" action="/shop/0/filter" onInput="output.value=range.value" method="GET" id="filterForm" class="filterForm">
     <table >
       <tbody class="tableFilterBody" >
       <tr class="filters"> 
        <td>  Prix max : <output for="range" name="output">Aucun</output> </td>
       <td>   <form:input id="range"  type="range" min="0" max="15000" path="priceRange" />   </td>
       <td> 
       
        <form:select id="category" path="category"> 
       <c:forEach items="${sessionScope.listCategory}" var="categ" >
       <option value="${categ}" >${categ }</option>
       </c:forEach>
       </form:select> 
        
      </td>
       <td>     <form:select id="marque" path="marque"  selected="${sessionScope.filter.model}"> 
        <c:forEach items="${sessionScope.marqueList}" var="marque" >
        <option value="${marque}">${marque}</option>
        </c:forEach>
       </form:select>  </td>
       
       <td>     <form:select id="model" path="model" selected="${sessionScope.filter.model}"> 
        <option value="" selected="selected">Model</option>
       </form:select>  </td>
		
		</tr>
       
       <tr type="none" class="filters">
       
       
       <td>  Date de debut / fin : </td>
       <td>  <form:input required="required" type="date" path="dateD" placeHolder="Date de debut" /> </td>
        
        <td>  <form:input required="required" type="date" path="dateR" placeHolder="Date de fin" /> </td>
        
        <td colspan = "2"> <input type="submit" id="filterSubmit" value="Filtrer" />  </td>
        
       </tr>
       </tbody>
       </table>
     </form:form>
   

		<h1 style="position:absolute; font-size:2.5em;font-weight:800; color:white; text-align: center;width:100%;top:300px">LE VEHICULE DE VOTRE CHOIX !</h1>
			<img  style="width:100%; height:auto;" src="${contextPath}/images/shopBackground.jpg"/>
	
			</div>
	
   
	  
	<jsp:include page="footer.jsp"/>
</body>	
</html>