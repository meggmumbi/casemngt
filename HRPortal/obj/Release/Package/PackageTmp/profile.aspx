<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="HRPortal.Profile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-sm-12">
            <ol class="breadcrumb float-sm-right">
                <li class="breadcrumb-item"><a href="Home.aspx">Home</a></li>
                <li class="breadcrumb-item active">Profile</li>
            </ol>
        </div>
    </div>
    <div class="panel panel-primary">
        <div class="panel-heading">
            Profile Details
        </div>
        <div class="panel-body">
            <div runat="server" id="feedback"></div>
            <div class="col-md-6 col-lg-6">
                <div class="form-group" runat="server">
                    <label class="span2">Full Name<span style="color: red">*</span></label>
                    <asp:TextBox ID="fullname" runat="server" CssClass="form-control" ReadOnly="true"/>
                </div>
                <div class="form-group">
                    <label class="span2"> Email <span style="color: red">*</span></label>
                    <asp:TextBox runat="server" ID="email" CssClass="form-control span3" ReadOnly="true"/>
                </div>
                <div class="form-group">
                    <label class="span2">Phone Number<span style="color: red">*</span></label>
                    <asp:TextBox runat="server" ID="phonenumber" CssClass="form-control span3" ReadOnly="true" />
                </div>
                                <div class="form-group">
                    <label class="span2">National Identity Number (ID)<span style="color: red">*</span></label>
                    <asp:TextBox runat="server" ID="idno" CssClass="form-control span3" ReadOnly="true"/>
                </div>
            </div>
            <div class="col-md-6 col-lg-6">

                <div class="form-group">
                    <label class="span2">Post Code<span style="color: red">*</span></label>
                    <asp:TextBox runat="server" ID="postcode" CssClass="form-control span3" ReadOnly="true"/>
                </div>
                <div class="form-group">
                    <label class="span2">Address<span style="color: red">*</span></label>
                    <asp:TextBox runat="server" ID="address" CssClass="form-control" ReadOnly="true"/>
                </div>
                <div class="form-group" runat="server" id="divemployed">
                    <label class="span2">City<span style="color: red">*</span></label>
                    <asp:TextBox runat="server" ID="city" CssClass="form-control span3" ReadOnly="true"/>
                </div>
                <div class="form-group">
                    <label class="span2">Country<span style="color: red">*</span></label>
                    <asp:TextBox runat="server" ID="country" CssClass="form-control span3" ReadOnly="true" />
                </div>
            </div>
        </div>
        <div class="panel-footer">
            <asp:Button runat="server" ID="backtodashboard" CssClass="btn btn-info pull-right" Text="Back To Dashboard" />
            <div class="clearfix"></div>
        </div>
    </div>
</asp:Content>