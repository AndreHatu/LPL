<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="cadastro_livros.aspx.cs" Inherits="Projeto.cadastro_livros1" %>

<%@ Register Src="~/UCLogin.ascx" TagPrefix="uc1" TagName="UCLogin" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Cadastre Seu Livro</title>
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
                    <uc1:UCLogin runat="server" ID="UCLogin"/>
                </div>
            </div>

            <div class="row">
                <asp:Label runat="server" BackColor="Green" Font-Size="XX-Large" ID="lblSucesso" CssClass="label label-success"></asp:Label>
            </div>
            <div class="row white row-padding-extra round">

                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <div class="col-md-4">
                            <div>
                                <asp:FileUpload runat="server" ID="txtFoto" accept="image/*" onchange="imagepreview(this)" />
                                <asp:Image runat="server" ID="imgprw" AlternateText="Selecione uma imagem com o botão acima" Width="280" />

                                <div>
                                    <asp:Label ID="lblErroCapa" runat="server" ForeColor="Red"></asp:Label>
                                </div>
                            </div>
                            &nbsp;
                                
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
                <div class="col-md-8">
                    <div class="form-horizontal">
                        <div class="form-group">
                            <label for="txtNomeLivro" class="col-md-3 control-label">Nome do Livro:</label>
                            <div class="col-md-9">
                                <asp:TextBox runat="server" CssClass="form-control" ID="txtNomeLivro" placeholder="Nome do Livro"></asp:TextBox>
                                <asp:Label runat="server" ID="lblErroLivro" Text="" ForeColor="Red"></asp:Label>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="txtAutor" class="col-md-3 control-label">Autor:</label>
                            <div class="col-md-9">
                                <asp:TextBox runat="server" CssClass="form-control" ID="txtAutor" placeholder="Nome do Autor Aqui"></asp:TextBox>
                                <asp:Label runat="server" ID="lblErroAutor" Text="" ForeColor="Red"></asp:Label>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="dropGeneros" class="col-md-3 control-label">Gênero:</label>
                            <div class="col-md-9">
                                <asp:DropDownList runat="server" ID="dropGeneros" CssClass="form-control"></asp:DropDownList>
                                <asp:Label runat="server" ID="lblErroGenero" ForeColor="Red"></asp:Label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-3"></div>
                            <div class="col-md-6">
                                <div>
                                    <asp:RadioButton runat="server" ID="chkDidatico" Text="Livro Didático" GroupName="groupDidatico" />
                                </div>
                                <div>
                                    <asp:RadioButton runat="server" ID="chkNaoDidatico" Text="Livro Não Didático" GroupName="groupDidatico" />
                                </div>
                                <asp:Label runat="server" ID="lblErroDidatico" Text="" ForeColor="Red"></asp:Label>
                            </div>
                            <div class="col-md-3"></div>
                        </div>
                        <div class="form-group">
                            <label for="txtResumo" class="col-md-3 control-label">Resumo:</label>
                            <div class="col-md-9">
                                <div class="row">
                                    <asp:TextBox runat="server" ID="txtResumo"
                                        Rows="4" ToolTip="Resuma o livro que está cadastrando!" Wrap="true" MaxLength="500"
                                        placeholder="Escreva aqui o que você achou do livro ou dê uma sinopse para o próximo leitor!"
                                        TextMode="MultiLine" Width="560px"></asp:TextBox>
                                </div>
                                <div class="row">
                                    <asp:Label runat="server" Text="Max. 500 Carcteres" Font-Size="XX-Small"></asp:Label>
                                    <asp:Label runat="server" ID="lblErroSinopse" Text="" ForeColor="Red"></asp:Label>
                                </div>
                            </div>
                        </div>
                        <div class="text-center row">
                            <asp:Button runat="server" CssClass="btn btn-success btn-lg" Text="Cadastrar Livro" ID="btnCadastrarLivro" OnClick="btnCadastrarLivro_Click" />
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
