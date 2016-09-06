<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="livros_didaticos.aspx.cs" Inherits="Projeto.livros_didaticos1" %>

<%@ Register Src="~/UCLivroDidatico1.ascx" TagPrefix="uc1" TagName="UCLivroDidatico1" %>
<%@ Register Src="~/UCLivroDidatico2.ascx" TagPrefix="uc1" TagName="UCLivroDidatico2" %>
<%@ Register Src="~/UCLogin.ascx" TagPrefix="uc1" TagName="UCLogin" %>




<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<title>Livros Didáticos</title>
	<link rel="stylesheet" type="text/css" href="/css/bootstrap.min.css" />
	<link rel="stylesheet" type="text/css" href="/css/personal-css.css" />

</head>
<body>
	<form id="form1" runat="server">

		<div class="container">
			<div class="row">
				<div>
					<uc1:UCLogin runat="server" ID="UCLogin" />
				</div>
			</div>

			<asp:ScriptManager runat="server" />
			<asp:UpdatePanel runat="server" ID="UpdatePanel1">
				<ContentTemplate>
					<div class="row ">
						<div class="col-md-3 white row-padding round">
							<div class="row">

								<div class="form-group col-md-10">
									<div class="input-group">
										<asp:TextBox ID="txtPesquisa" runat="server" CssClass="form-control" placeholder="Pesquisa"></asp:TextBox>
										<span class="input-group-btn">
											<asp:LinkButton ID="btnPesquisa" CssClass="btn btn-default" runat="server" OnClick="btnPesquisa_Click"><i class="glyphicon glyphicon-search"></i></asp:LinkButton>
										</span>
									</div>
								</div>
								<div class="col-md-2">
									<asp:UpdateProgress ID="updProgress" AssociatedUpdatePanelID="UpdatePanel1" DynamicLayout="true" runat="server">
										<ProgressTemplate>
											<img src="ajax-loader.gif" />
										</ProgressTemplate>
									</asp:UpdateProgress>
								</div>
							</div>
							<ul class="nav nav-pills nav-stacked">
								<li role="presentation" class="active"><a href="#">Matemática</a></li>
								<li role="presentation" class="active"><a href="#">Português</a></li>
								<li role="presentation" class="active"><a href="#">História</a></li>
								<li role="presentation" class="active"><a href="#">Biologia</a></li>
								<li role="presentation" class="active"><a href="#">Inglês</a></li>
								<li role="presentation" class="active"><a href="#">Espanhol</a></li>
								<li role="presentation" class="active"><a href="#">Geografia</a></li>
								<li role="presentation" class="active"><a href="#">Física</a></li>
								<li role="presentation" class="active"><a href="#">Química</a></li>
							</ul>
						</div>
						<!-- <uc1:UCLivroDidatico1 runat="server" ID="UCLivroDidatico1" />
                        <uc1:UCLivroDidatico2 runat="server" ID="UCLivroDidatico2" /> -->
						<div class="col-md-9 white row-padding round">

							<table class="table table-striped table-style">
								<thead>
									<tr>
										<th class="col-md-1"></th>
										<th class="col-md-6 ">Nome</th>
										<th class="col-md-2 text-center">Gênero</th>
										<th class="col-md-2 ">Autor</th>
									</tr>
								</thead>
								<tbody>
									<asp:Panel runat="server" ID="painelVazio" Visible="false">
										Nenhum livro encontrado!
									</asp:Panel>
									<asp:Repeater runat="server" ID="listRepeater">
										<ItemTemplate>
											<tr>
												<td>
													<img src="/Cover.ashx?id=<%#Eval("Id") %>" alt="Capa do livro" width="64" height="64" /></td>
												<td class=""><%#Eval("Nome") %></td>
												<td class="text-center"><%#Eval("Genero") %></td>
												<td><%#Eval("Autor") %></td>
											</tr>
										</ItemTemplate>
									</asp:Repeater>
								</tbody>
							</table>

						</div>
					</div>
				</ContentTemplate>
			</asp:UpdatePanel>
		</div>
	</form>

	<script type="text/javascript" charset="utf-8" src="/js/jquery-2.2.1.min.js"></script>
	<script type="text/javascript" charset="utf-8" src="/js/bootstrap.min.js"></script>
	<script type="text/javascript" charset="utf-8" src="/js/utils.js"></script>

</body>
</html>
