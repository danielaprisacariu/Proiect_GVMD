using MongoDB.Bson;
using MongoDB.Driver;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace P_ExamenAuto
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            MongoClient dbClient = new MongoClient("mongodb+srv://prisacariuDaniela:stud@cluster0.h7f3d.mongodb.net");
            var db = dbClient.GetDatabase("s_auto;");
            var collection = db.GetCollection<BsonDocument>("instructori");

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

            GridView1.DataSource = Newtonsoft.Json.JsonConvert.DeserializeObject<DataTable>(all);
            GridView1.DataBind();
        }

        protected void btnAduga_Click(object sender, EventArgs e)
        {
            try
            {
                MongoClient dbClient = new MongoClient("mongodb+srv://prisacariuDaniela:stud@cluster0.h7f3d.mongodb.net");
                var db = dbClient.GetDatabase("s_auto;");
                var collection = db.GetCollection<BsonDocument>("instructori");


                var firstDoc = collection.Find(new BsonDocument()).FirstOrDefault();

                var docs = collection.Find(new BsonDocument()).ToList();

                string nume = tbNume.Text;
                string prenume = tbPrenume.Text;
                string cnp = tbCNP.Text;
                string telefon = tbTelefon.Text;

                var newDoc = new BsonDocument
                {
                    {"_id", docs.Count + 1},
                    {"nume", nume },
                    {"prenume", prenume},
                    {"cnp", cnp },
                    {"telefon", telefon }
                };

                collection.InsertOne(newDoc);

            }
            catch (Exception ex)
            {
                tbMes.Text += ex.Message;
            }
            finally
            {
                tbNume.Text = string.Empty;
                tbPrenume.Text = string.Empty;
                tbCNP.Text = string.Empty;
                tbTelefon.Text = string.Empty;
            }

            Page_Load(sender, e);

        }

        protected void btnInapoi_Click1(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("webForm1.aspx");
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            tbNume.Text = GridView1.SelectedRow.Cells[2].Text;
            tbPrenume.Text = GridView1.SelectedRow.Cells[3].Text;
            tbCNP.Text = GridView1.SelectedRow.Cells[4].Text;
            tbTelefon.Text = GridView1.SelectedRow.Cells[5].Text;
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            MongoClient dbClient = new MongoClient("mongodb+srv://prisacariuDaniela:stud@cluster0.h7f3d.mongodb.net");
            var db = dbClient.GetDatabase("s_auto;");
            var collection = db.GetCollection<BsonDocument>("instructori");

            string nume = tbNume.Text;
            string prenume = tbPrenume.Text;
            string cnp = tbCNP.Text;
            string telefon = tbTelefon.Text;

            var filter = Builders<BsonDocument>.Filter.Eq("_id", Convert.ToInt32(GridView1.SelectedRow.Cells[1].Text));
            var docVechi = collection.Find(filter).FirstOrDefault();

            var docUpdate = Builders<BsonDocument>.Update.Set("nume", nume);
            collection.UpdateOne(filter, docUpdate);
            docUpdate = Builders<BsonDocument>.Update.Set("prenume", prenume);
            collection.UpdateOne(filter, docUpdate);
            docUpdate = Builders<BsonDocument>.Update.Set("cnp", cnp);
            collection.UpdateOne(filter, docUpdate);
            docUpdate = Builders<BsonDocument>.Update.Set("telefon", telefon);
            collection.UpdateOne(filter, docUpdate);

            Page_Load(sender, e);
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            MongoClient dbClient = new MongoClient("mongodb+srv://prisacariuDaniela:stud@cluster0.h7f3d.mongodb.net");
            var db = dbClient.GetDatabase("s_auto;");
            var collection = db.GetCollection<BsonDocument>("instructori");

            var filter = Builders<BsonDocument>.Filter.Eq("_id", Convert.ToInt32(GridView1.SelectedRow.Cells[1].Text));

            collection.DeleteOne(filter);

            Page_Load(sender, e);

            tbNume.Text = string.Empty;
            tbPrenume.Text = string.Empty;
            tbCNP.Text = string.Empty;
            tbTelefon.Text = string.Empty;
        }
    }
}