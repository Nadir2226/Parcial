<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GestionAerolineas.aspx.cs" Inherits="Parcial.GestionAerolineas" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <br />
            <br />
            <asp:TextBox ID="TextBox1" runat="server" Width="265px"></asp:TextBox>
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Agregar" Width="92px" />
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="idAerolinea" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" Height="349px" Width="366px">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="idAerolinea" HeaderText="idAerolinea" InsertVisible="False" ReadOnly="True" SortExpression="idAerolinea" />
                    <asp:BoundField DataField="nombreAerolinea" HeaderText="Aerolinea" SortExpression="nombreAerolinea" />
                    <asp:CommandField ButtonType="Button" ShowDeleteButton="True" ShowEditButton="True" />
                </Columns>
                <EditRowStyle BackColor="#2461BF" />
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                <SortedDescendingHeaderStyle BackColor="#4870BE" />
            </asp:GridView>
            <br />
        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Conexion %>" DeleteCommand="DELETE FROM [Aerolineas] WHERE [idAerolinea] = @idAerolinea" InsertCommand="INSERT INTO [Aerolineas] ([nombreAerolinea]) VALUES (@nombreAerolinea)" ProviderName="<%$ ConnectionStrings:Conexion.ProviderName %>" SelectCommand="SELECT * FROM [Aerolineas]" UpdateCommand="UPDATE [Aerolineas] SET [nombreAerolinea] = @nombreAerolinea WHERE [idAerolinea] = @idAerolinea">
            <DeleteParameters>
                <asp:Parameter Name="idAerolinea" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:ControlParameter ControlID="TextBox1" Name="nombreAerolinea" PropertyName="Text" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="nombreAerolinea" Type="String" />
                <asp:Parameter Name="idAerolinea" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
