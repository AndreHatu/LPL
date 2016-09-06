<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="cadastro.aspx.cs" Inherits="Projeto.cadastro" %>

<%@ Register Src="~/UCGuest.ascx" TagPrefix="uc1" TagName="UCGuest" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<title>Cadastre-se</title>
	<link rel="stylesheet" type="text/css" href="/css/bootstrap.min.css" />
	<link rel="stylesheet" type="text/css" href="/css/personal-css.css" />
	<script type="text/javascript">

		function imagepreview(input) {
			if (input.files && input.files[0]) {
				var fildr = new FileReader();
				fildr.onload = function (e) {
					$('#imgprw').attr('src', e.target.result);
				}
				fildr.readAsDataURL(input.files[0]);
			}
		}

	</script>


	<style type="text/css">
        
    </style>
</head>
<body>
	<form id="form1" runat="server">
		<div>
			<div class="container">
				<uc1:UCGuest runat="server" id="UCGuest" />
				<div class="cadastro col-xs-12 row-padding white round">
					<asp:Label runat="server" Text="*Campos Obrigatórios" Font-Size="X-Small" CssClass="text-center"></asp:Label>
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<label for="txtNome">Nome Completo*:</label>
								<asp:TextBox runat="server" CssClass="form-control" ID="txtNome" placeholder="Jorge dos Santos" pattern=".+ .+"></asp:TextBox>
								<asp:Label runat="server" ID="lblNome" Text="" ForeColor="Red"></asp:Label>
							</div>
							<div class="form-group">
								<label for="txtEmailCadastro">Email*:</label>
								<asp:TextBox runat="server" CssClass="form-control" ID="txtEmailcadastro" placeholder="jorge.santos@email.com"></asp:TextBox>
								<asp:Label runat="server" ID="lblEmail" Text="" ForeColor="Red"></asp:Label>
							</div>

							<div class="form-group">
								<label for="txtConfEmail">Confirmar Email*:</label>
								<asp:TextBox runat="server" CssClass="form-control" ID="txtCionfEmail" placeholder="Confirmar Email"></asp:TextBox>
								<asp:Label runat="server" ID="lblConfEmail" Text="" ForeColor="Red"></asp:Label>
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label for="txtNascimento">Nascimento*:</label>
								<asp:TextBox runat="server" CssClass="form-control" ID="txtNascimento" placeholder="01/01/1990" TextMode="Date"></asp:TextBox>
								<asp:Label runat="server" ID="lblNascimento" Text="" ForeColor="Red"></asp:Label>
							</div>
							<div class="form-group">
								<label for="txtSenhaCadastro">Senha*: </label>
								<asp:TextBox runat="server" type="password" class="form-control" ID="txtSenhaCadastro" placeholder="euamogatos12345"></asp:TextBox>
								<asp:Label runat="server" ID="lblSenha" Text="" ForeColor="Red"></asp:Label>
							</div>
							<div class="form-group">
								<label for="txtConfSenha">Confirmar Senha*: </label>
								<asp:TextBox runat="server" type="password" class="form-control" ID="txtConfSenha" placeholder="Confirmar Senha"></asp:TextBox>
								<asp:Label runat="server" ID="lblConfSenha" Text="" ForeColor="Red"></asp:Label>
							</div>
						</div>

						<div class="row text-center">
							<asp:Button runat="server" ID="btnSubmit" CssClass="btn btn btn-primary" Text="Enviar Formulário" OnClick="btnSubmit_Click" />
						</div>

					</div>
				</div>
			</div>
		</div>
		<script type="text/javascript" charset="utf-8" src="/js/jquery-2.2.1.min.js"></script>
		<script type="text/javascript" charset="utf-8" src="/js/bootstrap.min.js"></script>
		<script type="text/javascript" charset="utf-8" src="/js/utils.js"></script>

	</form>
</body>
</html>
