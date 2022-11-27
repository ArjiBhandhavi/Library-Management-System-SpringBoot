<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<jsp:include flush="true" page="header.jsp"/>
<h4 class="text-center mb-2 border-bottom pb-2">Users Report</h4>
<table class="table table-bordered table-fixed">
    <thead class="table-dark">
    <tr style="position:sticky;top:0;">
    	<th>Student Id</th>
        <th>Student Name </th>
        <th>Address</th>
        <th>Phone</th>
        <th>Email</th>
        <th>User Id</th>
        <th>Password</th>
        <th>Status</th>
    </tr>
    </thead>
    <tbody style="overflow: scroll">
    
    <c:forEach var="u" items="${list }">
    <tr>                    
        <td>${u.student.id }</td>
        <td>${u.student.name }</td>
        <td>${u.student.address }</td>
        <td>${u.student.phone }</td>
        <td>${u.student.email }</td>
        <td>${u.userid }</td>
        <td>${u.pwd }</td>
        <td>${u.isactive ? 'Active' : 'Inactive' }</td>
    </tr>
    </c:forEach>
    </tbody>
</table>
<jsp:include page="footer.jsp"></jsp:include>
