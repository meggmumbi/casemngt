<%@ Page Title="Dashboard" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="HRPortal.Dashboard" %>

<%@ Import Namespace="HRPortal" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-sm-12">
            <ol class="breadcrumb float-sm-right">
                <li class="breadcrumb-item"><a href="Dashboard.aspx">Case Management Portal</a></li>
                <li class="breadcrumb-item active">Dashboard</li>
            </ol>
        </div>
    </div>
    <section class="content">
        <!-- Small boxes (Stat box) -->
        <div class="panel panel-primary">
            <div class="panel-heading">
                SECTION A: SUMMARY DASHBOARDS
            </div>
            <div class="panel-body">
                <div class="col-lg-4 col-xs-6">
                    <!-- small box -->
                    <div class="small-box bg-blue">
                        <div class="inner">
                            <%
                                var nav = new Config().ReturnNav();
                                string custNo = Convert.ToString(Session["CustNo"]);
                                int openapps = nav.CaseHearing.Where(x => x.Status == "Draft").ToList().Count;
                            %>
                            <h3><%=openapps %></h3>

                            <p>Unsubmitted Cases</p>
                        </div>
                        <a href="OpenApplications.aspx" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
                    </div>
                </div>
                <!-- ./col -->
                <div class="col-lg-4 col-xs-6">
                    <!-- small box -->
                    <div class="small-box bg-yellow">
                        <div class="inner">
                            <%
                                int docs = nav.CaseHearing.Where(x => x.Status == "Submitted").ToList().Count;
                            %>
                            <h3><%=docs %></h3>

                            <p>Submitted Cases</p>
                        </div>
                        <a href="CaseHearingSubmitted.aspx" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
                    </div>
                </div>
                <!-- ./col -->
                <div class="col-lg-4 col-xs-6">
                    <!-- small box -->
                    <div class="small-box bg-blue">
                        <div class="inner">
                            <%
                                int pay = nav.CaseHearing.ToList().Count;
                            %>
                            <h3><%=pay %></h3>

                            <p>Total Cases</p>
                        </div>
                        <a href="CaseHearingSubmitted.aspx" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
                    </div>
                </div>
                <!-- ./col -->
                <!-- ./col -->
            </div>
        </div>
        <div class="panel panel-primary">
            <div class="panel-heading">
                SECTION B: CASE HEARING STATISTICS
            </div>
            <div class="panel-body">
                <div class="col-md-6 col-lg-6">
                    <div class="panel panel-info">
                        <div class="panel-heading">
                            <i class="fa fa-bar-chart-o fa-fw"></i>Case Hearings Status
                        </div>
                        <div class="panel-body">
                            <div id="resolution-satisfaction"></div>

                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-lg-6">
                    <div class="panel panel-info">
                        <div class="panel-heading">
                            <i class="fa fa-bar-chart-o fa-fw"></i>Cases by period

                        </div>
                        <div class="panel-body">
                            <div id="ticket-volume" style="position: center; right: 0px; top: 0px;"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <script
        src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js">
    </script>
    <script src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
    
        // Load google charts
        google.charts.load('current', {'packages':['corechart']});
        google.charts.setOnLoadCallback(drawChart);
        // Draw the chart and set the chart values
        function drawChart() {
            // Create the data table.
            var data = new google.visualization.DataTable();
            data.addColumn('string', 'Topping');
            data.addColumn('number', 'Slices');
        
            var myData = {

                'Open':<% =2%>,
                // nav.CaseHearing.Where(x => x.Status == "Draft").ToList().Count
                'Closed': <% =4%>,
                //nav.CaseHearing.Where(x => x.Status == "Submitted").ToList().Count
            };
        
            var rows = [];
            for (element in myData) {
                rows.push([element + " (" + myData[element] + ")", myData[element]])
            }
            data.addRows(rows);

            // Optional; add a title and set the width and height of the chart
            var options = {'title':'Case Hearings Status',
                'width':250, 
                'height':250,
                'chartArea': {'width': '80%', 'height': '80%','left': '30','top': '30'},
                'is3D': true,
                'legend': {'position': 'bottom'}
            };

            // Display the chart inside the <div> element with id="piechart"
            var chart = new google.visualization.PieChart(document.getElementById('resolution-satisfaction'));
            chart.draw(data, options);
        }
        
    </script>
    <script type="text/javascript">
        google.charts.load("current", {packages:['corechart']});
        google.charts.setOnLoadCallback(drawChart);
        function drawChart() {
            var data = google.visualization.arrayToDataTable([
              ["Students", "Total", { role: "style" } ],
              ["Q1",<% = 5%>, "#e60000"],
            ["Q2",<% =4%>, "#6666ff"],
            ["Q3",<% =2 %>, "#e67300"],
            ["Q4", <% = 5%>, "##9900e6"]
          ]);

          var view = new google.visualization.DataView(data);
          view.setColumns([0, 1,
                           { calc: "stringify",
                               sourceColumn: 1,
                               type: "string",
                               role: "annotation" },
                           2]);

          var options = {
              title: "Cases by period",
              width: 250,
              height: 250,
              is3D: true,
              bar: {groupWidth: "95%"},
              legend: { position: "none" },
          };
          var chart = new google.visualization.ColumnChart(document.getElementById('ticket-volume'));
          chart.draw(view, options);
      }
    </script>
</asp:Content>
