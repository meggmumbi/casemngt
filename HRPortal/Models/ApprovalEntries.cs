﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace HRPortal.Models
{
    public class ApprovalEntries
    {
        public int SequenceNo { get; set; }
        public string Status { get; set; }
        public string SenderId { get; set; }
        public string ApproverId { get; set; }
        public string Amount { get; set; }
        public String DateSentforApproval { get; set; }
        public String Comment { get; set; }
        public String DueDate { get; set; }

    }

    public class ApprovalFilter
    {
        public int TableId { get; set; }
        public String DocumentType { get; set; }
        public String DocumentNo { get; set; }
    }


    public class Country
    {
        public String Name { get; set; }
    }
    public class Ethnicity
    {
        public String Name { get; set; }
    }
    public class PayPeriod
    {
        public String Starting_Date { get; set; }
        public String Name { get; set; }
    }

    public class ProcurementPlan
    {
        public String Code { get; set; }
        public String Description { get; set; }
    }
    public class Item
    {
        public string No { get; set; }
        public String Description { get; set; }
        public string requester { get; set; }
        public string fundcodeid { get; set; }
    }

    public class Driver
    {
        public string driver  { get; set; }
        public string DriverName { get; set; }
    }
    public class Budget
    {
        public string Code { get; set; }
        public string Description { get; set; }
    }





}