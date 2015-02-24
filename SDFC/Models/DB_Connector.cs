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
    }
}