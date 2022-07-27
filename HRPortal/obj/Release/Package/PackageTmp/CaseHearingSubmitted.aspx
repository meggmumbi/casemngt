<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CaseHearingSubmitted.aspx.cs" Inherits="HRPortal.CaseHearingSubmitted" %>

<%@ Import Namespace="HRPortal" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-sm-12">
            <ol class="breadcrumb float-sm-right">
                <li class="breadcrumb-item"><a href="Dashboard.aspx">Dashboard</a></li>
                <li class="breadcrumb-item active">Submitted Case Hearings</li>
            </ol>
        </div>
    </div>
    <div class="panel panel-primary">
        <div class="panel-heading">
            Submitted Case Hearings
        </div>
        <div class="panel-body">
            <div runat="server" id="feedback"></div>
            <div class="table-responsive">
                <table id="example1" class="table table-bordered table-striped">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Case Entry</th>
                            <th>Last Hearing Date</th>
                            <th>Next Hearing Date</th>
                            <th>Bring Up Date</th>
                            <th>Attendance</th>
                            <th>Advocates on Record</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            var nav = new Config().ReturnNav();
                            int counter = 0;
                            var headers = nav.CaseHearing.Where(x=> x.Status == "Submitted");
                            foreach (var header in headers)
                            {
                                counter++;
                        %>
                        <tr>
                            <td><% =counter %></td>
                            <td><% =header.Case_Entry%></td>
                            <td><% =header.Last_Hearing_Date%></td>
                            <td><% =header.Next_Hearing_Date%></td>
                            <td><% =header.Bring_Up_Date%></td>
                            <td><% =header.Entry_Type%></td>
                            <td><a href="#" class="btn btn-info"><i class="fa fa-eye"></i>View Advocates on Record</a> </td>
                        </tr>
                        <%
                            } %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</asp:Content>
