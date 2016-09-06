<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Teste.aspx.cs" Inherits="Projeto.Teste" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
		<asp:ListBox ID="ListBox1" runat="server" SelectionMode="Multiple" Rows="10">
			<asp:ListItem>1</asp:ListItem>
			<asp:ListItem>djgfjdgf</asp:ListItem>
			<asp:ListItem>2</asp:ListItem>
			<asp:ListItem>3</asp:ListItem>
			<asp:ListItem>4</asp:ListItem>
			<asp:ListItem>5</asp:ListItem>
			<asp:ListItem>6</asp:ListItem>
		</asp:ListBox>
		<script type="text/javascript" src="/js/utils.js"></script>
		<script type="text/javascript">
			var ListBox1 = document.getElementById("ListBox1");
			ListBox1.onmousedown = function (e) {
				if (e.target.tagName == "OPTION") {
					e.target.selected = !e.target.selected;
				}
				ListBox1.focus();
				return cancelEvent(e);
			};
			ListBox1.onmousemove = cancelEvent;
		</script>
    </div>
    </form>
</body>
</html>
