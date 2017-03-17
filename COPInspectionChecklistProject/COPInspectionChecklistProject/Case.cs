using System;

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
        public int inspector_ID { get; set; }
        public int property_ID { get; set; }

        public string inspectionType { get; set; }
        public string inspectionStatus { get; set; }
        public Case() { }
        public Case(string newCaseNumb) {
            caseNumber = newCaseNumb;
        }
        public Case(string caseNum, string propAdd, string resParty, string mail, string email, string appPhone, string dwell, int units, string owner,
                string ownPhone, bool fees, string inspect, string inspectEmail, DateTime insDate, DateTime reinsDate, int inspID, int propID)
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
}