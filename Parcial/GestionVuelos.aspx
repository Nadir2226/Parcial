<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GestionVuelos.aspx.cs" Inherits="Parcial.GestionVuelos" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
             <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Menu.aspx">Volver</asp:HyperLink>
            <br />
            <asp:Label ID="Label1" runat="server" Text="Vuelos"></asp:Label>
            <br />
            <br />
            <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource2" DataTextField="nombreAerolinea" DataValueField="idAerolinea">
            </asp:DropDownList>
            <asp:TextBox ID="TextBox2" placeholder= "N° de Vuelo" runat="server"></asp:TextBox>
            <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="Agregar" />
            <asp:Label ID="Label2" runat="server"></asp:Label>
            <br />
            <br />
            <asp:TextBox ID="TextBox1" runat="server" ></asp:TextBox>
            <br />
            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2" DataTextField="nombreAerolinea" DataValueField="idAerolinea">
            </asp:DropDownList>
            <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Actualizar" />
        </div>

        <div class="row mt-2">
            <div class ="col-9">
                
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="id" DataSourceID="SqlDataSource1" EmptyDataText="No hay registros de datos para mostrar." ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" Width="600px">
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
            </div>
            <div class="col-3">
        <asp:GridView ID="GVdatos" Width="300px" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDSCantidadVuelos" CellPadding="4" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="nombreAerolinea" HeaderText="Aerolinea" SortExpression="nombreAerolinea" />
                <asp:BoundField DataField="cantidad" HeaderText="Vuelos" ReadOnly="True" SortExpression="cantidad" />
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

            </div>


        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Conexion %>" DeleteCommand="DELETE FROM [Vuelos] WHERE [id] = @id" InsertCommand="INSERT INTO [Vuelos] ([numeroVuelo], [idAerolinea]) VALUES (@numeroVuelo, @idAerolinea)" ProviderName="<%$ ConnectionStrings:Conexion.ProviderName %>" SelectCommand="SELECT Vuelos.id, Vuelos.numeroVuelo, Vuelos.idAerolinea, Aerolineas.nombreAerolinea FROM Vuelos INNER JOIN Aerolineas ON Vuelos.idAerolinea = Aerolineas.idAerolinea
" UpdateCommand="UPDATE [Vuelos] SET [numeroVuelo] = @numeroVuelo, [idAerolinea] = @idAerolinea WHERE [id] = @id">
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
        <asp:SqlDataSource ID="SqlDSCantidadVuelos" runat="server" ConnectionString="<%$ ConnectionStrings:Conexion %>" SelectCommand="select  a.nombreAerolinea, count(v.id) cantidad from Vuelos v,Aerolineas a
where v.idAerolinea= a.idAerolinea
group by a.nombreAerolinea"></asp:SqlDataSource>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    </form>
</body>
</html>
