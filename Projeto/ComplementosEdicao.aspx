<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ComplementosEdicao.aspx.cs" Inherits="Projeto.ComplementosEdicao" %>

<%@ Register Src="~/UCLogin.ascx" TagPrefix="uc1" TagName="UCLogin" %>


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Edite seu perfil</title>
    <link rel="stylesheet" type="text/css" href="/css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="/css/personal-css.css" />

    <style type="text/css">
        
    </style>
</head>
<body>
    <form id="form2" runat="server">
        <div>
            <div class="container">
                <div class="row">
                    <div>
                        <uc1:UCLogin runat="server" ID="UCLogin" OnLoad="UCLogin_Load" />
                    </div>
                </div>
                <div class="row">
                    <asp:Label runat="server" BackColor="Green" Font-Size="XX-Large" ID="lblSucesso" CssClass="label label-success"></asp:Label>
                </div>
                <div class="cadastro col-xs-12 row-padding white round">
                    <asp:Label runat="server" Font-Size="X-Small" CssClass="text-center"></asp:Label>
                    <div class="row">
                        <div class="col-md-6">

                            <div class="form-group">
                                <label for="dropEstados">Estado:</label>
                                <asp:DropDownList runat="server" ID="dropEstados" CssClass="form-control">
                                    <asp:ListItem Text="SELECIONE" Value=""></asp:ListItem>
                                    <asp:ListItem Text="Acre" Value="Acre"></asp:ListItem>
                                    <asp:ListItem Text="Alagoas" Value="Alagoas"></asp:ListItem>
                                    <asp:ListItem Text="Amapá" Value="Amapá"></asp:ListItem>
                                    <asp:ListItem Text="Amazonas" Value="Amazonas"></asp:ListItem>
                                    <asp:ListItem Text="Bahia" Value="Bahia"></asp:ListItem>
                                    <asp:ListItem Text="Ceará" Value="Ceará"></asp:ListItem>
                                    <asp:ListItem Text="Distrito Federal" Value="Distrito Federal"></asp:ListItem>
                                    <asp:ListItem Text="Espírito Santo" Value="Espírito Santo"></asp:ListItem>
                                    <asp:ListItem Text="Goiás" Value="Goiás"></asp:ListItem>
                                    <asp:ListItem Text="Maranhão" Value="Maranhão"></asp:ListItem>
                                    <asp:ListItem Text="Mato Grosso" Value="Mato Grosso"></asp:ListItem>
                                    <asp:ListItem Text="Mato Grosso do Sul" Value="Mato Grosso do Sul"></asp:ListItem>
                                    <asp:ListItem Text="Minas Gerais" Value="Minas Gerais"></asp:ListItem>
                                    <asp:ListItem Text="Pará" Value="Pará"></asp:ListItem>
                                    <asp:ListItem Text="Paraíba" Value="Paraíba"></asp:ListItem>
                                    <asp:ListItem Text="Paraná" Value="Paraná"></asp:ListItem>
                                    <asp:ListItem Text="Pernambuco" Value="Pernambuco"></asp:ListItem>
                                    <asp:ListItem Text="Piauí" Value="Piauí"></asp:ListItem>
                                    <asp:ListItem Text="Rio de Janeiro" Value="Rio de Janeiro"></asp:ListItem>
                                    <asp:ListItem Text="Rio Grande do Norte" Value="Rio Grande do Norte"></asp:ListItem>
                                    <asp:ListItem Text="Rio Grande do Sul" Value="Rio Grande do Sul"></asp:ListItem>
                                    <asp:ListItem Text="Rondônia" Value="Rondônia"></asp:ListItem>
                                    <asp:ListItem Text="Roraima" Value="Roraima"></asp:ListItem>
                                    <asp:ListItem Text="Santa Catarina" Value="Santa Catarina"></asp:ListItem>
                                    <asp:ListItem Text="São Paulo" Value="São Paulo"></asp:ListItem>
                                    <asp:ListItem Text="Sergipe" Value="Sergipe"></asp:ListItem>
                                    <asp:ListItem Text="Tocantins" Value="Tocantins"></asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div class="form-group">
                                <label for="txtSobremim">Sobre mim:</label>
                                <asp:TextBox runat="server" ID="txtSobremim"
                                    Rows="4" ToolTip="Conte-nos um pouco sobre você!" Wrap="true" MaxLength="500"
                                    placeholder="Conte-nos um pouco sobre você!"
                                    CssClass="form-control"
                                    TextMode="MultiLine" Width="540px"></asp:TextBox>
                                <div>
                                    <asp:Label runat="server" Text="Max. 500 Carcteres" Font-Size="XX-Small"></asp:Label>
                                    <asp:Label runat="server" ID="lblErroSobre" Text="" ForeColor="Red"></asp:Label>
                                </div>
                            </div>  
                            <div class="form-group">
                                <label for="txtCelular">Celular:</label>
                                <asp:TextBox runat="server" ID="txtCelular" CssClass="form-control"></asp:TextBox>
                                <asp:Label runat="server" ID="lblErroCelular" ForeColor="Red"></asp:Label>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <label>Avatar:</label>

                            <asp:ScriptManager ID="ScriptManager" runat="server"></asp:ScriptManager>

                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                <ContentTemplate>
                                    <div class="col-md-4">
                                        <div>
                                            <asp:FileUpload runat="server" ID="fuFoto" accept="image/*" onchange="imagepreview(this)" />
                                            <label for="imgprw">Avatar Nova:</label>
                                            <asp:Image runat="server" ID="imgprw" AlternateText="Selecione uma imagem com o botão acima" Width="280" />

                                            <label for="imgLoad">Avatar Anterior:</label>
                                            <asp:Image runat="server" ID="imgLoad" Width="280" />

                                            <div>
                                                <asp:Label ID="lblErroCapa" runat="server" ForeColor="Red"></asp:Label>
                                            </div>
                                        </div>
                                        &nbsp;
                                
                                    </div>
                                </ContentTemplate>
                            </asp:UpdatePanel>


                        </div>
                    </div>
                    <div class="row text-center">
                        <a href="Default.aspx">
                            <asp:Label runat="server" Font-Size="X-Small" Text="Pular esta etapa"></asp:Label></a>
                        <asp:Button runat="server" ID="btnSubmit" CssClass="btn btn btn-primary" Text="Salvar Informações Adicionais" OnClick="btnSalvar_Click" />
                    </div>
                </div>
            </div>
        </div>

        <script type="text/javascript" charset="utf-8" src="/js/jquery-2.2.1.min.js"></script>
        <script type="text/javascript" charset="utf-8" src="/js/jquery.mask.min.js"></script>
        <script type="text/javascript" charset="utf-8" src="/js/bootstrap.min.js"></script>
        <script type="text/javascript" charset="utf-8" src="/js/utils.js"></script>
        <script type="text/javascript">
            window.maskPhone = function (field) {
                $(field).mask("(00) 0000-0000J", { translation: { "J": { pattern: /[\d\D]/g } } });
            }
            maskPhone("#txtCelular");
        </script>
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
        <script type="text/javascript">
            var listGeneros = document.getElementById("listGeneros");
            listGeneros.onmousedown = function (e) {
                if (e.target.tagName == "OPTION") {
                    e.target.selected = !e.target.selected;
                }
                listGeneros.focus();
                return cancelEvent(e);
            };
            listGeneros.onmousemove = cancelEvent;
        </script>
    </form>
</body>
</html>
