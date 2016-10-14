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

