<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<jsp:include flush="true" page="header.jsp"/>
<h4 class="text-center mb-2 border-bottom pb-2">Return Books</h4>
<div class="container">
	<div class="row">
		<div class="col-sm-6 mx-auto">
		<div class="card shadow">
			<div class="card-body">
				<form>
					<div class="form-row form-group">
						<label class="col-sm-4 col-form-label">Student Id</label>
						<div class="col-sm-8">
							<div class="input-group">
							<input type="text" name="stdid" value="${param.stdid }" class="form-control">
							<button class="btn btn-primary input-group-append">Search</button>
							</div>
						</div>
					</div>
				</form>
				
<c:if test="${sfound and hadbooks }">
							<form method="post" action="return">
								<input type="hidden" name="stdid" value="${param.stdid }">
								<div class="form-row form-group">
									<label class="col-sm-4 col-form-label">Student Name</label>
									<div class="col-sm-8">
										<input type="text" readonly value="${std.name }" class="form-control">
									</div>
								</div>
								<div class="form-row form-group">
									<label class="col-sm-4 col-form-label">Select Book</label>
									<div class="col-sm-8">
										<select required name="bookid" class="form-control">
											<option value="">Select Book</option>
											<c:forEach var="b" items="${books }">										
											<option value="${b.id }">${b.bname }</option>
											</c:forEach>
										</select>
									</div>
								</div>
								
								
								<button class="btn btn-primary float-right">Return Book</button>
							</form>
						</c:if>
						<c:if test="${sinvalid }">
							<h6 class="text-danger font-weight-bold text-center">Invalid Student Id</h6>
						</c:if>				
			</div>
		</div>
		</div>
	</div>
</div>

<jsp:include page="footer.jsp"></jsp:include>