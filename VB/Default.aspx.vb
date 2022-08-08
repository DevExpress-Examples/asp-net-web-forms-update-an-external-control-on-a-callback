Imports System
Imports DevExpress.Web

Partial Public Class _Default
	Inherits System.Web.UI.Page

	Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)
		ASPxGridView1.JSProperties("cpIsUpdated") = ""
	End Sub
	Protected Sub ASPxGridView1_RowUpdated(ByVal sender As Object, ByVal e As DevExpress.Web.Data.ASPxDataUpdatedEventArgs)
		If e.Exception Is Nothing Then
			DirectCast(sender, ASPxGridView).JSProperties("cpIsUpdated") = e.Keys(0)
		End If
	End Sub
End Class
