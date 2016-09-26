<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Likes.aspx.cs" Inherits="Projeto.Likes" %>

<%@ Register Src="~/UCLogin.ascx" TagPrefix="uc1" TagName="UCLogin" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <title id="titlelike">Alterar Likes</title>

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

            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

            <div class="row cyan row-padding round" runat="server">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <div class="row row-padding round">
                            <div class="btn-group btn-group-justified" role="group">
                                <div class="btn-group" role="group">
                                    <asp:Button runat="server" ID="btnLikes" CssClass="btn btn-default" Text="Likes" OnClick="btnLikes_Click"></asp:Button>
                                </div>
                                <div class="btn-group" role="group">
                                    <asp:Button runat="server" ID="btnDislikes" CssClass="btn btn-default" Text="Dislikes" OnClick="btnDislikes_Click"></asp:Button>
                                </div>
                            </div>
                        </div>

                        <div class="text-center">
                            <asp:UpdateProgress ID="updProgress" AssociatedUpdatePanelID="UpdatePanel1" DynamicLayout="true" runat="server">
                                <ProgressTemplate>
                                    <div id="loadingDiv">
                                        <div class="text-center">
                                            <h7>Um Momento...</h7>
                                        </div>
                                    </div>
                                </ProgressTemplate>
                            </asp:UpdateProgress>

                        </div>


                        <div>
                            <table class="table table-hover table-style">
                                <thead>
                                    <tr>
                                        <th colspan="5" class="text-center">Alterar Likes e Dislikes</th>
                                    </tr>
                                    <tr>
                                        <th class="col-md-1"></th>
                                        <th class="col-md-6 ">Nome</th>
                                        <th class="col-md-1 text-center">Gênero</th>
                                        <th class="col-md-2 ">Autor</th>

                                        <th class="col-md-2 text-center">Trocar Like/Dislike</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <asp:Repeater runat="server" ID="listRepeater">
                                        <ItemTemplate>
                                            <tr>
                                                <td>
                                                    <img src="/Cover.ashx?id=<%#Eval("Id") %>" alt="Capa do livro" width="64" height="64" /></td>
                                                <td class=""><%#Eval("Nome") %></td>
                                                <td class="text-center"><%#Eval("Genero") %></td>
                                                <td><%#Eval("Autor") %></td>
                                                <td class="text-center">
                                                    <asp:LinkButton runat="server" ID="btnLike" OnCommand="btnLike_Command" CommandArgument='<%#Eval("Id") %>'><i class="glyphicon glyphicon-thumbs-up button alterar"></i></asp:LinkButton>

                                                    <asp:LinkButton runat="server" ID="btnDislike" OnCommand="btnDislike_Command" CommandArgument='<%#Eval("Id") %>'><i class="glyphicon glyphicon-thumbs-down button excluir"></i></asp:LinkButton></td>
                                            </tr>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </tbody>
                            </table>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
    </form>
    <script type="text/javascript" charset="utf-8" src="/js/jquery-2.2.1.min.js"></script>
    <script type="text/javascript" charset="utf-8" src="/js/bootstrap.min.js"></script>
    <script type="text/javascript" charset="utf-8" src="/js/utils.js"></script>
</body>
</html>

