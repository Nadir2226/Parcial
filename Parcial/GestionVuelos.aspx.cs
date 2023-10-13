using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Parcial
{
    public partial class GestionVuelos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            TextBox1.Text = GridView1.SelectedRow.Cells[1].Text;

            DropDownList1.SelectedValue = GridView1.SelectedRow.Cells[2].Text;
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            SqlDataSource1.Update();
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            SqlDataSource1.InsertParameters["numeroVuelo"].DefaultValue = TextBox2.Text;
            SqlDataSource1.InsertParameters["idAerolinea"].DefaultValue = DropDownList2.SelectedValue;

            int result = SqlDataSource1.Insert();

            StreamWriter streamWriter = new StreamWriter($"{Server.MapPath(".")}/archivo.txt", true);
            streamWriter.WriteLine(TextBox2.Text);
            streamWriter.WriteLine(DropDownList2.SelectedItem.Value);
            streamWriter.Close();
            Label2.Text = $"Agregado, ruta del archivo.txt {Server.MapPath(".")} .";

        }
    }
}