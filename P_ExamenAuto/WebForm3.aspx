<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm3.aspx.cs" Inherits="P_ExamenAuto.WebForm3" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
		<link rel="stylesheet" media="screen" href="~/styles/StyleSheet1.css" />

</head>
<body>
    <form id="form1" runat="server">
		<div>
			 <asp:ImageButton ID="btnInapoi" runat="server" Height="22px" ImageUrl="~/arrow.png" OnClick="btnInapoi_Click1" Width="29px" />
		</div>
        <div id ="main">
        	<br />
			<br />
        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        	<asp:Label ID="titlu" runat="server" ForeColor="#003399" Text="Adauga Instructor"></asp:Label>
			<br />
			<br />
			<br />
			<asp:Label ID="Label1" runat="server" Text="Nume:"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<asp:TextBox ID="tbNume" runat="server" Height="22px" style="margin-left: 2px" Width="169px"></asp:TextBox>
			<br />
			<br />
			<asp:Label ID="Label2" runat="server" Text="Prenume:"></asp:Label>
&nbsp;&nbsp;<asp:TextBox ID="tbPrenume" runat="server" Height="22px" style="margin-left: 2px" Width="169px"></asp:TextBox>
			<br />
			<br />
			&nbsp;
			<asp:Label ID="Label3" runat="server" Text="CNP:"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<asp:TextBox ID="tbCNP" runat="server" Height="22px" style="margin-left: 2px" Width="169px"></asp:TextBox>
			<br />
			&nbsp;<br />
			&nbsp;
			<asp:Label ID="Label4" runat="server" Text="Telefon:"></asp:Label>
&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="tbTelefon" runat="server" Height="22px" style="margin-left: 0px" Width="169px"></asp:TextBox>
			&nbsp;&nbsp;
			&nbsp;
			<br />
			<br />
			<br />
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;<asp:Button ID="btnUpdate" runat="server" Text="Modifica" BackColor="#336699" BorderColor="Black" ForeColor="Black" Height="30px" Width="77px" OnClick="btnUpdate_Click" />
			&nbsp;&nbsp;&nbsp;&nbsp;
			<asp:Button ID="btnAduga" runat="server" Text="Adauga" BackColor="#336699" BorderColor="Black" ForeColor="Black" Height="30px" Width="77px" OnClick="btnAduga_Click" />
			&nbsp;&nbsp;&nbsp;&nbsp;
			<asp:Button ID="btnDelete" runat="server" Text="Sterge" BackColor="#336699" BorderColor="Black" ForeColor="Black" Height="30px" Width="77px" OnClick="btnDelete_Click" />
			<br />
			<br />
			<br />
			<div id="main1">
			    <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" Height="300px" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" Width="781px">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:CommandField ShowSelectButton="True" />
                    </Columns>
                    <EditRowStyle BackColor="#999999" />
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#E9E7E2" />
                    <SortedAscendingHeaderStyle BackColor="#506C8C" />
                    <SortedDescendingCellStyle BackColor="#FFFDF8" />
                    <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                </asp:GridView>
        	&nbsp;
        	<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbScoalaAutoConnectionString %>" DeleteCommand="DELETE FROM [tblInstructori] WHERE [IdInstructor] = @IdInstructor" InsertCommand="INSERT INTO [tblInstructori] ([IdInstructor], [Nume], [Prenume], [Telefon], [CNP]) VALUES (@IdInstructor, @Nume, @Prenume, @Telefon, @CNP)" SelectCommand="SELECT * FROM [tblInstructori]" UpdateCommand="UPDATE [tblInstructori] SET [Nume] = @Nume, [Prenume] = @Prenume, [Telefon] = @Telefon, [CNP] = @CNP WHERE [IdInstructor] = @IdInstructor AND (@Nume IS NOT NULL) AND (@Prenume is not null) AND (@Telefon IS NOT NULL) AND (@CNP IS NOT NULL)">
				<DeleteParameters>
					<asp:Parameter Name="IdInstructor" Type="Int32" />
				</DeleteParameters>
				<InsertParameters>
					<asp:Parameter Name="IdInstructor" Type="Int32" />
					<asp:Parameter Name="Nume" Type="String" />
					<asp:Parameter Name="Prenume" Type="String" />
					<asp:Parameter Name="Telefon" Type="String" />
					<asp:Parameter Name="CNP" Type="String" />
				</InsertParameters>
				<UpdateParameters>
					<asp:Parameter Name="Nume" Type="String" />
					<asp:Parameter Name="Prenume" Type="String" />
					<asp:Parameter Name="Telefon" Type="String" />
					<asp:Parameter Name="CNP" Type="String" />
					<asp:Parameter Name="IdInstructor" Type="Int32" />
				</UpdateParameters>
			</asp:SqlDataSource>
				</div>
        </div>
		<div>
        		<asp:TextBox ID="tbMes" runat="server" BackColor="#C8DFE6" Height="57px" TextMode="MultiLine" Width="320px"></asp:TextBox>
        </div>
    </form>
    
        
    
</body>
</html>
