<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Validar.aspx.cs" Inherits="Projeto.Validar" %>

<%@ Register Src="~/UCLogin.ascx" TagPrefix="uc1" TagName="UCLogin" %>
<%@ Register Src="~/UCGuest.ascx" TagPrefix="uc1" TagName="UCGuest" %>



<!DOCTYPE html>
<<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<title>Validando Email</title>
	<link rel="stylesheet" type="text/css" href="/css/bootstrap.min.css" />
	<link rel="stylesheet" type="text/css" href="/css/personal-css.css" />


	<style type="text/css">
		
	</style>
	<link rel="apple-touch-icon" sizes="57x57" href="/apple-icon-57x57.png" />
	<link rel="apple-touch-icon" sizes="60x60" href="/apple-icon-60x60.png" />
	<link rel="apple-touch-icon" sizes="72x72" href="/apple-icon-72x72.png" />
	<link rel="apple-touch-icon" sizes="76x76" href="/apple-icon-76x76.png" />
	<link rel="apple-touch-icon" sizes="114x114" href="/apple-icon-114x114.png" />
	<link rel="apple-touch-icon" sizes="120x120" href="/apple-icon-120x120.png" />
	<link rel="apple-touch-icon" sizes="144x144" href="/apple-icon-144x144.png" />
	<link rel="apple-touch-icon" sizes="152x152" href="/apple-icon-152x152.png" />
	<link rel="apple-touch-icon" sizes="180x180" href="/apple-icon-180x180.png" />
	<link rel="icon" type="image/png" sizes="192x192" href="/android-icon-192x192.png" />
	<link rel="icon" type="image/png" sizes="32x32" href="/favicon-32x32.png" />
	<link rel="icon" type="image/png" sizes="96x96" href="/favicon-96x96.png" />
	<link rel="icon" type="image/png" sizes="16x16" href="/favicon-16x16.png" />
	<link rel="manifest" href="/manifest.json" />
	<meta name="msapplication-TileColor" content="#ffffff" />
	<meta name="msapplication-TileImage" content="/ms-icon-144x144.png" />
	<meta name="theme-color" content="#ffffff" />
</head>
<body>
	<form id="form1" runat="server">
		<div class="container">

					<uc1:UCGuest runat="server" ID="UCGuest" />


			<div class="row white row-padding-extra round">
				<asp:Panel runat="server" ID="panelOK" Visible="false">Seu Email está validado! <a href="logado_default.aspx">Clique aqui para voltar a página principal</a> ou de login no botão acima.</asp:Panel>
				<asp:Panel runat="server" ID="panelErro">Erro!</asp:Panel>
			</div>
		</div>
	</form>
</body>
</html>
