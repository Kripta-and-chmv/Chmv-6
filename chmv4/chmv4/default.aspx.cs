using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace chmv4
{
    public partial class _default : System.Web.UI.Page
    {
        SqlConnection cn = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\gener\Documents\GitHub\Chmv-6\chmv4\chmv4\App_Data\forexample.mdf;Integrated Security=True");
        SqlCommand cmd = new SqlCommand();
        SqlDataReader dr;
        public static string rights = "User";
        public static string name= "Вы не зашли в систему";
        string notenter = "Вы не зашли в систему";

        protected void Page_Load(object sender, EventArgs e)
        {
            cmd.Connection = cn;
            //LoadCategories();
            Label1.Text = string.Empty;
            if (Label2.Text != name)
            {
                Label2.Text = "Добро пожаловать, " + name + "!";
            }
            else
            {
                Label2.Text = notenter;
            }
            if (rights == "User")
            {
                CheckBox1.Visible = false;
                btnToManagement.Visible = false;
            }
            if (rights == "SuperAdministrator")
            {
                CheckBox1.Visible = true;
                btnToManagement.Visible = true;
            }
            if (rights == "Administrator")
            {
                CheckBox1.Visible = true;
                btnToManagement.Visible = false;
            }
        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {

        }

        protected void name_TextChanged(object sender, EventArgs e)
        {

        }



        protected void Button1_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid)
            {
                return;
            }
            if ((txtFrom.Text != string.Empty) && (txtTo.Text != string.Empty))
                cmd.CommandText = "select Name from Product where Name like @Name and Categories like @Cat and Price >= " + txtFrom.Text + " and Price <=" + txtTo.Text;
            if ((txtFrom.Text == string.Empty) && (txtTo.Text == string.Empty))
                cmd.CommandText = "select Name from Product where Name like @Name and Categories like @Cat";
            if ((txtFrom.Text != string.Empty) && (txtTo.Text == string.Empty))
                cmd.CommandText = "select Name from Product where Name like @Name and Categories like @Cat and Price >= " + txtFrom.Text;
            if ((txtFrom.Text == string.Empty) && (txtTo.Text != string.Empty))
                cmd.CommandText = "select Name from Product where Name like @Name and Categories like @Cat and Price <=" + txtTo.Text;
            ListBox1.Items.Clear();

            cmd.Parameters.AddWithValue("@Name", "%" + txtName.Text + "%");
            cmd.Parameters.AddWithValue("@Cat", "%" + ddlFindCategory.Text + "%");
            cn.Open();
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
            txtName.Text = string.Empty;
            txtFrom.Text = string.Empty;
            txtTo.Text = string.Empty;
        }




        protected void ddlFindCategory_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void MultiView1_ActiveViewChanged(object sender, EventArgs e)
        {

        }

        protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
        {
            if (CheckBox1.Checked)
            {
                MultiView1.ActiveViewIndex = 0;
            }
            else
            {
                MultiView1.ActiveViewIndex = 1;
            }
        }

        protected void btnEnterance_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid)
            {

            }
            else
            {
                Server.Transfer("Registration.aspx", true);
            }

        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Server.Transfer("Registration.aspx", true);
        }

        protected void MultiView1_Init(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 1;
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Server.Transfer("PersonalManagement.aspx", true);
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
        //Добавление категории
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
                        Label1.Text = "Такая категория уже существует!";
                        return;
                    }
                }
            }
            dr.Close();
            if (flag)
            {

                cmd.CommandText = "insert into Categories (Categories) values(@Cat)";
                cmd.Parameters.AddWithValue("@Cat", txtCategoryName.Text);
                cmd.ExecuteNonQuery();
                cmd.Clone();
                Label1.Text = "Категория успешно добавлена!";
                dr.Close();
                cn.Close();
                ddlCategories.Items.Add(txtCategoryName.Text);
                ddlFindCategory.Items.Add(txtCategoryName.Text);
               
                txtCategoryName.Text = string.Empty;
            }
        }

        //добавление товара
        protected void btnAddProduct_Click(object sender, EventArgs e)
        {
            if ((ddlCategories.Text == string.Empty) || (ddlCategories.Text == "Категория"))
            {
                Label1.Text = "Введите категорию";
                return;
            }
            if ((txtProductName.Text == string.Empty) || (txtProductName.Text == "Название товара"))
            {
                Label1.Text = "Введите название товара";
                return;
            }
            if ((txtProductPrice.Text == string.Empty) || (txtProductPrice.Text == "Цена товара"))
            {
                Label1.Text = "Введите цену товара";
                return;
            }

            cn.Open();
            cmd.CommandText = "Select * from Product";
            dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                bool flag = false;
                while (dr.Read())
                {
                    if ((dr[0].ToString() == ddlCategories.Text) && (dr[1].ToString() == txtProductName.Text))
                    {
                        Label1.Text = "Товар '" + txtProductName.Text + "' в категории '" + ddlCategories.Text + "' уже существует!";
                        flag = true;
                        cn.Close();
                        return;
                    }
                }
                dr.Close();
                if (!flag)
                {
                    cmd.CommandText = "insert into Product (Categories, Name, Price) values(@Cat, @Name, @Price)";
                    cmd.Parameters.AddWithValue("@Name", txtProductName.Text);
                    cmd.Parameters.AddWithValue("@Cat", ddlCategories.Text);
                    cmd.Parameters.AddWithValue("@Price", txtProductPrice.Text);
                    cmd.ExecuteNonQuery();
                    cmd.Clone();
                    Label1.Text = "Товар '" + txtProductName.Text + "' успешно добавлен в категорию '" + ddlCategories.Text + "'";
                    cn.Close();
                }
            }
            dr.Close();


            cmd.Parameters.Clear();
            txtProductName.Text = string.Empty;
            txtProductPrice.Text = string.Empty;
        }

        protected void ListBox1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void GridView1_PageIndexChanged(object sender, EventArgs e)
        {
            System.Threading.Thread.Sleep(1000);
        }


        //
    }
}