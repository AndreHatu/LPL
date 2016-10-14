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
