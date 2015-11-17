using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace chmv4
{
    public partial class PersonalMenegment : System.Web.UI.Page
    {
        SqlConnection cn = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\2Dent_000\Documents\GitHub\Chmv-6\chmv4\chmv4\App_Data\forexample.mdf;Integrated Security=True");
        SqlCommand cmd = new SqlCommand();
        SqlDataReader dr;

        protected void Page_Load(object sender, EventArgs e)
        {
            cmd.Connection = cn;
        }

        protected void btnToMain_Click(object sender, EventArgs e)
        {
            Server.Transfer("Default.aspx", true);
        }

        protected void DropDownList3_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid)
            {
                return;
            }
            cn.Open();
            cmd.CommandText = "select Username from Users where Username like @Name";
            ListBox1.Items.Clear();
            cmd.Parameters.AddWithValue("@Name", "%" + TextBox1.Text + "%");
            dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    ListBox1.Items.Add(dr[0].ToString());
                }
            }
            else
            {
                ListBox1.Items.Add("Ничего не найдено!");
            }
            cmd.Parameters.Clear();
            dr.Close();
            cn.Close();
            cmd.Parameters.Clear();
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            cn.Open();
            string name = string.Empty;
            cmd.CommandText = "update Users set Rights='" + DropDownList1.Text + "' where Username=@Name";
            cmd.Parameters.AddWithValue("@Name", ListBox1.SelectedItem.ToString());
            Label2.Text = "Права пользователя '" + ListBox1.SelectedItem.ToString() + "' изменены на '" + DropDownList1.Text + "'";

            cmd.ExecuteNonQuery();
            cmd.Clone();
            cn.Close();
            cmd.Parameters.Clear();
            GridView1.DataBind();
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
       
    }
}