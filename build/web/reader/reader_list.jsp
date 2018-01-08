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

        <!--DataTables CSS-->
        <link href="https://cdn.datatables.net/1.10.16/css/dataTables.bootstrap.min.css" rel="stylesheet"/>
        <link href="https://cdn.datatables.net/responsive/2.2.1/css/responsive.bootstrap.min.css" rel="stylesheet"/>

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
                    <div class="col-lg-12">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                Readers List
                            </div>
                            <!--./panel-heading-->
                            <div class="panel-body">
                                <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-readers">
                                    <thead>
                                        <tr>
                                            <td>#</td>
                                            <td>ID</td>
                                            <td>Name</td>
                                            <td>Status</td>
                                            <td></td>
                                            <td></td>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <s:iterator var="r" value="items" status="i">
                                            <tr>
                                                <td><s:property value="%{#i.index + 1}" /></td>
                                                <td><s:property value="#r.id" /></td>
                                                <td><s:property value="#r.name" /></td>
                                                <td>
                                                    <s:if test="#r.status">
                                                        Available
                                                    </s:if>
                                                    <s:else>
                                                        N/A
                                                    </s:else>
                                                </td>
                                                <td>Remove</td>
                                                <td>Update</td>
                                            </tr>
                                        </s:iterator>
                                    </tbody>
                                </table>
                                <a href="http://localhost:8080/INTXML_ASM/reader/reader_create.jsp" class="btn btn-outline btn-primary"><i class="fa fa-plus fw"></i> Create New Reader</a>
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

        <!--DataTables JavaScript-->
        <script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
        <script src="https://cdn.datatables.net/1.10.16/js/dataTables.bootstrap.min.js"></script>
        <script src="https://cdn.datatables.net/responsive/2.2.1/js/dataTables.responsive.min.js"></script>
        <script src="https://cdn.datatables.net/responsive/2.2.1/js/responsive.bootstrap.min.js"></script>

        <!-- Custom Theme JavaScript -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/startbootstrap-sb-admin-2/3.3.7/js/sb-admin-2.min.js"></script>

        <script>
            $(function () {
                $('#dataTables-readers').DataTable({
                    responsive: true
                });
            });
        </script>
    </body>

</html>
