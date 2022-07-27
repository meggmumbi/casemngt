<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CaseHearing.aspx.cs" Inherits="HRPortal.CaseHearing" %>

<%@ Import Namespace="System.IO" %>
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
                <li class="breadcrumb-item active">Case Hearing</li>
            </ol>
        </div>
    </div>
    <%
        int step = 1;
        try
        {
            step = Convert.ToInt32(Request.QueryString["step"]);
            if (step > 3 || step < 1)
            {
                step = 1;
            }
        }
        catch (Exception)
        {
            step = 1;
        }
        if (step == 1)
        {
    %>
    <div class="panel panel-primary">
        <div class="panel-heading">
            Case Hearing Details   
            <span class="pull-right"><i class="fa fa-chevron-left"></i>Step 1 of 3<i class="fa fa-chevron-right"></i></span><span class="clearfix"></span>
        </div>
        <div class="panel-body">
            <div id="generalFeedback" runat="server"></div>
            <div class="row">
                <div class="col-lg-6 col-sm-6">
                    <div class="form-group">
                        <strong>Case Entry / Case Number / Nature of Claim<span style="color: red">*</span></strong>
                        <asp:DropDownList runat="server" ID="caseentry" CssClass="form-control select2" AppendDataBoundItems="true">
                            <asp:ListItem>--Select--</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator Display="dynamic" runat="server" ControlToValidate="caseentry" InitialValue="--Select--" ErrorMessage="Please select case, it cannot be empty!" ForeColor="Red" />
                    </div>
                </div>
                <div class="col-lg-6 col-sm-6">
                    <div class="form-group">
                        <strong>Last Hearing Date<span style="color: red">*</span></strong>
                        <asp:TextBox runat="server" ID="registrationDate" CssClass="form-control" placeholder="Please Enter Last Hearing Date" />
                        <asp:RequiredFieldValidator Display="dynamic" runat="server" ControlToValidate="registrationDate" ErrorMessage="Please Enter Last Hearing Date, it cannot be empty!" ForeColor="Red" />
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12 col-sm-12">
                    <div class="form-group">
                        <strong>Summary of Proceedings<span style="color: red">*</span></strong>
                        <asp:TextBox runat="server" ID="preceedings" CssClass="form-control" placeholder="Please Enter Summary of Preceedings" TextMode="MultiLine" Height="200px" />
                        <asp:RequiredFieldValidator Display="dynamic" runat="server" ControlToValidate="preceedings" ErrorMessage="Please Enter Summary of Preceedings, it cannot be empty!" ForeColor="Red" />
                    </div>
                </div>
                <div class="col-lg-12 col-sm-12">
                    <div class="form-group">
                        <strong>Summary of Coram<span style="color: red">*</span></strong>
                        <asp:TextBox runat="server" ID="coram" CssClass="form-control" placeholder="Please Enter Summary of Coram" TextMode="MultiLine" Height="200px" />
                        <asp:RequiredFieldValidator Display="dynamic" runat="server" ControlToValidate="coram" ErrorMessage="Please Enter Summary of Coram, it cannot be empty!" ForeColor="Red" />
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-6 col-sm-6" runat="server" visible="false">
                    <div class="form-group">
                        <strong>Attendance<span style="color: red">*</span></strong>
                        <asp:DropDownList runat="server" ID="attendance" CssClass="form-control select2" AppendDataBoundItems="true">
                            <asp:ListItem>--Select--</asp:ListItem>
                            <asp:ListItem Value="0">Hearing</asp:ListItem>
                            <asp:ListItem Value="1">Mention</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator Display="dynamic" runat="server" ControlToValidate="attendance" InitialValue="--Select--" ErrorMessage="Please select case, it cannot be empty!" ForeColor="Red" />
                    </div>
                </div>
                <div class="col-lg-6 col-sm-6">
                    <div class="form-group">
                        <strong>Mention / Hearing Date<span style="color: red">*</span></strong>
                        <asp:TextBox runat="server" ID="returndate" CssClass="form-control" placeholder="Please Enter Mention Date" />
                        <asp:RequiredFieldValidator Display="dynamic" runat="server" ControlToValidate="returndate" ErrorMessage="Please Enter Mention Date, it cannot be empty!" ForeColor="Red" />
                    </div>
                </div>
                <div class="col-lg-6 col-sm-6">
                    <div class="form-group">
                        <strong>Next Hearing / Mention / Judgement / Rulling Date<span style="color: red">*</span></strong>
                        <asp:TextBox runat="server" ID="DOB" CssClass="form-control" placeholder="Please Enter Next Hearing Date" />
                        <asp:RequiredFieldValidator Display="dynamic" runat="server" ControlToValidate="DOB" ErrorMessage="Please Enter Next Hearing Date, it cannot be empty!" ForeColor="Red" />
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12 col-sm-12">
                    <div class="form-group">
                        <strong>Decision<span style="color: red">*</span></strong>
                        <asp:TextBox runat="server" ID="decision" CssClass="form-control" placeholder="Please Enter Decision" TextMode="MultiLine" Height="200px" />
                        <asp:RequiredFieldValidator Display="dynamic" runat="server" ControlToValidate="decision" ErrorMessage="Please Enter Decision, it cannot be empty!" ForeColor="Red" />
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-6 col-sm-6">
                    <div class="form-group">
                        <strong>Bring Up Hearing Date<span style="color: red">*</span></strong>
                        <asp:TextBox runat="server" ID="qualificationTo" CssClass="form-control" placeholder="Please Enter Bring Up Hearing Date" />
                        <asp:RequiredFieldValidator Display="dynamic" runat="server" ControlToValidate="qualificationTo" ErrorMessage="Please Enter Bring Up Hearing Date, it cannot be empty!" ForeColor="Red" />
                    </div>
                </div>
                <div class="col-lg-6 col-sm-6">
                    <div class="form-group">
                        <strong>Bring Up Mention Date<span style="color: red">*</span></strong>
                        <asp:TextBox runat="server" ID="qualificationFrom" CssClass="form-control" placeholder="Please Enter Bring Up Mention Date" />
                        <asp:RequiredFieldValidator Display="dynamic" runat="server" ControlToValidate="qualificationFrom" ErrorMessage="Please Enter Bring Up Mention Date, it cannot be empty!" ForeColor="Red" />
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-6 col-sm-6">
                    <div class="form-group">
                        <strong>Rulling Date<span style="color: red">*</span></strong>
                        <asp:TextBox runat="server" ID="dateOfExam" CssClass="form-control" placeholder="Please Enter Rulling Date" />
                        <asp:RequiredFieldValidator Display="dynamic" runat="server" ControlToValidate="dateOfExam" ErrorMessage="Please Enter Rulling Date, it cannot be empty!" ForeColor="Red" />
                    </div>
                </div>
                <div class="col-lg-6 col-sm-6">
                    <div class="form-group">
                        <strong>Judgement Date<span style="color: red">*</span></strong>
                        <asp:TextBox runat="server" ID="healthAssessmentDate" CssClass="form-control" placeholder="Please Enter Judgement Date" />
                        <asp:RequiredFieldValidator Display="dynamic" runat="server" ControlToValidate="healthAssessmentDate" ErrorMessage="Please Enter Judgement Date, it cannot be empty!" ForeColor="Red" />
                    </div>
                </div>
            </div>
        </div>
        <div class="panel-footer">
            <asp:Button runat="server" CssClass="btn btn-info pull-right" Text="Next" ID="Savegeneraldetails" OnClick="Savegeneraldetails_Click" />
            <div class="clearfix"></div>
        </div>
    </div>
    <% 
        }
        else if (step == 2)
        {
    %>
    <div class="panel panel-primary">
        <div class="panel-heading">
            Case Hearing Advocates
            <span class="pull-right"><i class="fa fa-chevron-left"></i>Step 2 of 3<i class="fa fa-chevron-right"></i></span><span class="clearfix"></span>
        </div>
        <div class="panel-body">
            <div id="Linesfeedback" runat="server"></div>
            <div class="row">
                <div class="col-lg-6 col-sm-6">
                    <div class="form-group">
                        <strong>Advocate on Record<span style="color: red">*</span></strong>
                        <asp:DropDownList runat="server" ID="advocate" CssClass="form-control select2" AppendDataBoundItems="true">
                            <asp:ListItem>--Select--</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator Display="dynamic" runat="server" ControlToValidate="advocate" InitialValue="--Select--" ErrorMessage="Please select Advocate on Record, it cannot be empty!" ForeColor="Red" />
                    </div>
                </div>
            </div>
        </div>
        <div class="panel-footer">
            <asp:Button runat="server" CssClass="btn btn-info pull-right" Text="Add Advocate" ID="addadvocate" OnClick="addadvocate_Click" />
            <div class="clearfix"></div>
        </div>
    </div>
    <div class="panel panel-primary">
        <div class="panel-heading">
            Added advocates
        </div>
        <div class="panel-body">
            <div runat="server" id="feedback"></div>
            <table id="example1" class="table table-bordered table-striped">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>Advocate Name</th>
                        <th>Remove Advocate</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        var nav = new Config().ReturnNav();
                        int counter = 0;
                        var headers = nav.CaseAdvocatehearings.Where(r => r.Header_No == Convert.ToInt32(Request.QueryString["docNo"]));
                        foreach (var header in headers)
                        {
                            counter++;
                    %>
                    <tr>
                        <td><% =counter %></td>
                        <td><% =header.Advocate_Name%></td>
                        <td>
                            <label class="btn btn-danger" onclick="sendApprovalRequest('<%=header.Entry_No %>');"><i class="fa fa-times"></i>Remove Advocate</label>
                        </td>
                    </tr>
                    <%
                        } %>
                </tbody>
            </table>
        </div>
        <div class="panel-footer">
            <asp:Button runat="server" CssClass="btn btn-info pull-right" Text="Next" ID="nexttostepthree" OnClick="nexttostepthree_Click" CausesValidation="false" />
            <asp:Button runat="server" CssClass="btn btn-warning pull-left" Text="Previous" ID="backtostepone"  OnClick="backtostepone_Click" CausesValidation="false"/>
            <div class="clearfix"></div>
        </div>
    </div>
    <% 
        }
        else if (step == 3)
        {
    %>
    <div class="panel panel-primary">
        <div class="panel-heading">
            Supporting Documents
              <span class="pull-right"><i class="fa fa-chevron-left"></i>Step 3 of 3 <i class="fa fa-chevron-right"></i></span><span class="clearfix"></span>
        </div>
        <div class="panel-body">
            <div runat="server" id="documentsfeedback"></div>
            <div class="row">
                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                    <div class="form-group">
                        <strong>Select file to upload</strong>
                        <asp:FileUpload runat="server" ID="document" CssClass="form-control" Style="padding-top: 0px;" />
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                    <div class="form-group">
                        <br />
                        <asp:Button runat="server" CssClass="btn btn-success" Text="Upload Document" ID="uploadDocument" OnClick="uploadDocument_Click"/>
                    </div>
                </div>
            </div>
            <table class="table table-bordered table-striped">
                <thead>
                    <tr>
                        <th>Document Title</th>
                        <th>Download</th>
                        <th>Delete</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        try
                        {
                            String fileFolderApplication = ConfigurationManager.AppSettings["FileFolderApplication"];
                            String filesFolder = ConfigurationManager.AppSettings["FilesLocation"] + "Store Requisition/";
                            String imprestNo = Request.QueryString["requisitionNo"];
                            imprestNo = imprestNo.Replace('/', '_');
                            imprestNo = imprestNo.Replace(':', '_');
                            String documentDirectory = filesFolder + imprestNo + "/";
                            if (Directory.Exists(documentDirectory))
                            {
                                foreach (String file in Directory.GetFiles(documentDirectory, "*.*", SearchOption.AllDirectories))
                                {
                                    String url = documentDirectory;
                    %>
                    <tr>
                        <td><% =file.Replace(documentDirectory, "") %></td>

                        <td><a href="<%=fileFolderApplication %>\Non-Project Store Requisition\<% =imprestNo+"\\"+file.Replace(documentDirectory, "") %>" class="btn btn-success" download>Download</a></td>
                        <td>
                            <label class="btn btn-danger" onclick="deleteFile('<%=file.Replace(documentDirectory, "")%>');"><i class="fa fa-trash-o"></i>Delete</label></td>
                    </tr>
                    <%
                                }
                            }
                        }
                        catch (Exception)
                        {

                        }%>
                </tbody>
            </table>
        </div>
        <div class="panel-footer">
            <asp:Button runat="server" CssClass="btn btn-warning pull-left" Text="Previous" ID="backtosteptwo" OnClick="backtosteptwo_Click" />
            <asp:Button runat="server" CssClass="btn btn-info pull-right" Text="Submit Case Hearing" ID="submitcasehearing" OnClick="submitcasehearing_Click" />
            <div class="clearfix"></div>
        </div>
    </div>



    <%
        }
    %>
</asp:Content>
