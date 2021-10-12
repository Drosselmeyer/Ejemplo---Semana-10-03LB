using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Diagnostics;

namespace Ejemplo_Registro_Notas
{
    public partial class RegistroAlumno : System.Web.UI.Page
    {
        //Nuestra variable de coneccion
        SqlConnection con = null;
        string query = "";

        protected void Page_Load(object sender, EventArgs e)
        {

        }
        
        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            try
            {
                //Creamos la conexion a la bdd
                con = new SqlConnection("Data Source=.\\SQLEXPRESS;Initial Catalog=RegistroNotas03LB;Integrated Security=True");

                //Creamos la query de insercion
                query = "INSERT INTO Alumno(Nombre,Grado,Seccion) VALUES" +
                        "('" + txtNombre.Text + "','" + txtGrado.Text + "','" + txtSeccion.Text + "')";

                //Mandamos el query a la cola
                SqlCommand comando = new SqlCommand(query, con);

                //Abrimos la conexion
                con.Open();

                //Ejecutamos el comando
                int status = comando.ExecuteNonQuery();

                if (status >= 1)
                {
                    //lblInsercion.Text = "El valor se insertado correctamente";
                    txtNombre.Text = "";
                    txtGrado.Text = "";
                    txtSeccion.Text = "";
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error: "+ex);
            }
            finally
            {
                con.Close();
            }
        }
    }
}