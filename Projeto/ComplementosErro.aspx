<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ComplementosErro.aspx.cs" Inherits="Projeto.ComplementosErro" %>

<%@ Register Src="~/UCLogin.ascx" TagPrefix="uc1" TagName="UCLogin" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Cadastre Seu Livro</title>
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
                    <uc1:UCLogin runat="server" ID="UCLogin" />
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
                            <a href="default.aspx" class="btn btn-primary"><i class="glyphicon glyphicon-arrow-left"></i>Voltar</a>

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
