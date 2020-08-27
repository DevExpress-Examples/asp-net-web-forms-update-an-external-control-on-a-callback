<%@ Page Language="vb" AutoEventWireup="true" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<%@ Register Assembly="DevExpress.Web.v15.1, Version=15.1.15.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script type="text/javascript">
        function OnEndCallBack(s, e) {
            if (s.cpIsUpdated != '') {
                clientLabel.SetText('The category ' + s.cpIsUpdated + ' is updated successfully');
                clientLabel.GetMainElement().style.backgroundColor = 'green';
                clientLabel.GetMainElement().style.color = 'white';
            }
            else {
                clientLabel.SetText('');
            }
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">

        <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="AccessDataSource1"
            KeyFieldName="CategoryID" OnRowUpdated="ASPxGridView1_RowUpdated">
            <ClientSideEvents EndCallback="OnEndCallBack" />
            <Columns>
                <dx:GridViewCommandColumn VisibleIndex="0" ShowEditButton="true">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn FieldName="CategoryID" ReadOnly="True" VisibleIndex="1">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="CategoryName" ReadOnly="True" VisibleIndex="2">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Description" ReadOnly="True" VisibleIndex="3">
                </dx:GridViewDataTextColumn>
            </Columns>
        </dx:ASPxGridView>
        <asp:AccessDataSource ID="AccessDataSource1" runat="server"
            DataFile="~/App_Data/nwind.mdb"
            DeleteCommand="DELETE FROM [Categories] WHERE [CategoryID] = ?"
            InsertCommand="INSERT INTO [Categories] ([CategoryID], [CategoryName], [Description], [Picture]) VALUES (?, ?, ?, ?)"
            SelectCommand="SELECT * FROM [Categories]"
            UpdateCommand="UPDATE [Categories] SET [CategoryName] = ?, [Description] = ?, [Picture] = ? WHERE [CategoryID] = ?">
            <DeleteParameters>
                <asp:Parameter Name="CategoryID" Type="Int32" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="CategoryName" Type="String" />
                <asp:Parameter Name="Description" Type="String" />
                <asp:Parameter Name="Picture" Type="Object" />
                <asp:Parameter Name="CategoryID" Type="Int32" />
            </UpdateParameters>
            <InsertParameters>
                <asp:Parameter Name="CategoryID" Type="Int32" />
                <asp:Parameter Name="CategoryName" Type="String" />
                <asp:Parameter Name="Description" Type="String" />
                <asp:Parameter Name="Picture" Type="Object" />
            </InsertParameters>
        </asp:AccessDataSource>
        <dx:ASPxLabel ID="ASPxLabel1" runat="server" ClientInstanceName="clientLabel">
        </dx:ASPxLabel>
    </form>
</body>
</html>