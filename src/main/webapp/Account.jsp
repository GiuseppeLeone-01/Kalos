<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*,model.*"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css">

<title>Account</title>
</head>
<body>

	<%  UserBean us = (UserBean) request.getSession().getAttribute("currentSessionUser");
		IndirizzoSpedizioneBean spedizione = (IndirizzoSpedizioneBean) request.getSession().getAttribute("spedizione");
		MetodoPagamentoBean pagamento = (MetodoPagamentoBean) request.getSession().getAttribute("pagamento");%>

	<%@ include file="./fragments/header.jsp" %>
	<%@ include file="./fragments/menu.jsp" %>
	
	<div id="main" class="clear">
	<div class="account-container">
	<div class="account">
		<h2>Account</h2>
		<h3>Dati Personali</h3>
		<ul>
			<li>Nome: <%=us.getNome() %></li>
			<li>Cognome: <%= us.getCognome() %></li>
			<li>Email: <%=us.getEmail() %></li>
		</ul>
			
		<h3>Indirizzo di spedizione predefinito</h3>
		<%if(spedizione== null){ %>
			<form action="account" method="post">
				<input type="hidden" name="action" value="addS">
				<input type="hidden" name="page" value="Account.jsp">
				<div class="tableRow">
				<p>Nome:</p>
				<p><input type="text" name="nome" required/></p>
				</div>	
				<div class="tableRow">
					<p>Cognome:</p>
					<p><input type="text" name="cognome" required/></p>
				</div>
				<div class="tableRow">
					<p>telefono:</p>
					<p><input type="text" name="tel" required/></p>
				</div>
				<div class="tableRow">
					<p>Indirizzo:</p>
					<p><input type="text"  name="ind" required/></p>
				</div>
				<div class="tableRow">
					<p>Cap:</p>
					<p><input type="text" name="cap" required/></p>
				</div>
				<div class="tableRow">
					<p>Provincia:</p>
					<p><input type="text" name="prov" required/></p>
				</div>
				<div class="tableRow">
					<p>Citt�:</p>
					<p><input type="text" name="citt�" required/></p>
				</div>
				<div class="tableRow">
					<p></p>
					<p><input type="submit" value="aggiungi"></p>
				</div>			
			</form>
			<%}else{ %>
				<ul>
					<li>Nome: <%=spedizione.getNome() %></li>
					<li>Cognome: <%=spedizione.getCognome() %></li>
					<li>Telefono: <%=spedizione.getTelefono() %></li>
					<li>Indirizzo: <%=spedizione.getIndirizzo() %></li>
					<li>Cap: <%=spedizione.getCap() %></li>
					<li>Provincia: <%=spedizione.getProvincia() %></li>
					<li>Citt�: <%=spedizione.getCitt�() %></li>
					<li><a href="account?action=removeS"><button>Rimuovi</button></a></li>
				</ul>
				<%}%>
		<h3>Metodo di pagamento predefinito</h3>
		<%if(pagamento == null){ %>
			<form action="account" method="post">
				<input type="hidden" name="action" value="addP">
				<div class="tableRow">
					<p>Titolare carta:</p>
					<p><input type="text" name="tit" required/></p>
				</div>	
				<div class="tableRow">
					<p>Numero:</p>
					<p><input type="text" name="numC" required/></p>
				</div>
				<div class="tableRow">
					<p>Scadenza:</p>
					<p><input type="date"  name="scad" required/></p>
				</div>
				<div class="tableRow">
					<p></p>
					<p><input type="submit" value="aggiungi"></p>		
				</div>
			</form>
			<%}else{ %>
				<ul>
					<li>Titolare: <%=pagamento.getTitolare() %></li>
					<li>Numero Carta: <%=pagamento.getNumero() %></li>
					<li>Scadenza Carta: <%=pagamento.getScadenza() %></li>
					<li><a href="account?action=removeP"><button>Rimuovi</button></a></li>
				</ul>
				</div>
				<%}%>

	</div>
	</div>
	<%@ include file="./fragments/footer.jsp" %>
	
</body>
</html>
}