using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Net;
using MySql.Data.MySqlClient;
using System.Data;
using SDFC.Utilities;
using System.Drawing;

namespace SDFC.Models
{
    /// <summary>
    /// Class used to CRUD Records in Database
    /// </summary>
    public class DB_Connector
    {
        private MySqlConnection myConnection;

        public DB_Connector()
        {
            //get connection string from web.config
            string connectionString = WebConfigurationManager.ConnectionStrings["cisDB"].ToString();

            //create db connection
            myConnection = new MySqlConnection(connectionString);
        }

        /// <summary>
        /// Attempts to authenticate user against database
        /// </summary>
        /// <param name="userName">User's asurite ID</param>
        /// <param name="password">User's password</param>
        /// <returns></returns>
        public bool LogIn(string userName, string password, ref string ID)
        {
            //create command
            MySqlCommand cmd = new MySqlCommand("SELECT asuID FROM employee WHERE asurite='"+userName+"' AND password='"+password+"'");          
            //create reader
            MySqlDataReader reader = null;

            //give connection to cmd
            cmd.Connection = myConnection;

            //create and initialize boolean to store query result
            bool result = false;

            try
            {
                //open connection to mySql server
                myConnection.Open();
                
                //prepare statement
                cmd.Prepare();

                //run command
                reader = cmd.ExecuteReader();

                //store whether a record was found
                result = reader.HasRows;

                if (result && reader.Read())
                {                    
                    ID =  reader.GetString(0);
                }
            }
            catch (Exception e)
            {
                throw e;
            }
            finally
            {
                //dispose
                myConnection.Close();
            }
            //return query result
            return result;
        }

        public bool AddReport(AccidentReport report, string asuID, string signaturePath)
        {
            //create image and get url
            string relativePath = "";
            string imageURL = CreateImage(report.SignatureJSON, signaturePath);

            //temporary
            //create command
            MySqlCommand cmd = new MySqlCommand("fileReport");
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddRange(new MySqlParameter[] {
                new MySqlParameter("@Actions", report.Action),
                new MySqlParameter("@Activity", report.Activity),
                new MySqlParameter("@Address", report.Address),
                new MySqlParameter("@Age", report.Age),
                new MySqlParameter("@ArrivalTime", report.ArrivalTime),
                new MySqlParameter("@Comments", report.Comments),
                new MySqlParameter("@Description", report.Description),
                //new MySqlParameter("@FacMan", report.FacilitiesManagemet),
                new MySqlParameter("@InjuryLocation", report.InjuryLocation),
                new MySqlParameter("@InjuryType", report.InjuryType),
                new MySqlParameter("@Location", report.Location),
                new MySqlParameter("@Male", report.Male),
                new MySqlParameter("@ManagerCalled", report.ManagerCalled),
                new MySqlParameter("@MedicalReportNo", report.MedicalReport),
                new MySqlParameter("@ASUID", asuID),
                new MySqlParameter("@Phone", report.Phone),
                new MySqlParameter("@PoliceContacted", report.PoliceContacted),
                new MySqlParameter("@PositionTitles", report.PositionTitles),
                new MySqlParameter("@ReportNo", report.ReportNumber),
                new MySqlParameter("@VictimSignature", imageURL),
                new MySqlParameter("@TimeCalled", report.TimeCalled),
                new MySqlParameter("@TransportedTo", report.TransportedTo),
                new MySqlParameter("@Treatment", report.Treatment),
                new MySqlParameter("@Treator", report.Treator),
                new MySqlParameter("@VictimName", report.VictimName),
                new MySqlParameter("@WhyNot", report.WhyNot),
                new MySqlParameter("@WitnessName", report.WitnessName),
                new MySqlParameter("@WitnessPhone", report.WitnessPhone),
                new MySqlParameter("@RefusalSignature", null),
                }
            );
            //create reader
            MySqlDataReader reader = null;

            //give connection to cmd
            cmd.Connection = myConnection;

            //create and initialize boolean to store query result
            bool result = false;

            try
            {
                //open connection to mySql server
                myConnection.Open();

                //prepare statement
                cmd.Prepare();

                //run command
                reader = cmd.ExecuteReader();

                //store whether a record was found
                result = true;
            }
            catch (Exception e)
            {
                result = false;
            }
            finally
            {
                //dispose
                myConnection.Close();
            }
            
            //return query result            
            return result;
        }

        public string CreateImage(string json, string absolutepath)
        {
            //declare random object to create last 2 characters of filename
            Random r = new Random();

            //use combination of date and random 2 digit number to create a unique photo id
            string fileName = DateTime.Now.ToBinary().ToString() + r.Next(10,100).ToString()+".png";
            //remove any - signs
            fileName = fileName.Replace("-", "");

            //create converer
            SignatureToImage converter = new SignatureToImage();
            converter.CanvasHeight = 200;
            converter.CanvasWidth = 600;

            //convert image
            Bitmap image = converter.SigJsonToImage(json);
            //save image
            image.Save(absolutepath+fileName);

            //split string at application root
            string[] components = absolutepath.Split(new string[] { "\\SDFC", "\\wwwroot" }, StringSplitOptions.None);
            //return relative path
            return components[components.Length - 1]+fileName;
        }
        public bool AddEmployee(Employee employee, string asuID)
        {
            //temporary
            //create command
            MySqlCommand cmd = new MySqlCommand("addEmployee");
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddRange(new MySqlParameter[] {
                new MySqlParameter("@ASUID", employee.ASUID),
                new MySqlParameter("@FirstName", employee.FirstName),
                new MySqlParameter("@LastName", employee.LastName),
                new MySqlParameter("@ASURite", employee.ASURite),
                new MySqlParameter("@Password", employee.Password),
                new MySqlParameter("@Position", employee.Position),
                new MySqlParameter("@Active", employee.Active),
                new MySqlParameter("@Manager", employee.Manager),
                }
            );
            //create reader
            MySqlDataReader reader = null;

            //give connection to cmd
            cmd.Connection = myConnection;

            //create and initialize boolean to store query result
            bool result = false;

            try
            {
                //open connection to mySql server
                myConnection.Open();

                //prepare statement
                cmd.Prepare();

                //run command
                reader = cmd.ExecuteReader();

                //store whether a record was found
                result = true;
            }
            catch (Exception e)
            {
                result = false;
            }
            finally
            {
                //dispose
                myConnection.Close();
            }

            //return query result            
            return result;
        }
    }
}