<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Notificacoes.aspx.cs" Inherits="Projeto.Notificacoes" %>

<%@ Register Src="~/UCLogin.ascx" TagPrefix="uc1" TagName="UCLogin" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

	<meta charset="utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta name="viewport" content="width=device-width, initial-scale=1" />

	<title>Notificacoes</title>

	<link rel="stylesheet" type="text/css" href="/css/bootstrap.min.css" />
	<link rel="stylesheet" type="text/css" href="/css/personal-css.css" />
<link rel="apple-touch-icon" sizes="57x57" href="/apple-icon-57x57.png">
<link rel="apple-touch-icon" sizes="60x60" href="/apple-icon-60x60.png">
<link rel="apple-touch-icon" sizes="72x72" href="/apple-icon-72x72.png">
<link rel="apple-touch-icon" sizes="76x76" href="/apple-icon-76x76.png">
<link rel="apple-touch-icon" sizes="114x114" href="/apple-icon-114x114.png">
<link rel="apple-touch-icon" sizes="120x120" href="/apple-icon-120x120.png">
<link rel="apple-touch-icon" sizes="144x144" href="/apple-icon-144x144.png">
<link rel="apple-touch-icon" sizes="152x152" href="/apple-icon-152x152.png">
<link rel="apple-touch-icon" sizes="180x180" href="/apple-icon-180x180.png">
<link rel="icon" type="image/png" sizes="192x192"  href="/android-icon-192x192.png">
<link rel="icon" type="image/png" sizes="32x32" href="/favicon-32x32.png">
<link rel="icon" type="image/png" sizes="96x96" href="/favicon-96x96.png">
<link rel="icon" type="image/png" sizes="16x16" href="/favicon-16x16.png">
<link rel="manifest" href="/manifest.json">
<meta name="msapplication-TileColor" content="#ffffff">
<meta name="msapplication-TileImage" content="/ms-icon-144x144.png">
<meta name="theme-color" content="#ffffff">
</head>
<body>
	<form id="form1" runat="server">
		<div class="container">
			<div class="row">
				<uc1:UCLogin runat="server" ID="UCLogin" OnLoad="UCLogin_Load" />
			</div>
			<div class="row cyan row-padding round">
				<asp:Panel runat="server" ID="painelVazio" Visible="false">
					Nenhum Match!
				</asp:Panel>
				<asp:Repeater runat="server" ID="listRepeater" ViewStateMode="Enabled" OnItemDataBound="listRepeater_ItemDataBound">
					<HeaderTemplate>
						<table class="table table-hover">
							<thead>
								<tr>
									<th class="col-lg-1 col-sm-2"></th>
									<th class="col-lg-2 col-sm-2">Nome</th>
									<th class="col-lg-3 col-sm-3">Email</th>
									<th class="col-lg-3 col-sm-3 text-center">Livros que querem de você</th>
									<th class="col-lg-3 col-sm-2 text-center">Livros que você quer de outros</th>
								</tr>
							</thead>
							<tbody>
					</HeaderTemplate>
					<ItemTemplate>
						<tr>
							<td><img src="/Avatar.ashx?id=<%#Eval("Id") %>" alt="Foto do usuário" width="48" height="48" /></td>
							<td class=""><%#Eval("Nome") %></td>
							<td class=""><%#Eval("Email") %></td>
							<td>
								<asp:Repeater runat="server" ID="listRepeaterLivrosElaGosta" ViewStateMode="Enabled">
									<ItemTemplate>
										<div>
											<img src="/Cover.ashx?id=<%#Eval("Id") %>" alt="Capa do livro" width="48" height="48" />
											<span><%#Eval("Nome") %></span>
										</div>
									</ItemTemplate>
								</asp:Repeater>
							</td>
							<td>
								<asp:Repeater runat="server" ID="listRepeaterLivrosEuGosto" ViewStateMode="Enabled">
									<ItemTemplate>
										<div>
											<img src="/Cover.ashx?id=<%#Eval("Id") %>" alt="Capa do livro" width="48" height="48" />
											<span><%#Eval("Nome") %></span>
										</div>
									</ItemTemplate>
								</asp:Repeater>
							</td>
						</tr>
					</ItemTemplate>
					<FooterTemplate>
						</tbody>
						</table>
					</FooterTemplate>
				</asp:Repeater>
			</div>
		</div>
		<script type="text/javascript" charset="utf-8" src="/js/jquery-2.2.1.min.js"></script>
		<script type="text/javascript" charset="utf-8" src="/js/bootstrap.min.js"></script>
		<script type="text/javascript" charset="utf-8" src="/js/utils.js"></script>
	</form>
</body>
</html>
