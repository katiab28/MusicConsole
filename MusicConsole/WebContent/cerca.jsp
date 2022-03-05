<!DOCTYPE html>
<html>
<head>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="UTF-8" import="java.util.*,gestioneAccount.*, gestioneAcquisti.*, gestioneCarrello.*, gestioneProdotti.*"%>
<title>Risultato</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1 shrink-to-fit=no">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet" href="css/styleHome.css">
<link rel="stylesheet" href="css/styleNav.css">
<link rel="stylesheet" href="css/styleCerca.css">

<script src="https://kit.fontawesome.com/a076d05399.js"></script> <!-- per l'icona e aprire e chiudere -->
<!--  script src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script> <!-- per la nav fissa -->

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

</head>
<% Collection<?> ris3 = (Collection<?>)request.getAttribute("ris3"); %>
<script type="text/javascript">
		function play(i){
			<%if(ris3 != null && ris3.size()>0){
				Iterator<?> it = ris3.iterator();
				while(it.hasNext()){
					Brano bean = (Brano)it.next();
				
			
			%>
			if(i==<%=bean.getCodice()%>){
				var audio=document.getElementById("<%=bean.getCodice()%>");
				if(playing==false){
					audio.play();
					playing=true;
					}else{
						audio.pause();
						playing=false;
						}
		}
			
			
	<%
		}
		}
	%>
			
			
		}
		
	var playing=false;

</script>

<script>
	function avviso(){
	$('#exampleModal').modal({backdrop: 'static',keyboard: true, show:true});
	}; 
	
</script>

<script>
	function avvisoc(){
	$('#ModalCar').modal({backdrop: 'static',keyboard: true, show:true});
	}; 
	
</script>

</head>
<body background=./imgs/sfondo6.jpg>

<div>
<nav class="navbar navbar-expand-sm bg-dark justify-content-center navbar-dark" >
	
	 <input type="checkbox" id="check">
  <label for="check" class="checkbtn">
   	<i class="fas fa-bars" id="btn"></i>
   	<i class="fas fa-times" id="cancel"></i>
  </label>
 
   <ul class="menu" id="nav" >
    <li class="nav-item active">
      <a class="nav-link" href="login.jsp">Login</a>
    </li>
    <li class="nav-item active">
      <a class="nav-link" href="ServletIndex">Home</a>
    </li>
    
  </ul>
  
  <!-- 									Barra di Ricerca													 -->
  
  <form action="ServletCerca" name="ricerca" class="navbar-form navbar-left" role="search">
  <div id="cerca">
 <input type="text" id="cerca" name="parola" placeholder="Ricerca"> 
  </div>
   <a href="#"> <button type="submit" value="Cerca" id="cerca">Cerca</button></a>
</form>
<button id="carrello" onClick="avvisoc()"><img src="./imgs/carrello.png" height="45px" alt="Foto carrello"></button>
   </nav>
 </div>

<!-- 											Titolo																		 -->

<div class="container-fluid" >
	<div class="titolo">
	<h1 class="display-1" id="tit" >Music Console</h1>
</div>

<!-- 											Risultato																		 -->

<%
   Collection<?> ris1 = (Collection<?>)request.getAttribute("ris1");
   Collection<?> ris5 = (Collection<?>)request.getAttribute("ris5");
   Boolean va=false;
 %>

<table>
<tr>
	<th></th>
	<th></th>
</tr>
<%
	if(ris1 != null && ris1.size()>0){
		va=true;
		Iterator<?> it = ris1.iterator();
		while(it.hasNext()){
			Album bean = (Album)it.next();
			if(bean.getNomeAlbum().toLowerCase().equals(request.getParameter("parola").toLowerCase())){
%>

	<tr>	
			<%if(bean.getDat()!=null){ %>
			<td><a href="ServletpageInfH?nome=<%=bean.getNomeAlbum()%>&tipo=<%=bean.getTipo()%>&artista=<%=bean.getNartista()%>"> <input class="info" type="button" value="&#128712;"></a></td>
			<%}else{ %>
			<td><a href="<%=bean.getNomeAlbum()%>.html"> <input class="info" type="button" value="&#128712;"></a></td>
			<%} %>
			<td><img src="./imgs/<%=bean.getImgAlbum() %>" class="rounded-circle brano" alt="foto brano" hspace="30"></td>
	</tr>
	<tr>
			<td></td>
			<td> <%=bean.getNomeAlbum() %> - <%=bean.getNartista()%></td>
	</tr>
		


<%
		}
	}
		}

