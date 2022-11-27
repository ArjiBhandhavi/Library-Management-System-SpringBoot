<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<jsp:include flush="true" page="header.jsp"/>
<a href="/addbook" class="btn btn-primary btn-sm float-right">Add New</a>
<h4 class="text-center mb-2 border-bottom pb-2">Books Report</h4>
<jsp:include page="message.jsp" />
<table class="table table-bordered table-fixed">
    <thead class="table-dark">
    <tr style="position:sticky;top:0;">
        <th style="width:130px">Book ID</th>        
        <th>Book Name </th>
        <th>Author</th>
        <th>Publisher</th>
        <th>Price</th>
        <th>Status</th>
        <th>Action</th>        
    </tr>
    </thead>
    <tbody style="overflow: scroll">
    <c:forEach var="b" items="${list }">
    <tr>                    
        <td>${b.id }</td>
        <td>${b.bname }</td>
        <td>${b.author }</td>
        <td>${b.publisher}</td>
        <td style="text-align: right">&#8377; ${b.price }</td>
        <td>${b.isavailable ? 'Available' : 'Not Available' }</td>
        <td><a href="editbook/${b.id }" class="btn btn-sm btn-primary">Edit</a>
            </td>                    
    </tr>
    </c:forEach>
    </tbody>
</table>
<jsp:include page="footer.jsp"></jsp:include>