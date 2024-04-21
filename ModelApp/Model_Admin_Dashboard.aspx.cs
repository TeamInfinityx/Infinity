using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;
using System.Configuration;
using usrKyc = KYC.Userkyc;

public partial class Admin_Dashboard : System.Web.UI.Page
{
    public string usrName;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Uid"] == null)
        {
            string login_url = ConfigurationManager.AppSettings["login_page_url"];
           // Response.Write("<script>window.top.location.replace('" + login_url + "');</script>");
        }
        if (Session["Uname"] != null)
        {
            usrName = Session["Uname"].ToString();
            if (usrName.Equals(""))
            {
               usrName="Not Avialable" ;
            }
        }
    }
    protected void userLogout(object sender, EventArgs e)
    {
        Session.RemoveAll();
        Response.Redirect("ModelAdminLogin.aspx");

    }

}