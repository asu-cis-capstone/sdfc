using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SDFC.Models
{
    public class Employee
    {
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string ASURite { get; set; }
        public string Password { get; set; }
        public string Position { get; set; }
        public bool Active { get; set; }
        public bool Manager { get; set; }
        public int ASUID { get; set; }
    }
}