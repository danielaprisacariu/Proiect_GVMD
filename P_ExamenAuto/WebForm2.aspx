<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm2.aspx.cs" Inherits="P_ExamenAuto.WebForm2" UnobtrusiveValidationMode="None"%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
	<link rel="stylesheet" media="screen" href="~/styles/StyleSheet1.css" />
</head>
<body>
    <form id="form1" runat="server">
		<div><asp:ImageButton ID="btnInapoi" runat="server" Height="22px" ImageUrl="~/arrow.png" OnClick="btnInapoi_Click1" Width="29px" />
     </div>
        <div id ="main">
        	<br />
			<br />
        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        	<asp:Label ID="titlu" runat="server" ForeColor="#003399" Text="Adauga cursant"></asp:Label>
			<br />
			<br />
			<br />
			&nbsp;&nbsp;&nbsp;
			<asp:Label ID="Label1" runat="server" Text="Nume:"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<asp:TextBox ID="tbNume" runat="server" Height="22px" style="margin-left: 2px" Width="169px"></asp:TextBox>
			<br />
			<br />
			&nbsp;&nbsp;&nbsp;
			<asp:Label ID="Label2" runat="server" Text="Prenume:"></asp:Label>
&nbsp; <asp:TextBox ID="tbPrenume" runat="server" Height="22px" style="margin-left: 2px" Width="169px"></asp:TextBox>
			<br />
			<br />
			&nbsp;&nbsp; &nbsp;&nbsp;
			<asp:Label ID="Label3" runat="server" Text="CNP:"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<asp:TextBox ID="tbCNP" runat="server" Height="22px" style="margin-left: 2px" Width="169px"></asp:TextBox>
			<br />
			&nbsp;<br />
			&nbsp;&nbsp;&nbsp;&nbsp;
			<asp:Label ID="Label4" runat="server" Text="Telefon:"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;
			<asp:TextBox ID="tbTelefon" runat="server" Height="22px" style="margin-left: 0px" Width="169px"></asp:TextBox>
			&nbsp;
			<br />
			<br />
			&nbsp;&nbsp;&nbsp;
			<asp:Label ID="Label5" runat="server" Text="Localitate:"></asp:Label>
            &nbsp;&nbsp;&nbsp;
			<asp:TextBox ID="tbAdresa" runat="server" Height="63px" style="margin-left: 0px" TextMode="MultiLine" Width="169px"></asp:TextBox>
			&nbsp;
			<br />
			<br />
			<br />
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="btnUpdate" runat="server" Text="Modifica" BackColor="#336699" BorderColor="Black" ForeColor="Black" Height="30px" Width="77px" OnClick="btnUpdate_Click" />
			&nbsp;&nbsp;&nbsp;
			<asp:Button ID="btnAduga" runat="server" Text="Adauga" BackColor="#336699" BorderColor="Black" ForeColor="Black" Height="30px" Width="72px" OnClick="btnAduga_Click" />
			&nbsp;&nbsp;&nbsp;
			<asp:Button ID="btnDelete" runat="server" Text="Sterge" BackColor="#336699" BorderColor="Black" ForeColor="Black" Height="30px" Width="77px" OnClick="btnDelete_Click" />
			<br />
			<br />
			<br />
			<div id="main1">
                <asp:GridView ID="GridView1" runat="server" Height="166px" Width="1063px" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateSelectButton="True" OnSelectedIndexChanged="GridView2_SelectedIndexChanged">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <EditRowStyle BackColor="#999999" />
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <sortedascendingcellstyle backcolor="#E9E7E2" />
                    <sortedascendingheaderstyle backcolor="#506C8C" />
                    <sorteddescendingcellstyle backcolor="#FFFDF8" />
                    <sorteddescendingheaderstyle backcolor="#6F8DAE" />
                </asp:GridView>

        		</div>
        </div>
        <p>

                <asp:TextBox ID="TextBox1" runat="server" Height="111px" TextMode="MultiLine" Width="314px" BackColor="#C8DFE6"></asp:TextBox>
        
        		</p>
    </form>
</body>
</html>
