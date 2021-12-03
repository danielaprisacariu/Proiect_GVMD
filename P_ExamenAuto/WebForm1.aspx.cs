using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ZedGraph;
using ZedGraph.Web;
using MongoDB.Driver;
using MongoDB.Bson;
using System.Net;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System.Globalization;

namespace P_ExamenAuto
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            MongoClient dbClient = new MongoClient("mongodb+srv://prisacariuDaniela:stud@cluster0.h7f3d.mongodb.net");
            var db = dbClient.GetDatabase("s_auto;");
            var collection = db.GetCollection<BsonDocument>("examene");

            var docs = collection.Find(new BsonDocument()).ToList();


            string[] json = new string[docs.Count];
            int i = 0;
            foreach (var v in docs)
            {
                json[i] = v.ToString();
                i++;
            }
            string all = "[";
            for (int j = 0; j < json.Length; j++)
            {
                all += json[j] + ",";
            }
            all = all + "]";


            GridView2.DataSource = Newtonsoft.Json.JsonConvert.DeserializeObject<DataTable>(all);
            GridView2.DataBind();

            if (!Page.IsPostBack)
            {
                var instructori = db.GetCollection<BsonDocument>("instructori");
                var documente = instructori.Find(new BsonDocument()).ToList();
                string[] vect = new string[documente.Count];
                int k = 0;
                foreach (var d in documente)
                {
                    var data = (JObject)JsonConvert.DeserializeObject(d.ToString());
                    string instructor = data["_id"].Value<string>() + " " + data["nume"].Value<string>() + " " + data["prenume"].Value<string>();
                    vect[k] = instructor;
                    k++;
                }


                DropDownList2.DataSource = vect;
                DropDownList2.DataBind();

                var cursantiCollection = db.GetCollection<BsonDocument>("cursanti");
                var cursanti = cursantiCollection.Find(new BsonDocument()).ToList();
                string[] vectCursanti = new string[cursanti.Count];
                int l = 0;
                foreach (var d in cursanti)
                {
                    var data = (JObject)JsonConvert.DeserializeObject(d.ToString());
                    string cursant = data["_id"].Value<string>() + " " + data["nume"].Value<string>() + " " + data["prenume"].Value<string>();
                    vectCursanti[l] = cursant;
                    l++;
                }


                DropDownList1.DataSource = vectCursanti;
                DropDownList1.DataBind();
            }
            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                string instructor = DropDownList2.SelectedItem.ToString();
                string cursant = DropDownList1.SelectedItem.ToString();
                string calificativ = DropDownList3.SelectedItem.ToString();
                string data = tbData.Text;

                string[] i1 = instructor.Split(' ');
                string[] c1 = cursant.Split(' ');

                MongoClient dbClient = new MongoClient("mongodb+srv://prisacariuDaniela:stud@cluster0.h7f3d.mongodb.net");
                var db = dbClient.GetDatabase("s_auto;");
                var collection = db.GetCollection<BsonDocument>("examene");

                var examene = collection.Find(new BsonDocument()).ToList();


                var inregistrareNoua = new BsonDocument {
                {"_id", examene.Count + 1},
                {"idCursant", c1[0] },
                {"calificativ", calificativ },
                {"data", data },
                {"idInstructor", i1[0] }
                };

                collection.InsertOne(inregistrareNoua);

                Page_Load(sender, e);
            }
            catch(Exception ex)
            {
                tbMes.Text += ex.Message;
            }

            MultiView1.ActiveViewIndex = -1;
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 0;
        }

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            DateTime data = Calendar1.SelectedDate;
            tbData.Text = data.ToShortDateString();
        }

        protected void tbnProcedura_Click(object sender, EventArgs e)
        {
            MongoClient dbClient = new MongoClient("mongodb+srv://prisacariuDaniela:stud@cluster0.h7f3d.mongodb.net");
            var db = dbClient.GetDatabase("s_auto;");
            var collection = db.GetCollection<BsonDocument>("cursanti");

            var catalog = db.GetCollection<BsonDocument>("examene");
            

            var filter = Builders<BsonDocument>.Filter.Eq("calificativ", ddlCalificativ.SelectedItem.ToString());
            var cursantiCautati = catalog.Find(filter).ToList();

            int[] vectCursanti = new int[cursantiCautati.Count];
            int l = 0;
            foreach (var d in cursantiCautati)
            {
                var data = (JObject)JsonConvert.DeserializeObject(d.ToString());
                int idCursant = data["idCursant"].Value<int>();
                vectCursanti[l] = idCursant;
                l++;
            }

  
            string[] json = new string[vectCursanti.Length];
            int i = 0;
            for (int j = 0; j < vectCursanti.Length; j++)
            {
                var filtruCursanti = Builders<BsonDocument>.Filter.Eq("_id", vectCursanti[j]);
                var cursant = collection.Find(filtruCursanti).FirstOrDefault();
                json[i] = cursant.ToString();
                i++;
            }

            string all = "[";
            for (int j = 0; j < json.Length; j++)
            {
                all += json[j] + ",";
            }
            all = all + "]";


            GridView3.DataSource = Newtonsoft.Json.JsonConvert.DeserializeObject<DataTable>(all);
            GridView3.DataBind();

            if (ddlCalificativ.SelectedItem.ToString().Equals("admis"))
            {
                lNrCursanti.Text = vectCursanti.Length + " cursanti au luat carnetul!";
            }
            else
            {
                lNrCursanti.Text = vectCursanti.Length + " cursanti au picat examenul!";
            }

            MultiView1.ActiveViewIndex = 1;
        }

        protected void btnStergeCalificativ_Click(object sender, EventArgs e)
        {
            MongoClient dbClient = new MongoClient("mongodb+srv://prisacariuDaniela:stud@cluster0.h7f3d.mongodb.net");
            var db = dbClient.GetDatabase("s_auto;");
            var collection = db.GetCollection<BsonDocument>("examene");

            var filter = Builders<BsonDocument>.Filter.Eq("_id", Convert.ToInt32(GridView2.SelectedRow.Cells[1].Text));

            collection.DeleteOne(filter);

            Page_Load(sender, e);
        }
    }
}