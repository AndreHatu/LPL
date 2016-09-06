<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UCGuest.ascx.cs" Inherits="Projeto.UCGuest" %>

<nav class="navbar navbar-default">
	<div class="container-fluid">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
				<span class="sr-only">Toggle navigation</span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="Default.aspx">
				<img alt="Brand" src="LPL.png" width="55" height="37" /></a>
		</div>

		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav navbar-right">
				<li>

					<button type="button" class="btn btn-info btn-md navbar-btn" data-toggle="modal" data-target=".bd-example-modal-sm">Login</button>

					<div id="modalLogin" class="<%=( AlgoDeuErrado ? "modal bd-example-modal-sm" : "modal fade bd-example-modal-sm") %>" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="<%=(AlgoDeuErrado ? "false" : "true") %>">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal">&times;</button>
									<h4 class="modal-title">Entrar em sua Conta</h4>
								</div>
								<div class="modal-body">
									<div class="form-group">
										<asp:Label runat="server" ID="lblMsg" Text="" ForeColor="Red"></asp:Label>
										<div class="form-group">
											<label for="txtEmail" class="control-label">Email: </label>
											<div class="">
												<asp:TextBox ID="txtEmail" CssClass="form-control" runat="server" Placeholder="Email"></asp:TextBox>
											</div>
										</div>
									</div>
									<div class="form-group">
										<label for="txtSenha" class="control-label">Senha: </label>
										<div class="">
											<asp:TextBox ID="txtSenha" TextMode="Password" CssClass="form-control" runat="server" Placeholder="Senha"></asp:TextBox>
										</div>
									</div>
									<div class="form-group">
										<div class="">
											<asp:Button ID="btnEntrar" runat="server" Text="Entrar" CssClass="btn btn-primary" OnClick="btnEntrar_Click" />
										</div>
									</div>
								</div>

								<div class="modal-footer"></div>
							</div>
						</div>
					</div>
				</li>
				<li>
					<a href="cadastro.aspx">Cadastrar-se</a>
				</li>
			</ul>
		</div>
		<!-- /.navbar-collapse -->
	</div>
	<!-- /.container-fluid -->
</nav>

<% if (AlgoDeuErrado == true) { %>
<script type="text/javascript">
	$("#modalLogin").modal({ show: true, keyboard: true, background: true });
</script>
<% } %>
