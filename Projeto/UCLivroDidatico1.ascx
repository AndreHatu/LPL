﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UCLivroDidatico1.ascx.cs" Inherits="Projeto.UCLivroDidatico1" %>
<div class="col-md-9 grey row-padding-small round">
    <div class="row">
        <div class="col-md-2 col-sm-2">
            <img src="http://statics.livrariacultura.net.br/products/capas_lg/166/593166.jpg" height="100" />
        </div>
        <div class="col-md-10 col-sm-10 text-Lgrey">
            <div class="row font-size-20 text-left">
                <asp:Label runat="server" ID="lblLivro1" Text="Dicionário Houaiss"></asp:Label>

            </div>
            <div class="row dotted-top-border col-md-11 col-sm-11">
                <asp:Label runat="server" ID="lblGeneroLivro" Text="Instituto Antônio Houaiss"></asp:Label>

            </div>
            <div class="col-md-1 col-sm-1"></div>
            &nbsp
		&nbsp
		<div class="row">
            <div class="col-md-10"></div>
            <div class="col-md-2 text-">
                <button type="button" class="btn btn-info">Ler Mais</button>
            </div>

        </div>
        </div>
    </div>
</div>
