<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="it">
<head>
<title>Achille Lauro</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="css/styleBrani.css">
<link rel="stylesheet" href="css/styleNav.css">
<link rel="stylesheet" href="css/styleHome.css">
<script src="https://kit.fontawesome.com/a076d05399.js"></script> <!-- per l'icona e aprire e chiudere -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script> <!-- per la nav fissa -->

<script>//barra di navigazione fissa
$(document).ready(function() {
var stickyNavTop = $('nav').offset().top;

var stickyNav = function(){
var scrollTop = $(window).scrollTop();

if (scrollTop > stickyNavTop) {
$('nav').addClass('sticky');
} else {
$('nav').removeClass('sticky');
}
};

stickyNav();

$(window).scroll(function() {
stickyNav();
});
});
</script>

<script>
function passa(){
	var xhttp = new XMLHttpRequest();
	$.getJSON("ServletInf?prezzo=0.80&autore=Achille%20Lauro&nome=16%20Marzo&tipo=Streaming",function(result){
		if(result.flag){
			alert("Elemento aggiunto al carrello");
		} else{
		alert("Elemento gia' presente nel carrello");
		}
	})
}
</script>

</head>

<!-- 							Sfondo	 							-->

<body background=./imgs/sfondo6.jpg>

<!-- 					Barra di navigazione 						-->

<div>
<nav class="navbar navbar-expand-sm bg-dark justify-content-center navbar-dark" >

<input type="checkbox" id="check">
  <label for="check" class="checkbtn">
   	<i class="fas fa-bars" id="btn"></i>
   	<i class="fas fa-times" id="cancel"></i>
  </label>
 
   <ul class="menu" id="nav" >
    <li class="nav-item active">
      <a class="nav-link" href="${pageContext.request.contextPath}/ServletLogout">Logout</a>
    </li>
    <li class="nav-item active">
      <a class="nav-link" href="MyAccount.jsp">My Account</a>
    </li>
    <li class="nav-item active">
      <a class="nav-link" href="home.jsp">Home</a>
    </li>
   <li class="nav-item active">
      <a class="nav-link" href="listaplaylist.jsp">Playlist</a>
    </li>
    
  </ul>
  
  <form action="ServletCerca" name="ricerca" class="navbar-form navbar-left" role="search">
  <div id="cerca">
 <input type="text" id="cerca" name="parola" placeholder="Ricerca"> 
  </div>
   <a href="#"> <button type="submit" value="Cerca" id="cerca">Cerca</button></a>
</form>
<a href="${pageContext.request.contextPath}/ServletCarrello"><button id="carrello" onClick=""><img src="./imgs/carrello.png" height="45px" alt="Foto carrello"></button></a> 
   </nav>
 </div>
 
 <!-- 						Titolo 									-->
 
 <div class="container-fluid" >
	<div class="titolo">
	<h1 class="display-1" id="tit">Music Console</h1>
	</div>
 
 <!-- 						Brano 									-->

 <h2 id="testo">16 Marzo- Achille Lauro-</h2>
 <hr>
 <div class="riempimento">
 <div class="costo" >
 <h3> Acquista a : 0,80 &euro;</h3>
 <h4>  invece di 1,50 &euro;</h4>
 <button id="bott" onClick="passa()">Aggiungi al Carrello</button>
 </div>
 
 <div class="Achille img-thumbnail" style="background-image: url(./imgs/img1.png)"> 
</div>
</div>

 <h5 class="inf"> <hr> Descrizione</h5>	

 <p class="descrizione">Achille Lauro, pseudonimo di Lauro De Marinis (Verona, 11 luglio 1990), 
 
 &#232 un cantautore e rapper italiano. 
 
 Noto per i suoi lavori nell'hip hop,
  <br>
 ha preso parte alla 69&ordf; edizione del Festival di Sanremo con il brano Rolls Royce
  <br>
 e alla 70&ordf; edizione con il brano Me ne frego.
  
 Il cantante prende il suo nome d'arte dall'omonimo armatore partenopeo, 
  <br>
 una scelta dettata semplicemente dall'associazione che in molti, 
  <br>
 quando era pi&uacute; giovane, erano soliti fare tra il suo nome di battesimo, 
  
 Lauro, e il cognome, appunto, dell&apos;armatore
  <br>
 </p>
  
 <img class=" foto1" src="./imgs/foto1.jpg" alt="foto brano" hspace="30" >
 <img class=" foto2" src="./imgs/foto2.jpg" alt="foto brano" hspace="30" >
 <img class=" foto3" src="./imgs/foto3.jpeg" alt="foto brano" hspace="30" >

 </div>
 </body>
</html>