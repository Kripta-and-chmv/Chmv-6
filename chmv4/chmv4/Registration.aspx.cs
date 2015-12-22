using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace chmv4
{
    public partial class Registration : System.Web.UI.Page
    {
        SqlConnection cn = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\gener\Documents\GitHub\Chmv-6\chmv4\chmv4\App_Data\forexample.mdf;Integrated Security=True");
        SqlCommand cmd = new SqlCommand();
        SqlDataReader dr;
        protected void Page_Load(object sender, EventArgs e)
        {
            cmd.Connection = cn;
        }
        private bool checkTextBox(string type)
        {
            if (txtLogin.Text == string.Empty)
            {
                Label1.Text="Введите имя пользователя!";
                return false;
            }
            if (txtPass.Text == string.Empty)
            {
                Label1.Text = "Введите пароль!";
                return false;
            }
            if (type == "Регистрация")
            {
                if (txtEmail.Text == string.Empty)
                {
                    Label1.Text = "Введите почту!";
                    return false;
                }
                if (txtPass.Text != txtRepeatPas.Text)
                {
                    Label1.Text = "Пароли не совпадают!";
                    return false;
                }
            }
            return true;
        }
        private int checkNameMail()
        {
            int flag = 0;

            cn.Open();

            cmd.CommandText = "Select * from Users";
            dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {

                while (dr.Read())
                {
                    if (dr[0].ToString() == txtLogin.Text)
                    {
                        flag += 1;
                        break;
                    }
                }
            }
            dr.Close();

            cmd.CommandText = "Select * from Emails";
            dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {

                while (dr.Read())
                {
                    if (dr[0].ToString() == txtEmail.Text)
                    {
                        flag += 2;
                        break;
                    }
                }
            }
            dr.Close();
            cn.Close();

            return flag;
        }
        protected void btnEnterReg_Click(object sender, EventArgs e)
        {
           
            string rights = "User";
            bool flagTxtBox = checkTextBox(btnEnterReg.Text);
            if (!flagTxtBox)
                return;
            if (btnEnterReg.Text == "Регистрация")
            {

                int flag = checkNameMail();
                cn.Open();


                if (flag == 0)
                {
                    cmd.CommandText = "insert into Users (Username, Password, Email, Rights) values(@Login, @Pass,@Mail,@Right)";
                    cmd.Parameters.AddWithValue("@Login", txtLogin.Text);
                    cmd.Parameters.AddWithValue("@Pass", txtPass.Text);
                    cmd.Parameters.AddWithValue("@Mail", txtEmail.Text);
                    cmd.Parameters.AddWithValue("@Right", rights);

                    cmd.ExecuteNonQuery();
                    cmd.Clone();
                    cmd.CommandText = "insert into Emails (Email) values('" + txtEmail.Text + "')";
                    cmd.ExecuteNonQuery();
                    cmd.Clone();
                    cmd.Parameters.Clear();
                    Label1.Text="Регистрация успешно завершена!";


                    cn.Close();

                    _default.name = txtLogin.Text;
                    _default.rights = "User";
                    Server.Transfer("Default.aspx", true);


                }

                if (flag == 3)
                {
                    Label1.Text="Введённая почта и имя пользователя уже существуют";
                }
                if (flag == 1)
                {
                    Label1.Text = "Введённое имя пользователя уже существует";
                }
                if (flag == 2)
                {
                    Label1.Text = "Введённая почта уже существует";
                }



            }
            else
            {

                int flag = checkNameMail();
                if (flag == 1)
                {
                    cn.Open();

                    cmd.CommandText = "Select * from Users";
                    dr = cmd.ExecuteReader();
                    if (dr.HasRows)
                    {

                        while (dr.Read())
                        {
                            if (dr[0].ToString() == txtLogin.Text)
                            {
                                if (dr[1].ToString() != txtPass.Text)
                                {
                                    Label1.Text = "Неверный пароль!";
                                    dr.Close();
                                    cn.Close();
                                    return;
                                }
                                rights = dr[3].ToString();
                                break;
                            }
                        }
                    }
                    dr.Close();
                    cn.Close();

                    _default.rights= rights;
                    _default.name=txtLogin.Text;

                    Server.Transfer("Default.aspx", true);

                }
                if (flag == 0)
                {
                    Label1.Text = "Данного пользователя не существует!";
                    return;
                }
            }
            cn.Close();
            return;
        }

        protected void btnChangeTable_Click(object sender, EventArgs e)
        {
            if(MultiView1.ActiveViewIndex==1)
            {
                ltRegText.Text = "Уже зарегистрированы?";
                btnChangeTable.Text = "Войти";
                MultiView1.ActiveViewIndex = 0;
                btnEnterReg.Text = "Регистрация";
            }
            else
            {
                ltRegText.Text = "Ещё не зарегистрированы?";
                btnChangeTable.Text = "Зарегистрироваться";
                MultiView1.ActiveViewIndex = 1;
                btnEnterReg.Text = "Вход";
            }

        }

        protected void MultiView1_Init(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 1;
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Server.Transfer("Default.aspx", true);
        }
    }
}