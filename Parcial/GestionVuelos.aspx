<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GestionVuelos.aspx.cs" Inherits="Parcial.GestionVuelos" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="Label1" runat="server" Text="Vuelos"></asp:Label>
            <br />
            <br />
            <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource2" DataTextField="nombreAerolinea" DataValueField="idAerolinea" Height="16px" Width="134px">
            </asp:DropDownList>
            <asp:TextBox ID="TextBox2" placeholder= "N° de Vuelo" runat="server" Width="106px"></asp:TextBox>
            <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="Agregar" Width="98px" />
            <asp:Label ID="Label2" runat="server"></asp:Label>
            <br />
            <br />
            <asp:TextBox ID="TextBox1" runat="server" Width="243px"></asp:TextBox>
            <br />
            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2" DataTextField="nombreAerolinea" DataValueField="idAerolinea" Height="16px" Width="250px">
            </asp:DropDownList>
            <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Actualizar" Width="98px" />
        </div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="id" DataSourceID="SqlDataSource1" EmptyDataText="No hay registros de datos para mostrar." ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" Width="407px">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                <asp:BoundField DataField="numeroVuelo" HeaderText="numeroVuelo" SortExpression="numeroVuelo" />
                <asp:BoundField DataField="idAerolinea" SortExpression="idAerolinea" />
                <asp:BoundField DataField="nombreAerolinea" HeaderText="Aerolinea" SortExpression="nombreAerolinea" />
                <asp:CommandField ButtonType="Button" ShowSelectButton="True" ShowDeleteButton="True" />
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
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Conexion %>" DeleteCommand="DELETE FROM [Vuelos] WHERE [id] = @id" InsertCommand="INSERT INTO [Vuelos] ([numeroVuelo], [idAerolinea]) VALUES (@numeroVuelo, @idAerolinea)" ProviderName="<%$ ConnectionStrings:Conexion.ProviderName %>" SelectCommand="SELECT Vuelos.id, Vuelos.numeroVuelo, Vuelos.idAerolinea, Aerolineas.nombreAerolinea FROM Vuelos INNER JOIN Aerolineas ON Vuelos.idAerolinea = Aerolineas.idAerolinea" UpdateCommand="UPDATE [Vuelos] SET [numeroVuelo] = @numeroVuelo, [idAerolinea] = @idAerolinea WHERE [id] = @id">
            <DeleteParameters>
                <asp:Parameter Name="id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:ControlParameter ControlID="TextBox2" Name="numeroVuelo" PropertyName="Text" Type="Int32" />
                <asp:ControlParameter ControlID="DropDownList2" Name="idAerolinea" PropertyName="SelectedValue" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:ControlParameter ControlID="TextBox1" Name="numeroVuelo" PropertyName="Text" Type="Int32" />
                <asp:ControlParameter ControlID="DropDownList1" Name="idAerolinea" PropertyName="SelectedValue" Type="Int32" />
                <asp:ControlParameter ControlID="GridView1" Name="id" PropertyName="SelectedValue" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Conexion %>" SelectCommand="SELECT * FROM [Aerolineas]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:Conexion %>" SelectCommand="SELECT * FROM [Aerolineas]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:Conexion %>" DeleteCommand="DELETE FROM [Aerolineas] WHERE [idAerolinea] = @idAerolinea" InsertCommand="INSERT INTO [Aerolineas] ([nombreAerolinea]) VALUES (@nombreAerolinea)" SelectCommand="SELECT * FROM [Aerolineas]" UpdateCommand="UPDATE [Aerolineas] SET [nombreAerolinea] = @nombreAerolinea WHERE [idAerolinea] = @idAerolinea">
            <DeleteParameters>
                <asp:Parameter Name="idAerolinea" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="nombreAerolinea" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="nombreAerolinea" Type="String" />
                <asp:Parameter Name="idAerolinea" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
