using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SDFC.Models
{
    public class AccidentReport
    {
        private string name;
        private string comments;
        private string victimName;
        private string address;
        private string phone;
        private int age;
        private bool male;
        private int activity;
        private int location;
        private int action;
        private int injuryType;
        private int injuryLocation;
        private int treatment;
        private string treator;
        private bool facilitiesManagemet;
        private bool policeContacted;
        private string reportNumber;
        private DateTime timeCalled;
        private DateTime arrivalTime;
        private string transportedTo;
        private string medicalReport;
        private string positionTitles;
        private bool managerCalled;
        private string whyNot;
        private string description;
        private string witnessName;
        private string witnessPhone;
        private string signatureJSON;

        public string Name 
        {
            get
            {
                return name;
            }
            set
            {
                //check for null
                if (value != null)
                {
                    //check for max length
                    if (value.Length > 55)
                        throw new ArgumentException("Value must be under 55 characters");
                    //check for min length
                    else if (value == "")
                        throw new ArgumentException("Value cannot be empty");
                    else
                        name = value;
                }
                else
                    throw new ArgumentException("Value must not be null");
            }
        }
        public string Comments
        {
            get
            {
                return comments;
            }
            set
            {
                //check for null
                if (value != null)
                {
                    //check for max length
                    if (value.Length > 255)
                        throw new ArgumentException("Value must be under 255 characters");
                    //check for min length
                    else if (value == "")
                        throw new ArgumentException("Value cannot be empty");
                    else
                        comments = value;
                }
                else
                    throw new ArgumentException("Value must not be null");
            }
        }
        public string VictimName
        {
            get
            {
                return victimName;
            }
            set
            {
                //check for null
                if (value != null)
                {
                    //check for max length
                    if (value.Length > 55)
                        throw new ArgumentException("Value must be under 55 characters");
                    //check for min length
                    else if (value == "")
                        throw new ArgumentException("Value cannot be empty");
                    else
                        victimName = value;
                }
                else
                    throw new ArgumentException("Value must not be null");
            }
        }
        public string Address
        {
            get
            {
                return address;
            }
            set
            {
                //check for null
                if (value != null)
                {
                    //check for max length
                    if (value.Length > 255)
                        throw new ArgumentException("Value must be under 255 characters");
                    //check for min length
                    else if (value == "")
                        throw new ArgumentException("Value cannot be empty");
                    else
                        address = value;
                }
                else
                    throw new ArgumentException("Value must not be null");
            }
        }
        public string Phone
        {
            get
            {
                return phone;
            }
            set
            {
                //retrieve value
                string tempNumber = value;

                //check length
                if (tempNumber.Length > 9 && tempNumber.Length < 12)
                {
                    int digitCount = 0;
                    for (int i = 0; i < tempNumber.Length; i++)
                    {
                        int number;
                        if (Int32.TryParse(tempNumber[i].ToString(), out number))
                            digitCount++;
                    }
                    if (digitCount == 9)
                        phone = tempNumber;
                    else
                        throw new ArgumentException("Value must contain 9 digits");
                }
                else
                    throw new ArgumentException("Must be between 10 and 12 characters");
            }
        }
        public int Age
        {
            get
            {
                return age;
            }
            set
            {
                //check if within range
                if (value > 1 && value < 150)
                    age = value;
                else
                    throw new ArgumentException("Value must be between 1 and 150");

            }
        }
        public bool Male
        {
            get
            {
                return male;
            }
            set
            {
                male = value;
            }
        }
        public int Activity
        {
            get
            {
                return activity;
            }
            set
            {
                activity = value;
            }
        }
        public int Location
        {
            get
            {
                return location;
            }
            set
            {
                location = value;
            }
        }
        public int Action
        {
            get
            {
                return action;
            }
            set
            {
                action = value;
            }
        }
        public int InjuryType
        {
            get
            {
                return injuryType;
            }
            set
            {
                injuryType = value;
            }
        }
        public int InjuryLocation
        {
            get
            {
                return injuryLocation;
            }
            set
            {
                injuryLocation = value;
            }
        }
        public int Treatment
        {
            get
            {
                return treatment;
            }
            set
            {
                treatment = value;
            }
        }
        public string Treator
        {
            get
            {
                return treator;
            }
            set
            {
                //check for null
                if (value != null)
                {
                    //check for max length
                    if (value.Length > 55)
                        throw new ArgumentException("Value must be under 55 characters");
                    //check for min length
                    else if (value == "")
                        throw new ArgumentException("Value cannot be empty");
                    else
                        treator = value;
                }
                else
                    throw new ArgumentException("Value must not be null");
            }
        }
        public bool FacilitiesManagemet
        {
            get
            {
                return facilitiesManagemet;
            }
            set
            {
                facilitiesManagemet = false;
            }
        }
        public bool PoliceContacted
        {
            get
            {
                return policeContacted;
            }
            set
            {
                policeContacted = value;
            }
        }
        public string ReportNumber
        {
            get
            {
                return reportNumber;
            }
            set
            {
                //check for null
                if (value != null)
                {
                    //check for max length
                    if (value.Length > 255)
                        throw new ArgumentException("Value must be under 255 characters");
                    //check for min length
                    else if (value == "")
                        throw new ArgumentException("Value cannot be empty");
                    else
                        reportNumber = value;
                }
                else
                    throw new ArgumentException("Value must not be null");
            }
        }
        public DateTime TimeCalled
        {
            get
            {
                return timeCalled;
            }
            set
            {
                timeCalled = value;
            }
        }
        public DateTime ArrivalTime
        {
            get
            {
                return arrivalTime;
            }
            set
            {
                arrivalTime = value;
            }
        }
        public string TransportedTo
        {
            get
            {
                return transportedTo;
            }
            set
            {
                //check for null
                if (value != null)
                {
                    //check for max length
                    if (value.Length > 255)
                        throw new ArgumentException("Value must be under 255 characters");
                    //check for min length
                    else if (value == "")
                        throw new ArgumentException("Value cannot be empty");
                    else
                        transportedTo = value;
                }
                else
                    throw new ArgumentException("Value must not be null");
            }
        }
        public string MedicalReport
        {
            get
            {
                return medicalReport;
            }
            set
            {
                //check for null
                if (value != null)
                {
                    //check for max length
                    if (value.Length > 255)
                        throw new ArgumentException("Value must be under 255 characters");
                    //check for min length
                    else if (value == "")
                        throw new ArgumentException("Value cannot be empty");
                    else
                        medicalReport = value;
                }
                else
                    throw new ArgumentException("Value must not be null");
            }
        }
        public string PositionTitles
        {
            get
            {
                return positionTitles;
            }
            set
            {
                //check for null
                if (value != null)
                {
                    //check for max length
                    if (value.Length > 255)
                        throw new ArgumentException("Value must be under 255 characters");
                    //check for min length
                    else if (value == "")
                        throw new ArgumentException("Value cannot be empty");
                    else
                        positionTitles = value;
                }
                else
                    throw new ArgumentException("Value must not be null");
            }
        }
        public bool ManagerCalled
        {
            get
            {
                return managerCalled;
            }
            set
            {
                managerCalled = value;
            }
        }
        public string WhyNot
        {
            get
            {
                return whyNot;
            }
            set
            {
                //if the manager was not called
                if (!managerCalled)
                {
                    //check for null
                    if (value != null)
                    {
                        //check for max length
                        if (value.Length > 255)
                            throw new ArgumentException("Value must be under 255 characters");
                        //check for min length
                        else if (value == "")
                            throw new ArgumentException("Value cannot be empty");
                        else
                            whyNot = value;
                    }
                    else
                        throw new ArgumentException("Value must not be null");
                }
            }
        }
        public string Description
        {
            get
            {
                return description;
            }
            set
            {
                //check for null
                if (value != null)
                {
                    //check for max length
                    if (value.Length > 255)
                        throw new ArgumentException("Value must be under 255 characters");
                    //check for min length
                    else if (value == "")
                        throw new ArgumentException("Value cannot be empty");
                    else
                        description = value;
                }
                else
                    throw new ArgumentException("Value must not be null");
            }
        }
        public string WitnessName
        {
            get
            {
                return witnessName;
            }
            set
            {
                //check for null
                if (value != null)
                {
                    //check for max length
                    if (value.Length > 255)
                        throw new ArgumentException("Value must be under 255 characters");
                    //check for min length
                    else if (value == "")
                        throw new ArgumentException("Value cannot be empty");
                    else
                        witnessName = value;
                }
                else
                    throw new ArgumentException("Value must not be null");
            }
        }
        public string WitnessPhone
        {
            get
            {
                return witnessPhone;
            }
            set
            {
                //retrieve value
                string tempNumber = value;

                //check length
                if (tempNumber.Length > 9 && tempNumber.Length < 12)
                {
                    int digitCount = 0;
                    for (int i = 0; i < tempNumber.Length; i++)
                    {
                        int number;
                        if (Int32.TryParse(tempNumber[i].ToString(), out number))
                            digitCount++;
                    }
                    if (digitCount == 9)
                        witnessPhone = tempNumber;
                    else
                        throw new ArgumentException("Value must contain 9 digits");
                }
                else
                    throw new ArgumentException("Must be between 10 and 12 characters");
            }
        }
        public string SignatureJSON
        {
            get
            {
                return signatureJSON;
            }
            set
            {
                //check for null
                if (value == null)
                    throw new ArgumentException("Value cannot be null");
                //check for empty string
                else if (value == "")
                    throw new ArgumentException("Value cannot be empty string");

                signatureJSON = value;
            }
        }       


    }
}