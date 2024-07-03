<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Grafica.aspx.vb" Inherits="REPOSTERIA.WebForm6" %><%@ Register assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
        <asp:Chart ID="Chart1" runat="server" DataSourceID="SqlDataSource1">
            <series>
                <asp:Series Name="Series1" XValueMember="Nombre" YValueMembers="Expr1">
                </asp:Series>
            </series>
            <chartareas>
                <asp:ChartArea Name="ChartArea1">
                </asp:ChartArea>
            </chartareas>
        </asp:Chart>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:REPOSTERIAConnectionString %>" SelectCommand="SELECT        TOP (1000) Pankes.Nombre, SUM(ComprasPankes.PrecioTotal) AS Expr1
FROM            Pankes INNER JOIN
                         ComprasPankes ON Pankes.ID = ComprasPankes.PankeID
GROUP BY Pankes.Nombre"></asp:SqlDataSource>
    </form>
</body>
</html>
