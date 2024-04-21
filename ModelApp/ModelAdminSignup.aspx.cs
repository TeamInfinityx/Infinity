using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;
using System.Configuration;
using PasswordHash = HashPassword.PasswordHash;
using System.IO;
public partial class KYC_Signup : System.Web.UI.Page
{
   
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }

    
    [System.Web.Services.WebMethod]
    public static bool RegisterUser(string first_name, string last_name, string email, string password)
    {
       
        bool is_email_exist = true;

        int count = 0;
        string filePath = "user_data.txt";
        using (StreamWriter writer = new StreamWriter(filePath, true))
            {
                writer.WriteLine("First Name: " + first_name);
                writer.WriteLine("Last Name: " + last_name);
                writer.WriteLine("Email: " + email);
                writer.WriteLine("Password: " + password);
                writer.WriteLine(); 
            }
        return is_email_exist;
    }
}