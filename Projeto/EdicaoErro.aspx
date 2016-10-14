<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EdicaoErro.aspx.cs" Inherits="Projeto.EdicaoErro" %>

<%@ Register Src="~/UCLogin.ascx" TagPrefix="uc1" TagName="UCLogin" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Cadastre Seu Livro</title>
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



            <div class="row">
                <div class="row white row-padding-extra round">
                    <div class="col-md-3"></div>
                    <div class="col-md-6 col-xs-12">
                        <div>
                            <asp:Label runat="server" CssClass="font-size-20" Text="Parece que você digitou algo de errado"></asp:Label>
                        </div>
                        <div>
                            <a href="gerenciar_livros.aspx" class="btn btn-primary"><i class="glyphicon glyphicon-arrow-left"></i>Voltar</a>

                        </div>
                    </div>
                </div>
                <div class="col-md-3"></div>
            </div>
        </div>
        <script type="text/javascript" charset="utf-8" src="/js/jquery-2.2.1.min.js"></script>
        <script type="text/javascript" charset="utf-8" src="/js/bootstrap.min.js"></script>
        <script type="text/javascript" charset="utf-8" src="/js/utils.js"></script>
    </form>
</body>
</html>
