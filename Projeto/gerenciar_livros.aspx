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
