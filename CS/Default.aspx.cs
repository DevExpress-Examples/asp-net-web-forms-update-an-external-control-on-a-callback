using System;
using DevExpress.Web;

public partial class _Default : System.Web.UI.Page {
    protected void Page_Load(object sender, EventArgs e) {
        ASPxGridView1.JSProperties["cpIsUpdated"] = "";
    }
    protected void ASPxGridView1_RowUpdated(object sender, DevExpress.Web.Data.ASPxDataUpdatedEventArgs e) {
        if (e.Exception == null) {
            ((ASPxGridView)sender).JSProperties["cpIsUpdated"] = e.Keys[0];
        }
    }
}
