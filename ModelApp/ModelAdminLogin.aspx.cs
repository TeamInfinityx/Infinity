using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;
using System.Configuration;
using PasswordHash = HashPassword.PasswordHash;
using System.IO;
public partial class KYC_Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //Response.Write(test.demo.test.hello());
        if (Session["Uid"] != null)
        {
            int usr_type = Convert.ToInt32(Session["Utype"]);
            string login_url = "Model_Admin_Dashboard.aspx";
            if (usr_type==1)
            {
                login_url = "Model_Admin_Dashboard.aspx";
            }
            Response.Write("<script>window.top.location.replace('" + login_url + "');</script>");
        }
    }

    [System.Web.Services.WebMethod(EnableSession = true)]
    public static UserData ValidateUsr(string email, string password)
    {
        bool is_usr_exist = false;
        UserData usr = new UserData();

        List<string> saltHashList = null;
        List<string> nameLsit = null;
        List<int> idList = null;
        List<int> typeList = null;


        string filePath = "user_data.txt";
        string[] lines = File.ReadAllLines(filePath);

        bool userFound = false;
            for (int i = 0; i < lines.Length; i += 5)
            {
                string storedEmail = lines[i + 2].Split(':')[1].Trim();
                string storedPassword = lines[i + 3].Split(':')[1].Trim();
                if (storedEmail == email && storedPassword == password)
                {
                    userFound = true;
                    string firstName = lines[i].Split(':')[1].Trim();
                    string lastName = lines[i + 1].Split(':')[1].Trim();
                    break;
                }
            }


        usr.isVerified = true;
        usr.usrType = 1;

        return usr;
    }
}
public class UserData
{
    public bool isVerified { get; set; }
    public int usrType {get;set;}
}