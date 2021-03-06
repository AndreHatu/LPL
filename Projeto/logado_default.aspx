﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="logado_default.aspx.cs" Inherits="Projeto.logado_default" %>

<%@ Register Src="~/UCLogin.ascx" TagPrefix="uc1" TagName="UCLogin" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<title>Main Logado</title>
	<link rel="stylesheet" type="text/css" href="/css/bootstrap.min.css" />
	<link rel="stylesheet" type="text/css" href="/css/personal-css.css" />


	<style type="text/css">
		
	</style>
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
				<uc1:uclogin runat="server" id="UCLogin1" onload="UCLogin1_Load" />
			</div>


			<div class="row">
				<asp:ScriptManager runat="server" />
				<asp:UpdatePanel ID="UpdatePanel1" runat="server">
					<ContentTemplate>
						<div class="row grey row-padding-extra round">
							<div class="row">
								<div class="col-lg-2 col-lg-offset-10">
									<a href="Likes.aspx" class="btn btn-default">Editar Likes/Dislikes</a>
								</div>

								<asp:UpdateProgress ID="updProgress" AssociatedUpdatePanelID="UpdatePanel1" DynamicLayout="true" runat="server">
									<ProgressTemplate>
										<div id="loadingDiv">
											<div class="text-center font-size-20 text-white">
												<h7>Um Momento...</h7>
											</div>
										</div>
									</ProgressTemplate>
								</asp:UpdateProgress>
							</div>

							<div class="text-center">
								<asp:Label runat="server" ID="lblNome" Font-Size="25px" ForeColor="White"></asp:Label>
							</div>

							&nbsp
							&nbsp

						<div class="row">
							<div class="col-lg-2 text-center margin-top-100">
								<asp:LinkButton ID="btnDislike" runat="server" CssClass="btn btn-danger btn-circle" OnClick="click_dislike"><i class="glyphicon glyphicon-thumbs-down"></i></asp:LinkButton>
							</div>
							<div class="col-lg-4 col-sm-6">
								<div class="panel panel-success row-padding text-center">
									<img src="/Cover.ashx?id=<%=IdLivro %>" alt="Capa do livro" width="320" height="320" />
								</div>
							</div>
							<div class="col-lg-4 col-sm-6">
								<div class="panel panel-body">
									<asp:Label runat="server" ID="lblSinopse" Width="320" Height="320"></asp:Label>
								</div>
							</div>
							<div class="col-lg-2 text-center">
								<asp:LinkButton ID="btnLike" runat="server" CssClass="btn btn-success btn-circle margin-top-100" OnClick="click_like"><i class="glyphicon glyphicon-thumbs-up"></i></asp:LinkButton>
							</div>
						</div>

							<div class="row text-center">
								<div class="text-center">

									<div>
										<asp:Label runat="server" ID="lblLikeDislike" Text=""></asp:Label>
										<asp:Label runat="server" ID="lblID" Font-Size="0px"></asp:Label>
									</div>

								</div>
							</div>
					</ContentTemplate>
					<Triggers>
						<asp:AsyncPostBackTrigger ControlID="btnLike" EventName="Click" />
						<asp:AsyncPostBackTrigger ControlID="btnDislike" EventName="Click" />
					</Triggers>
				</asp:UpdatePanel>
			</div>
		</div>
		<script type="text/javascript" charset="utf-8" src="/js/jquery-2.2.1.min.js"></script>
		<script type="text/javascript" charset="utf-8" src="/js/bootstrap.min.js"></script>
		<script type="text/javascript" charset="utf-8" src="/js/utils.js"></script>
	</form>
</body>
</html>