%>
<%
	if(ris1 != null && ris1.size()>0){
		va=true;
		Iterator<?> it = ris1.iterator();
		while(it.hasNext()){
			Album bean = (Album)it.next();
			if(bean.getNartista().toLowerCase().equals(request.getParameter("parola").toLowerCase())){
%>

	<tr>	
			<%if(bean.getDat()!=null){ %>
			<td><a href="ServletpageInfH?nome=<%=bean.getNomeAlbum()%>&tipo=<%=bean.getTipo()%>&artista=<%=bean.getNartista()%>"> <input class="info" type="button" value="&#128712;"></a></td>
			<%}else{ %>
			<td><a href="<%=bean.getNomeAlbum()%>.html"> <input class="info" type="button" value="&#128712;"></a></td>
			<%} %>
			<td><img src="./imgs/<%=bean.getImgAlbum() %>" class="rounded-circle brano" alt="foto brano" hspace="30"></td>
	</tr>
	<tr>
			<td></td>
			<td> <%=bean.getNomeAlbum() %> - <%=bean.getNartista()%></td>
	</tr>
	
<%
		}
	}
		}

%>	
<%
	if(ris3 != null && ris3.size()>0){
		va=true;
		Iterator<?> it = ris3.iterator();
		while(it.hasNext()){
			Brano bean = (Brano)it.next();
			if(bean.getCantante().toLowerCase().equals(request.getParameter("parola").toLowerCase())){
%>

	<tr>	
			<%if(bean.getDat()!=null){ %>
			<td><a href="ServletpageInfH?nome=<%=bean.getTitolo()%>&tipo=<%=bean.getTipo()%>&artista=<%=bean.getCantante()%>"> <input class="info" type="button" value="&#128712;"></a></td>
			<%}else{ %>
			<td><a href="<%=bean.getCantante()%>.html"> <input class="info" type="button" value="&#128712;"></a></td>
			<%} %>
			<td><img src="./imgs/<%=bean.getImgBrano() %>" class="rounded-circle brano" alt="foto brano" hspace="30"></td>
	</tr>
	<tr>
			<td></td>
			<td> <%=bean.getTitolo() %> - <%=bean.getCantante()%></td>
			<td><audio id="<%=bean.getCodice()%>" onended="avviso()">
				<source src="./brani/<%=bean.getSuono()%>" type="audio/mpeg">
				</audio>
				 <input id="pulsante" type="button" value="&#5125;" onClick="play(<%=bean.getCodice()%>);">
			</td>
	</tr>
		


<%
		}
	}
		}
%>
		
<%
	if(ris3 != null && ris3.size()>0){
		va=true;
		Iterator<?> it = ris3.iterator();
		while(it.hasNext()){
			Brano bean = (Brano)it.next();
			if(bean.getTitolo().toLowerCase().equals(request.getParameter("parola").toLowerCase())){
%>

	<tr>	
			<%if(bean.getDat()!=null){ %>
			<td><a href="ServletpageInfH?nome=<%=bean.getTitolo()%>&tipo=<%=bean.getTipo()%>&artista=<%=bean.getCantante()%>"> <input class="info" type="button" value="&#128712;"></a></td>
			<%}else{ %>
			<td><a href="<%=bean.getCantante()%>.html"> <input class="info" type="button" value="&#128712;"></a></td>
			<%} %>
			<td><img src="./imgs/<%=bean.getImgBrano() %>" class="rounded-circle brano" alt="foto brano" hspace="30"></td>
	</tr>
	<tr>
			<td></td>
			<td> <%=bean.getTitolo() %> - <%=bean.getCantante()%></td>
			<td><audio id="<%=bean.getCodice()%>" onended="avviso()">
				<source src="./brani/<%=bean.getSuono()%>" type="audio/mpeg">
				</audio>
				 <input id="pulsante" type="button" value="&#5125;" onClick="play(<%=bean.getCodice()%>);">
			</td>
	</tr>
<%
		}
	}
		}

