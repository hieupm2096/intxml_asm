<%-- 
    Document   : navbar
    Created on : Jan 8, 2018, 12:37:50 AM
    Author     : oswal
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>

<nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
    <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href="http://localhost:8080/INTXML_ASM/index.jsp">Library Manager</a>
    </div>
    <!-- /.navbar-header -->

    <ul class="nav navbar-top-links navbar-right">
        <li class="dropdown">
            <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                <i class="fa fa-user fa-fw"></i> <i class="fa fa-caret-down"></i>
            </a>
            <ul class="dropdown-menu dropdown-user">
                <li><a href="#"><i class="fa fa-user fa-fw"></i> ${sessionScope.username}</a>
                </li>
                <li class="divider"></li>
                <li><a href="#"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
                </li>
            </ul>
            <!-- /.dropdown-user -->
        </li>
        <!-- /.dropdown -->
    </ul>
    <!-- /.navbar-top-links -->

    <div class="navbar-default sidebar" role="navigation">
        <div class="sidebar-nav navbar-collapse">
            <ul class="nav" id="side-menu">
                <li>
                    <a href="http://localhost:8080/INTXML_ASM/index.jsp"><i class="fa fa-dashboard fa-fw"></i> Dashboard</a>
                </li>
                <li>
                    <s:url action="reader_read" var="readerReadUrl" />
                    <s:a href="%{readerReadUrl}"><i class="fa fa-users fa-fw"></i> Reader</s:a>
                </li>
                <li>
                    <a href="#"><i class="fa fa-book fa-fw"></i> Book<span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <li>
                            <a href="http://localhost:8080/INTXML_ASM/category/cate_list.jsp"><i class="fa fa-cube fa-fw"></i> Category</a>
                        </li>
                        <li>
                            <a href="http://localhost:8080/INTXML_ASM/book/book_list.jsp"><i class="fa fa-book fa-fw"></i> Book</a>
                        </li>
                    </ul>
                    <!-- /.nav-second-level -->
                </li>
                <li>
                    <a href="http://localhost:8080/INTXML_ASM/ticket/ticket_list.jsp"><i class="fa fa-ticket fa-fw"></i> Ticket</a>
                </li>

            </ul>
        </div>
        <!-- /.sidebar-collapse -->
    </div>
    <!-- /.navbar-static-side -->
</nav>

