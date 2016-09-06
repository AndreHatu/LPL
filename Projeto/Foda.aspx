<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Foda.aspx.cs" Inherits="Projeto.Foda" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>foda</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <asp:Repeater runat="server" ID="fodinha">
		<ItemTemplate>
			<div>
				<img src="/Cover.ashx?id=<%#Eval("Id") %>" alt="Capa do livro" width="64" height="64" />
			</div>
		</ItemTemplate>
    </asp:Repeater>

	<asp:Button runat="server" ID="btnTeste" OnClick="btnTeste_Click" />
    </div>
    </form>
</body>
</html>
