<jsp:include page="header.jsp"></jsp:include>

<h4 class="title">Student Dashboard</h4>
<table class="table table-bordered">
	<tr>
		<th>Name</th>
		<th>${s.name }</th>
	</tr>
	<tr>
		<th>Address</th>
		<th>${s.address}</th>
	</tr>
	<tr>
		<th>Email Address</th>
		<th>${s.email}</th>
	</tr>
	<tr>
		<th>Gender</th>
		<th>${s.gender}</th>
	</tr>
	<tr>
		<th>Contact Number</th>
		<th>${s.phone}</th>
	</tr>
	
</table>
<jsp:include page="footer.jsp"></jsp:include>