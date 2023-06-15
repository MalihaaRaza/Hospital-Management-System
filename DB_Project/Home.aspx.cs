using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DB_Project.DAL;

namespace DB_Project
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            LoadGrid(); // fill the grid every time page loads
        }

        public void LoadGrid()
        {
            Class1 objMyDal = new Class1();
            GridView1.DataSource = objMyDal.SelectItem();//seting data source for this Grid
            GridView1.DataBind(); //bind the data source to this grid
        }
    }
}