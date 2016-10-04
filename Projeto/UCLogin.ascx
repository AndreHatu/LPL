<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UCLogin.ascx.cs" Inherits="Projeto.UCLogin" %>

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
                <img alt="Brand" src="LPL.png" width="58" height="40" /></a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav navbar-right">				
                <li><a href="cadastro_livros.aspx">Adicionar Livros</a></li>
                <li><a href="gerenciar_livros.aspx">Gerenciar Livros</a></li>
                <li><a href="livros_didaticos.aspx">Livros Didáticos</a></li>
				<li><a href="gerenciar_livros.aspx">Livros Trocados <span class="badge"><asp:Label runat="server" ID="lblTrocados"></asp:Label></span></a></li>
				<li><img title="" src="<%=CaminhoDaImagem %> "+ ".png" width="25" height="25"/></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                        <img src="/Avatar.ashx?id=<%=IdUsuario %>" class="round" alt="Foto de Usuario" width="25" height="25" />
                        <asp:Label runat="server" ID="lblNome"></asp:Label>
                        <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="#"><i class="glyphicon glyphicon-user"></i> Ver Perfil</a></li>
                        <li><a href="ComplementosEdicao.aspx"><i class="glyphicon glyphicon-pencil"></i> Editar Perfil</a></li>
                        <li><a href="Likes.aspx"><i class="glyphicon glyphicon-thumbs-up"></i> Editar Likes/Dislikes</a></li>
                        <li><a href="gerenciar_livros.aspx"><i class="glyphicon glyphicon-book"></i> Gerenciar Livros</a></li>
                        <li><a href="#"><i class="glyphicon glyphicon-cog"></i> Editar Preferências</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="logout.aspx"><i class="glyphicon glyphicon-off"></i> Sair</a></li>
                    </ul>
                </li>
                <li><a href="Notificacoes.aspx" class="btn btn-link"><i class="glyphicon glyphicon-bell"></i></a></li>
            </ul>
        </div>
        <!-- /.navbar-collapse -->
    </div>
    <!-- /.container-fluid -->
</nav>
