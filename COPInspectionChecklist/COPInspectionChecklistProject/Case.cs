using System;
using System.Collections.Generic;

namespace COPInspectionChecklistProject
{
    public class Case {
        public string caseNumber { get; set; }
        public string propertyAddress { get; set; }
        public string responsibleParty { get; set; }
        public string mailingAddress { get; set; }
        public string emailAddress { get; set; }
        public string applicantPhone { get; set; }
        public string dwellingInfo { get; set; }
        public int numUnits { get; set; }
        public string ownerName { get; set; }
        public string ownerPhone { get; set; }
        public bool sidewalkFees { get; set; }
        public string inspector { get; set; }
        public string inspectorEmail { get; set; }
        public DateTime inspectionDate { get; set; }
        public DateTime reinspectionDate { get; set; }
        public string inspector_ID { get; set; }
        public string property_ID { get; set; }
        //added by Chaode He 3/17/2017
        public string inspectionType { get; set; }
        public string inspectionStatus { get; set; }
        public List<violations> violationList { get; set; }
        //end
        public Case() { }
        public Case(string newCaseNumb) {
            caseNumber = newCaseNumb;
        }
        public Case(string caseNum, string propAdd, string resParty, string mail, string email, string appPhone, string dwell, int units, string owner,
                string ownPhone, bool fees, string inspect, string inspectEmail, DateTime insDate, DateTime reinsDate, string inspID, string propID)
        {
            caseNumber = caseNum;
            propertyAddress = propAdd;
            responsibleParty = resParty;
            mailingAddress = mail;
            emailAddress = email;
            applicantPhone = appPhone;
            dwellingInfo = dwell;
            numUnits = units;
            ownerName = owner;
            ownerPhone = ownPhone;
            sidewalkFees = fees;
            inspector = inspect;
            inspectorEmail = inspectEmail;
            inspectionDate = insDate;
            reinspectionDate = reinsDate;
            inspector_ID = inspID;
            property_ID = propID;
        }
    }
    public class violations
    {
        private string _SectionID;
        private bool _majorV;
        private bool _minorV;
        private string _noteV;

        public string Section_ID { get { return _SectionID; } set { _SectionID = value; } }
        public bool MajorV { get { return _majorV; } set { _majorV = value; } }
        public bool MinorV { get { return _minorV; } set { _minorV = value; } }
        public string NoteV { get { return _noteV; } set { _noteV = value; } }
    }
}