%>
<%
	if(ris5 != null && ris5.size()>0){
		va=true;
		Iterator<?> it = ris5.iterator();
		while(it.hasNext()){
			Podcast bean = (Podcast)it.next();
			if(bean.getNomePodcast().toLowerCase().equals(request.getParameter("parola").toLowerCase())){
%>

	<tr>	
			<%if(bean.getDat()!=null){ %>
			<td><a href="ServletpageInfH?nome=<%=bean.getNomePodcast()%>&tipo=<%=bean.getTipo()%>&artista=<%=bean.getIdeatore()%>"> <input class="info" type="button" value="&#128712;"></a></td>
			<%}else{ %>
			<td><a href="<%=bean.getNomePodcast()%>.html"> <input class="info" type="button" value="&#128712;"></a></td>
			<%} %>
			<td><img src="./imgs/<%=bean.getImgPod() %>" class="rounded-circle brano" alt="foto brano" hspace="30"></td>
	</tr>
	<tr>
			<td></td>
			<td> <%=bean.getNomePodcast() %> - <%=bean.getIdeatore()%></td>
	</tr>
	
<%
			}
		}
			}
	%>
<%
if(ris5 != null && ris5.size()>0){
	va=true;
	Iterator<?> it = ris5.iterator();
	while(it.hasNext()){
		Podcast bean = (Podcast)it.next();
		if(bean.getIdeatore().toLowerCase().equals(request.getParameter("parola").toLowerCase())){
%>

<tr>	
		<%if(bean.getDat()!=null){ %>
			<td><a href="ServletpageInfH?nome=<%=bean.getNomePodcast()%>&tipo=<%=bean.getTipo()%>&artista=<%=bean.getIdeatore()%>"> <input class="info" type="button" value="&#128712;"></a></td>
			<%}else{ %>
		<td><a href="<%=bean.getNomePodcast()%>.html"> <input class="info" type="button" value="&#128712;"></a></td>
		<%} %>
		<td><img src="./imgs/<%=bean.getImgPod() %>" class="rounded-circle brano" alt="foto brano" hspace="30"></td>
</tr>
<tr>
		<td></td>
		<td> <%=bean.getNomePodcast() %> - <%=bean.getIdeatore()%></td>
</tr>

<%
		}
	}
		}
%>
<%
	if(ris3 != null && ris3.size()>0){
		va=true;
		Iterator<?> it = ris3.iterator();
		while(it.hasNext()){
			Brano bean = (Brano)it.next();
			if(bean.getGenere().toLowerCase().equals(request.getParameter("parola").toLowerCase())){
%>
	<tr>	
			<%if(bean.getDat()!=null){ %>
			<td><a href="ServletpageInfH?nome=<%=bean.getTitolo()%>&tipo=<%=bean.getTipo()%>&artista=<%=bean.getCantante()%>"> <input class="info" type="button" value="&#128712;"></a></td>
			<%}else{ %>
			<td><a href="<%=bean.getCantante()%>.html"> <input class="info" type="button" value="&#128712;"></a></td>
			<%}%>
			<td><img src="./imgs/<%=bean.getImgBrano() %>" class="rounded-circle brano" alt="foto brano" hspace="30"></td>
	</tr>
	<tr>
			<td></td>
			<td> <%=bean.getTitolo() %> - <%=bean.getCantante()%></td>
			<td><audio id="<%=bean.getCodice()%>" onended="avviso()">
				<source src="./brani/<%=bean.getSuono()%>" type="audio/mpeg">
				</audio>
				 <input id="pulsante" type="button" value="&#5125;" onClick="play(<%=bean.getCodice()%>);">
			</td>
	</tr>

<%
		}
	}
		}
	
	if(va.equals(false)){
		
	
%>			
			<table style="margin-left:32%; font-size:x-large;">
			<tr>
				<td>Elemento non trovato</td>
			</tr>
			</table>
<%
		}
%>	
</table>

<!-- Modal -->

 <div class="modal fade" id="exampleModal" data-toggle="modal" tabindex="-1" role="dialog" aria-hidden="true" aria-labelledby="exampleModalLabel" >
  <div class="modal-dialog" role="document">
    <div class="modal-content"> 
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">ATTENZIONE!</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
<span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        Per continuare ad ascoltare accedi o iscriviti!
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Chiudi</button>
      </div>
    </div>
  </div>
</div>

<!-- Modal -->

 <div class="modal fade" id="ModalCar" data-toggle="modal" tabindex="-1" role="dialog" aria-hidden="true" aria-labelledby="exampleModalLabel" >
  <div class="modal-dialog" role="document">
    <div class="modal-content"> 
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">ATTENZIONE!</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
<span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        Per accedere al carrello accedi o registrati!
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Chiudi</button>
      </div>
    </div>
  </div>
</div> 
 
</div>	
</body>
</html>