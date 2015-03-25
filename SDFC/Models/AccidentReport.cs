using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SDFC.Models
{
    public class AccidentReport
    {
        public string Name { get; set; }
        public string Comments { get; set; }
        public string VictimName { get; set; }
        public string Address { get; set; }
        public string Phone { get; set; }
        public int Age { get; set; }
        public bool Male { get; set; }
        public int Activity { get; set; }
        public int location { get; set; }
        public int Action { get; set; }
        public int InjuryType { get; set; }
        public int InjuryLocation { get; set; }
        public int Treatment { get; set; }
        public string Treator { get; set; }
        public bool FacilitiesManagemet { get; set; }
        public bool PoliceContacted { get; set; }
        public string ReportNumber { get; set; }
        public DateTime TimeCalled { get; set; }
        public DateTime ArrivalTime { get; set; }
        public string TransportedTo { get; set; }
        public string MedicalReport { get; set; }
        public string PositionTitles { get; set; }
        public bool ManagerCalled { get; set; }
        public string WhyNot { get; set; }
        public string Description { get; set; }
        public string WitnessName { get; set; }
        public string WitnessPhone { get; set; }


    }
}