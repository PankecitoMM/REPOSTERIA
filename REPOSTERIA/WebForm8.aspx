<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="WebForm8.aspx.vb" Inherits="REPOSTERIA.WebForm8" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            CONSULTA CANTIDAD COMPRADA</div>
        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="CantidadComprada" DataValueField="CantidadComprada">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:REPOSTERIAConnectionString %>" SelectCommand="SELECT [CantidadComprada] FROM [ComprasPankes]"></asp:SqlDataSource>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2">
            <Columns>
                <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
                <asp:BoundField DataField="CantidadComprada" HeaderText="CantidadComprada" SortExpression="CantidadComprada" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:REPOSTERIAConnectionString %>" SelectCommand="SELECT        Pankes.Nombre, ComprasPankes.CantidadComprada
FROM            Pankes INNER JOIN
                         ComprasPankes ON Pankes.ID = ComprasPankes.PankeID
						 WHERE (ComprasPankes.CantidadComprada=@Nombre)">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" Name="Nombre" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
        <p>
            CONSULTA PROVEDORES</p>
        <p>
            <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource3" DataTextField="Nombre" DataValueField="Nombre">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:REPOSTERIAConnectionString %>" SelectCommand="SELECT [Nombre] FROM [ProveedoresPankes]"></asp:SqlDataSource>
        </p>
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource4">
            <Columns>
                <asp:BoundField DataField="Tipo" HeaderText="Tipo" SortExpression="Tipo" />
                <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:REPOSTERIAConnectionString %>" SelectCommand="SELECT        Pankes.Tipo, ProveedoresPankes.Nombre
FROM            Pankes INNER JOIN
                         ProveedoresPankes ON Pankes.ID = ProveedoresPankes.ID
						 WHERE(ProveedoresPankes.Nombre=@Nombre)">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList2" Name="Nombre" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
        <p>
            CONSULTA UBICACIONES TIENDAS</p>
        <p>
            <asp:DropDownList ID="DropDownList3" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource5" DataTextField="Direccion" DataValueField="Direccion">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:REPOSTERIAConnectionString %>" SelectCommand="SELECT [Direccion] FROM [UbicacionesTiendas]"></asp:SqlDataSource>
        </p>
        <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource6">
            <Columns>
                <asp:BoundField DataField="NombreTienda" HeaderText="NombreTienda" SortExpression="NombreTienda" />
                <asp:BoundField DataField="Direccion" HeaderText="Direccion" SortExpression="Direccion" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:REPOSTERIAConnectionString %>" SelectCommand="SELECT        UbicacionesTiendas.NombreTienda, ProveedoresPankes.Direccion
FROM            UbicacionesTiendas INNER JOIN
                         ProveedoresPankes ON UbicacionesTiendas.ID = ProveedoresPankes.ID
						 WHERE(ProveedoresPankes.Direccion=@Nombre)">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList3" Name="Nombre" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
