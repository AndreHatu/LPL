<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="gerenciar_livros.aspx.cs" Inherits="Projeto.gerenciar_livros" %>

<%@ Register Src="~/UCLogin.ascx" TagPrefix="uc1" TagName="UCLogin" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <title>Gerencie seus Livros</title>

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
                <div>
                    <uc1:UCLogin runat="server" ID="UCLogin" OnLoad="UCLogin_Load" />
                </div>
            </div>

            <div class="row cyan row-padding round" runat="server">
                <asp:Panel runat="server" ID="painelVazio" Visible="false">
                    Nenhum livro cadastrado!
                </asp:Panel>
                <asp:Repeater runat="server" ID="listRepeater">
                    <HeaderTemplate>
                        <table class="table table-hover table-style">
                            <thead>
                                <tr>
                                    <th colspan="7" class="text-center">Gerenciar Livros</th>
                                </tr>
                                <tr>
                                    <th class="col-md-1"></th>
                                    <th class="col-md-5 ">Nome</th>
                                    <th class="col-md-1 text-center">Gênero</th>
                                    <th class="col-md-2 ">Autor</th>
									<th class="col-md-1 text-center">Marcar como Trocado</th>
									<th class="col-md-1 text-center">Editar</th>
									<th class="col-md-1 text-center">Excluir</th>
								</tr>
                            </thead>
                    </HeaderTemplate>
                    <ItemTemplate>
						<tbody>
                        <tr>
                            <td>
                                <img src="/Cover.ashx?id=<%#Eval("Id") %>" alt="Capa do livro" width="64" height="64" /></td>
                            <td class=""><%#Eval("Nome") %></td>
                            <td class="text-center"><%#Eval("Genero") %></td>
                            <td><%#Eval("Autor") %></td>
							<td style="text-align: center"><asp:LinkButton runat="server" ID="btnTrocado" OnCommand="btnTrocado_Command" CommandArgument='<%#Eval("Id") %>'><i class="glyphicon glyphicon-book button excluir"></i></asp:LinkButton></td>
                            <td class="text-center"><a href="Edicao.aspx?id=<%#Eval("Id")%>"><i class="glyphicon glyphicon-pencil button editar"></i></a></td>
                            <td style="text-align: center"><asp:LinkButton runat="server" ID="btnExluir" OnCommand="btnExluir_Command" CommandArgument='<%#Eval("Id") %>'><i class="glyphicon glyphicon-remove button excluir"></i></asp:LinkButton></td>
                        </tr>
                    </ItemTemplate>
                    <FooterTemplate>
                        </tbody>
						</table>
                    </FooterTemplate>
                </asp:Repeater>
            </div>
        </div>
    </form>
    <script type="text/javascript" charset="utf-8" src="/js/jquery-2.2.1.min.js"></script>
    <script type="text/javascript" charset="utf-8" src="/js/bootstrap.min.js"></script>
    <script type="text/javascript" charset="utf-8" src="/js/utils.js"></script>
</body>
</html>
