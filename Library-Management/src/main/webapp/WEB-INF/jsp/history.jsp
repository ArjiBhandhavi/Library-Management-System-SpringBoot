<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<jsp:include flush="true" page="header.jsp"/>
<h4 class="text-center mb-2 border-bottom pb-2">Books History</h4>
<jsp:include page="message.jsp" />
<table class="table table-bordered table-fixed">
    <thead class="table-dark">
    <tr style="position:sticky;top:0;">
    	<th>Id</th>
    	<th>Date</th>
        <th>Book ID</th>        
        <th>Book Name </th>
        <th>Author</th>
        <th>Price</th>
        <th>Return/Issue</th>
    </tr>
    </thead>
    <tbody style="overflow: scroll">
    <c:forEach var="b" items="${list }">
    <tr>        
    	<td>${b.id}</td>
    	<td>${b.trandate}</td>            
        <td>${b.book.id}</td>
        <td>${b.book.bname}</td>
        <td>${b.book.author}</td>
        <td>&#8377; ${b.book.price}</td>
        <td>${ b.isissued and b.isreturned ? 'Returned' : 'Issued' }</td>
    </tr>
    </c:forEach>
    </tbody>
</table>
<jsp:include page="footer.jsp"></jsp:include>