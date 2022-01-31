<!-- default badges list -->
![](https://img.shields.io/endpoint?url=https://codecentral.devexpress.com/api/v1/VersionRange/128535988/10.1.5%2B)
[![](https://img.shields.io/badge/Open_in_DevExpress_Support_Center-FF7200?style=flat-square&logo=DevExpress&logoColor=white)](https://supportcenter.devexpress.com/ticket/details/E2379)
[![](https://img.shields.io/badge/📖_How_to_use_DevExpress_Examples-e9f6fc?style=flat-square)](https://docs.devexpress.com/GeneralInformation/403183)
<!-- default badges end -->
<!-- default file list -->
*Files to look at*:

* [Default.aspx](./CS/WebSite/Default.aspx) (VB: [Default.aspx](./VB/WebSite/Default.aspx))
* [Default.aspx.cs](./CS/WebSite/Default.aspx.cs) (VB: [Default.aspx.vb](./VB/WebSite/Default.aspx.vb))
<!-- default file list end -->
# ASPxGridView - How to update an external control during a callback
<!-- run online -->
**[[Run Online]](https://codecentral.devexpress.com/128535988/)**
<!-- run online end -->


<p>By default, the ASPxGridView works during callbacks and there's no way to update an external control (that isn't a child control of the callback owner) on the server side. The following article describes this limitation in detail:</p><p><a href="https://www.devexpress.com/Support/Center/p/K18387">The Concept of Callbacks</a></p><p>However, the ASPxGridView as any other ASP.NET control has the <a href="http://documentation.devexpress.com/#AspNet/DevExpressWebASPxGridViewASPxGridView_JSPropertiestopic">JSProperties</a> feature that allows passing a value from the  server to the client. Also, the client-side EndCallback is raised each time when a callback is executed successfully.<br />
So, it is possible to set a JSProperty on the server, get it on the <a href="http://documentation.devexpress.com/#AspNet/DevExpressWebASPxGridViewScriptsASPxClientGridView_EndCallbacktopic">EndCallback</a> and change a "target" control using its client-side capabilities.</p><p>This example illustrates how to use the ASPxLabel to identify that the grid was successfully updated. </p><p>A similar approach my be used with any other DevExpress ASP.NET control that can send callbacks (ASPxCallback, ASPxCallbackPanel, ASPxTreeList, ASPxComboBox and so on).</p>

<br/>


