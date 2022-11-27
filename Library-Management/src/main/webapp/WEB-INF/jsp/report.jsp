<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<jsp:include flush="true" page="header.jsp"/>
<h4 class="text-center mb-2 border-bottom pb-2">Library Report</h4>
<jsp:include page="message.jsp" />
<table class="table table-bordered table-fixed">
    <thead class="table-dark">
    <tr style="position:sticky;top:0;">
    	<th>Date</th>
        <th>Book ID</th>        
        <th>Book Name </th>
        <th>Author</th>
        <th>Student Id</th>
        <th>Student Name</th>
        <th>Issue/Return</th>
    </tr>
    </thead>
    <tbody style="overflow: scroll">
    <c:forEach var="t" items="${list }">
    <tr>    
	    <td>${t.trandate }</td>    
	    <td>${t.book.id }</td>    
	    <td>${t.book.bname }</td>    
	    <td>${t.book.author }</td>    
	    <td>${t.student.id }</td>    
	    <td>${t.student.name }</td>    
	    <td>${t.isreturned ? 'Returned':'Issued' }</td>    
    </tr>
    </c:forEach>
    </tbody>
</table>
<jsp:include page="footer.jsp"></jsp:include>