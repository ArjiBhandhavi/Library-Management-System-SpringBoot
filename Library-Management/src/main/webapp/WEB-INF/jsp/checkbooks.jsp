<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<jsp:include flush="true" page="header.jsp"/>
<h4 class="text-center mb-2 border-bottom pb-2">Check Book Availability</h4>

<div class="row">
	<div class="col-sm-5 mx-auto text-center">
		<form class="form-inline form-group">
			<input type="text" name="search" value="${param.search }" placeholder="Enter book name to search" class="form-control mr-2" style="width:399px;">
			<input type="submit" value="search" class="btn btn-primary">
		</form>
	</div>
</div>
<table class="table table-bordered table-fixed">
    <thead class="table-dark">
    <tr style="position:sticky;top:0;">
        <th style="width:130px">Book ID</th>        
        <th>Book Name </th>
        <th>Author</th>
        <th>Publisher</th>
        <th>Price</th>
        <th>Status</th>
    </tr>
    </thead>
    <tbody style="overflow: scroll">
	    <c:forEach var="b" items="${list }">
    <tr>                    
        <td>${b.id}</td>
        <td>${b.bname}</td>
        <td>${b.author}</td>
        <td>${b.publisher}</td>
        <td style="text-align: right">&#8377; ${b.price}</td>
        <td>${b.isavailable ? 'Available' : 'Not Available'}</td>
    </tr>
    </c:forEach>
    </tbody>
</table>
<jsp:include page="footer.jsp"></jsp:include>