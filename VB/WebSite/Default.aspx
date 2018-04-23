<%@ Page Language="vb" AutoEventWireup="true"  CodeFile="Default.aspx.vb" Inherits="_Default" %>

<%@ Register assembly="DevExpress.Web.ASPxGridView.v10.1, Version=10.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxEditors.v10.1, Version=10.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<title></title>
</head>
<body>
	<form id="form1" runat="server">

	<dx:aspxgridview ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" 
		DataSourceID="AccessDataSource1" KeyFieldName="CategoryID" 
		onrowupdated="ASPxGridView1_RowUpdated">
		<clientsideevents EndCallback="function(s, e) {
	if (s.cpIsUpdated != '')
	{
	   clientLabel.SetText('The category '+s.cpIsUpdated+' is updated successfully');
	   clientLabel.GetMainElement().style.backgroundColor = 'green';
	   clientLabel.GetMainElement().style.color = 'white';
	}
	else
	{
	   clientLabel.SetText('');
	}
}" />
		<columns>
			<dx:gridviewcommandcolumn VisibleIndex="0">
				<editbutton Visible="True">
				</editbutton>
			</dx:gridviewcommandcolumn>
			<dx:gridviewdatatextcolumn FieldName="CategoryID" ReadOnly="True" 
				VisibleIndex="1">
				<editformsettings Visible="False" />
			</dx:gridviewdatatextcolumn>
			<dx:gridviewdatatextcolumn FieldName="CategoryName" ReadOnly="True" 
				VisibleIndex="2">
			</dx:gridviewdatatextcolumn>
			<dx:gridviewdatatextcolumn FieldName="Description" ReadOnly="True" 
				VisibleIndex="3">
			</dx:gridviewdatatextcolumn>
		</columns>
	</dx:aspxgridview>
	<asp:accessdatasource ID="AccessDataSource1" runat="server" 
		DataFile="~/App_Data/nwind.mdb" 
		DeleteCommand="DELETE FROM [Categories] WHERE [CategoryID] = ?" 
		InsertCommand="INSERT INTO [Categories] ([CategoryID], [CategoryName], [Description], [Picture]) VALUES (?, ?, ?, ?)" 
		SelectCommand="SELECT * FROM [Categories]" 
		UpdateCommand="UPDATE [Categories] SET [CategoryName] = ?, [Description] = ?, [Picture] = ? WHERE [CategoryID] = ?">
		<deleteparameters>
			<asp:parameter Name="CategoryID" Type="Int32" />
		</deleteparameters>
		<updateparameters>
			<asp:parameter Name="CategoryName" Type="String" />
			<asp:parameter Name="Description" Type="String" />
			<asp:parameter Name="Picture" Type="Object" />
			<asp:parameter Name="CategoryID" Type="Int32" />
		</updateparameters>
		<insertparameters>
			<asp:parameter Name="CategoryID" Type="Int32" />
			<asp:parameter Name="CategoryName" Type="String" />
			<asp:parameter Name="Description" Type="String" />
			<asp:parameter Name="Picture" Type="Object" />
		</insertparameters>
	</asp:accessdatasource>
	<dx:aspxlabel ID="ASPxLabel1" runat="server" ClientInstanceName="clientLabel">
	</dx:aspxlabel>

	</form>
</body>
</html>