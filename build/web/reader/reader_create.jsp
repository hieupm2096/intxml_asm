<%-- 
    Document   : index
    Created on : Jan 7, 2018, 10:19:46 PM
    Author     : oswal
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Library Manager - Index</title>

        <!-- Bootstrap Core CSS -->
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">

        <!-- MetisMenu CSS -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/metisMenu/2.7.2/metisMenu.min.css" rel="stylesheet">

        <!-- Custom CSS -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/startbootstrap-sb-admin-2/3.3.7/css/sb-admin-2.min.css" rel="stylesheet">

        <!-- Custom Fonts -->
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    </head>

    <body>
        <div id="wrapper">
            <!-- Navigation -->
            <jsp:include page="../template/navigation.jsp" />

            <div id="page-wrapper">
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">Reader</h1>
                    </div>
                    <!-- /.col-lg-12 -->
                </div>
                <!-- /.row -->
                <div class="row">
                    <div class="col-lg-10">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                Create New Reader
                            </div>
                            <!--./panel-heading-->
                            <div class="panel-body">
                                <div class="col-lg-12">
                                    <s:form method="POST" action="reader_create">
                                        <div class="row">
                                            <div class="form-group col-lg-8">
                                                <label>Name</label>
                                                <s:textfield name="name" cssClass="form-control" placeholder="Enter reader name" />
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="form-group col-lg-8">
                                                <label>Email</label>
                                                <s:textfield name="email" cssClass="form-control" placeholder="Enter reader email" />
                                            </div>
                                            <div class="form-group col-lg-4">
                                                <label>Phone Number</label>
                                                <s:textfield name="phone" cssClass="form-control" placeholder="Enter reader phone number" />
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="form-group col-lg-4">
                                                <label>Day of Birth</label>
                                                <input id="date-picker" type="date" class="form-control"/>
                                                <s:hidden name="dob" id="txtDob" />
                                            </div>
                                            <div class="form-group col-lg-4">
                                                <label>Gender</label>
                                                <div class="checkbox">
                                                    <label>
                                                        <input id="gender-picker" type="checkbox"/> Male
                                                    </label>
                                                    <s:hidden name="gender" id="txtGender" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="form-group col-lg-12">
                                                <label>Address</label>
                                                <s:textarea name="address" cssClass="form-control" placeholder="Enter reader address"/>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="form-group col-lg-12">
                                                <s:submit cssClass="btn btn-default" value="Create" />
                                                <s:reset id="btnReset" cssClass="btn btn-default" value="Reset" />
                                            </div>
                                        </div>
                                    </s:form>
                                </div>
                            </div>
                            <!--./panel-body-->
                        </div>
                    </div>
                </div>
            </div>
            <!-- /#page-wrapper -->

        </div>
        <!-- /#wrapper -->

        <!-- jQuery -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

        <!-- Bootstrap Core JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

        <!-- Metis Menu Plugin JavaScript -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/metisMenu/2.7.2/metisMenu.min.js"></script>

        <!-- Custom Theme JavaScript -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/startbootstrap-sb-admin-2/3.3.7/js/sb-admin-2.min.js"></script>

        <script>
            $(function () {
                $('#date-picker').on('change', function () {
                    var date = new Date($('#date-picker').val());
                    var dobShort = (date.getMonth() + 1) + "/" + date.getDate() + "/" + date.getFullYear().toString().substr(-2);
                    console.log(dobShort);
                    $('#txtDob').val(dobShort);
                });
                $('#gender-picker').on('change', function () {
                    if (this.checked) {
                        t = 'true';
                        $('#txtGender').val('true');
                    } else {
                        $('#txtGender').val('false');
                    }
                    console.log($('#txtGender').val());
                });
            });
        </script>
    </body>

</html>
