using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace chmv4
{
    public partial class red : System.Web.UI.UserControl
    {
        SqlConnection cn = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\gener\Documents\GitHub\Chmv_4\test\chmv4\chmv4\App_Data\forexample.mdf;Integrated Security=True");
        SqlCommand cmd = new SqlCommand();
        SqlDataReader dr;

        protected void Page_Load(object sender, EventArgs e)
        {
            cmd.Connection = cn;
        }

        protected void btnAddcategory_Click(object sender, EventArgs e)
        {
          
            if (!Page.IsValid)
            {
                return;
            }
            cn.Open();
            cmd.CommandText = "Select * from Categories";
            dr = cmd.ExecuteReader();
            bool flag = true;
            if (dr.HasRows)
            {

                while (dr.Read())
                {
                    if (dr[0].ToString() == txtCategoryName.Text)
                    {
                        Label1.Text="Такая категория уже существует!";
                        return;
                    }
                }
            }
            dr.Close();
            if (flag)
            {

                cmd.CommandText = "insert into Categories (Category) values(@Cat)";
                cmd.Parameters.AddWithValue("@Cat", txtCategoryName.Text);
                cmd.ExecuteNonQuery();
                cmd.Clone();
                Label1.Text="Категория успешно добавлена!";
                dr.Close();
                cn.Close();

                
                txtCategoryName.Text = string.Empty;
            }
        }
        

        protected void btnAddProduct_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid)
            {
                return;
            }
            Label1.Text = "Товар " + txtProductName.Text + " успешно добавлен в категорию " + ddlCategories.SelectedValue;
        }

        protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
        {
            Random rand = new Random();
            int k = rand.Next(1, 100);
            if (k >= 80)
            {
                args.IsValid = false;
            }
            else
            {
                args.IsValid = true;
            }
        }
    }
}