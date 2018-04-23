<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ComboDataBound._Default" %>

<%@ Register Assembly="DevExpress.Web.v8.2, Version=8.2.3.0, Culture=neutral, PublicKeyToken=9b171c9fd64da1d1"
    Namespace="DevExpress.Web.ASPxDataView" TagPrefix="dxdv" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v8.2, Version=8.2.3.0, Culture=neutral, PublicKeyToken=9b171c9fd64da1d1"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="125px" AutoGenerateRows="False" DataSourceID="dsTerritories" DataKeyNames="TerritoryID" DefaultMode="Edit">
            <Fields>
                <asp:BoundField DataField="TerritoryID" HeaderText="TerritoryID" ReadOnly="True"
                    SortExpression="TerritoryID" />
                <asp:BoundField DataField="TerritoryDescription" HeaderText="TerritoryDescription"
                    SortExpression="TerritoryDescription" />
                <asp:TemplateField>
                    <EditItemTemplate>
                        <dxe:ASPxComboBox ID="ASPxComboBox1" runat="server" DataSourceID="dsRegions" TextField="RegionDescription"
                            Value='<%# Bind("RegionID") %>' ValueField="RegionID" ValueType="System.Int32">
                        </dxe:ASPxComboBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <dxe:ASPxComboBox ID="ASPxComboBox2" runat="server" DataSourceID="dsRegions" TextField="RegionDescription"
                            Value='<%# Eval("RegionID") %>' ValueField="RegionID" ValueType="System.Int32" Enabled="False">
                            <DropDownButton Visible="False">
                            </DropDownButton>
                        </dxe:ASPxComboBox>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:CommandField ShowEditButton="True" />
            </Fields>
            
        </asp:DetailsView>
        <asp:SqlDataSource ID="dsTerritories" runat="server" ConnectionString="<%$ ConnectionStrings:NorthwindConnectionString %>"
            SelectCommand="SELECT * FROM [Territories]"
            UpdateCommand="UPDATE [Territories] SET [TerritoryDescription] = @TerritoryDescription, [RegionID] = @RegionID WHERE [TerritoryID] = @TerritoryID">
            <UpdateParameters>
                <asp:Parameter Name="TerritoryDescription" Type="String" />
                <asp:Parameter Name="RegionID" Type="Int32" />
                <asp:Parameter Name="TerritoryID" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
                        <asp:SqlDataSource ID="dsRegions" runat="server" ConnectionString="<%$ ConnectionStrings:NorthwindConnectionString %>"
                            SelectCommand="SELECT * FROM [Region]"></asp:SqlDataSource>
    </div>
    </form>
</body>
</html>
