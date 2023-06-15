using System;
using System.Data;
using DB_Project.DAL;

namespace DB_Project
{
    public partial class Search : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Search_Button_Click(object sender, EventArgs e)
        {

            String Name = TextBox1.Text;
            DataTable DT = new DataTable();

            Class1 objMyDal = new Class1();

            int found;

            found = objMyDal.SearchItem(Name, ref DT);

            if (found > 0)
            {
                ItemGrid.DataSource = DT;
                ItemGrid.DataBind();
                message.InnerHtml = Convert.ToString("Following Items Found");
            }
            else
            {
                message.InnerHtml = Convert.ToString("Item Not Found");
                ItemGrid.DataSource = null;
                ItemGrid.DataBind();
            }

        }
    }
}