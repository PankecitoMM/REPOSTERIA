<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Calendario.aspx.vb" Inherits="REPOSTERIA.WebForm5" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            BUSCAR COMPRA POR FECHA</div>
        <p>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Calendario</p>
        <asp:Calendar ID="Calendar1" runat="server"></asp:Calendar>
        <asp:Button ID="Button1" runat="server" Text="Buscar" />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                <asp:BoundField DataField="PankeID" HeaderText="PankeID" SortExpression="PankeID" />
                <asp:BoundField DataField="ProveedorID" HeaderText="ProveedorID" SortExpression="ProveedorID" />
                <asp:BoundField DataField="FechaCompra" HeaderText="FechaCompra" SortExpression="FechaCompra" />
                <asp:BoundField DataField="CantidadComprada" HeaderText="CantidadComprada" SortExpression="CantidadComprada" />
                <asp:BoundField DataField="PrecioTotal" HeaderText="PrecioTotal" SortExpression="PrecioTotal" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:REPOSTERIAConnectionString %>" SelectCommand="BuscarComprasPorFecha" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:ControlParameter ControlID="Calendar1" DbType="Date" Name="FechaCompra" PropertyName="SelectedDate" />
            </SelectParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
