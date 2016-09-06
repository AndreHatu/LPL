<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="tinder.aspx.cs" Inherits="Projeto.tinder" %>

<%@ Register Src="~/UCLogin.ascx" TagPrefix="uc1" TagName="UCLogin" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<title>Descubra livros!</title>
	<link rel="stylesheet" type="text/css" href="/css/bootstrap.min.css" />
	<link rel="stylesheet" type="text/css" href="/css/personal-css.css" />
</head>
<body>
	<form id="form1" runat="server">
		<div class="container">
			<div class="row">				
				<div>
					<uc1:uclogin runat="server" id="UCLogin1" OnLoad="UCLogin1_Load" />
				</div>
			</div>
			


			<div class="row grey row-padding-extra round">
				<div class="row">
					<div class="col-md-1 col-sm-6">
						<button class="btn btn-alert"><i class="glyphicon glyphicon-chevron-left"></i></button>
					</div>
					<div class="col-md-10"></div>
					<div class="col-md-1 col-sm-6 text-right">
						<button class="btn btn-alert "><i class="glyphicon glyphicon-chevron-right"></i></button>
					</div>


				</div>
				<asp:ScriptManager runat="server" />
				<asp:UpdatePanel ID="UpdatePanel1" runat="server">
					<ContentTemplate>
						<div class="text-center">
							<asp:Label runat="server" ID="lblNome" Font-Size="25px"></asp:Label>
						</div>

						&nbsp
						&nbsp

						<div class="row">
							<div class="col-md-2 text-center margin-top-100">
								<asp:LinkButton ID="btnDislike" runat="server" CssClass="btn btn-danger btn-circle" OnClick="click_dislike"><i class="glyphicon glyphicon-thumbs-down"></i></asp:LinkButton>
							</div>
							<div class="col-md-4 col-sm-6">
								<div class="panel panel-success row-padding text-center">
									<img src="/Cover.ashx?id=<%=IdLivro %>" alt="Capa do livro" width="320" height="320" />
								</div>
							</div>
							<div class="col-md-4 col-sm-6">
								<div class="panel panel-body">
									<asp:Label runat="server" ID="lblSinopse" Width="320" Height="320"></asp:Label>
								</div>
							</div>
							<div class="col-md-2 text-center">
								<asp:LinkButton ID="btnLike" runat="server" CssClass="btn btn-success btn-circle margin-top-100" OnClick="click_like"><i class="glyphicon glyphicon-thumbs-up"></i></asp:LinkButton>
							</div>
						</div>
					</ContentTemplate>
				</asp:UpdatePanel>
				<div class="row text-center">
					<div class="text-center">
						<asp:UpdatePanel runat="server">
							<ContentTemplate>
								<div>
									<asp:Label runat="server" ID="lblLikeDislike" Text=""></asp:Label>
									<asp:Label runat="server" ID="lblID" Font-Size="0px"></asp:Label>
								</div>
							</ContentTemplate>
						</asp:UpdatePanel>
					</div>
				</div>
			</div>


		</div>
	</form>
	<script type="text/javascript" charset="utf-8" src="/js/jquery-2.2.1.min.js"></script>
	<script type="text/javascript" charset="utf-8" src="/js/bootstrap.min.js"></script>
	<script type="text/javascript" charset="utf-8" src="/js/utils.js"></script>
</body>
</html>
