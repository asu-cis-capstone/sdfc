using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Net;
using MySql.Data.MySqlClient;
using System.Data;

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
            string connectionString = WebConfigurationManager.AppSettings["ConnectionString"];

            //create db connection
            myConnection = new MySqlConnection(connectionString);
        }

        /// <summary>
        /// Attempts to authenticate user against database
        /// </summary>
        /// <param name="userName">User's asurite ID</param>
        /// <param name="password">User's password</param>
        /// <returns></returns>
        public bool LogIn(string userName, string password)
        {
            //create command
            MySqlCommand cmd = new MySqlCommand("SELECT * FROM employee WHERE asurite='"+userName+"' AND password='"+password+"'");          
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

        public bool AddReport(AccidentReport report)
        {
            //temporary
            //create command
            MySqlCommand cmd = new MySqlCommand("SomeProcedure");
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddRange(new MySqlParameter[] {
                new MySqlParameter("", report.Action),
                new MySqlParameter("", report.Activity),
                new MySqlParameter("", report.Address),
                new MySqlParameter("", report.Age),
                new MySqlParameter("", report.ArrivalTime),
                new MySqlParameter("", report.Comments),
                new MySqlParameter("", report.Description),
                new MySqlParameter("", report.FacilitiesManagemet),
                new MySqlParameter("", report.InjuryLocation),
                new MySqlParameter("", report.InjuryType),
                new MySqlParameter("", report.location),
                new MySqlParameter("", report.Male),
                new MySqlParameter("", report.ManagerCalled),
                new MySqlParameter("", report.MedicalReport),
                new MySqlParameter("", report.Name),
                new MySqlParameter("", report.Phone),
                new MySqlParameter("", report.PoliceContacted),
                new MySqlParameter("", report.PositionTitles),
                new MySqlParameter("", report.ReportNumber),
                new MySqlParameter("", report.SignatureJSON),
                new MySqlParameter("", report.TimeCalled),
                new MySqlParameter("", report.TransportedTo),
                new MySqlParameter("", report.Treatment),
                new MySqlParameter("", report.Treator),
                new MySqlParameter("", report.VictimName),
                new MySqlParameter("", report.WhyNot),
                new MySqlParameter("", report.WitnessName),
                new MySqlParameter("", report.WitnessPhone)
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
                result = reader.HasRows;
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
            return true;
        }
    }
}