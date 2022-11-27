<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Dashboard</title>
        <link href="/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link rel="icon" href="/images/liblogo.png"/>
    </head>
    <body>
        <div class="container-fluid ">
            <div class="row">
                <div class="col-2 bg-dark fixed-top h-100 px-0 py-0"> 
                    <div class="card">
                        <img src="/images/liblogo.png" class="card-img-top" style="height:150px;">
                        <div class="card-header text-center">
                            ${sessionScope.uname }
                        </div>
                        <div class="card-header text-center">
                            ${sessionScope.role }
                        </div>
                        <ul class="list-group list-group-flush">
                        <c:choose>
                        	<c:when test="${sessionScope.role eq 'Admin' }">
                            <a href="/dashboard" class="list-group-item list-group-item-action">Home</a>
                            <a href="/books" class="list-group-item list-group-item-action">Books</a>
                            <a href="/issue" class="list-group-item list-group-item-action">Issue Books</a>                            
                            <a href="/return" class="list-group-item list-group-item-action">Return Books</a>
                            <a href="/users" class="list-group-item list-group-item-action">Users</a>
                            <a href="/report" class="list-group-item list-group-item-action">Reports</a>
                            </c:when>
                            <c:otherwise>
                            <a href="/studenthome" class="list-group-item list-group-item-action">Home</a>
                            <a href="/checkbooks" class="list-group-item list-group-item-action">Search Books</a>
                            <a href="/mybooks" class="list-group-item list-group-item-action">Issued Books</a>
                            <a href="/history" class="list-group-item list-group-item-action">Book History</a>
                            </c:otherwise>
                            </c:choose>
                            <a href="/ChangePwd" class="list-group-item list-group-item-action">Change Password</a>
                            <a href="/logout" class="list-group-item list-group-item-action">Logout</a>
                        </ul>
                    </div>
                </div>
                <div class="col offset-2 p-0">
                    <div class="jumbotron text-center text-white bg-dark p-3 mb-0">
                        <h4>${sessionScope.role } Role Portal</h4>
                    </div>
                    <div class="p-3" style="min-height:80vh;">

