<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<jsp:include flush="true" page="header.jsp" />
<h4 class="text-center mb-2 border-bottom pb-2">Issue Books</h4>

<div class="container">
	<div class="row">
		<div class="col-sm-6 mx-auto">
			<div class="card shadow">
				<div class="card-body">
					<form>
						<div class="form-row form-group">
							<label class="col-sm-4 col-form-label">Book Id</label>
							<div class="col-sm-8">
								<div class="input-group">
									<input type="text" name="bookid" value="${param.bookid }"
										class="form-control">
									<button class="btn btn-primary input-group-append">Search</button>
								</div>
							</div>
						</div>
					</form>
					<c:if test="${bfound}">
						<form>
							<input type="hidden" name="bookid" value="${param.bookid }">

							<div class="form-row form-group">
								<label class="col-sm-4 col-form-label">Book Name</label>
								<div class="col-sm-8">
									<input type="text" readonly value="${bk.bname }"
										class="form-control">
								</div>
							</div>

							<div class="form-row form-group">
								<label class="col-sm-4 col-form-label">Student Id</label>
								<div class="col-sm-8">
									<div class="input-group">
										<input type="text" name="stdid" value="${param.stdid }"
											class="form-control">
										<button class="btn btn-primary input-group-append">Search</button>
									</div>
								</div>
							</div>
						</form>
					</c:if>
					<c:if test="${sfound }">

						<form method="post">
							<input type="hidden" name="bookid" value="${param.bookid }">
							<input type="hidden" name="stdid" value="${param.stdid }">

							<div class="form-row form-group">
								<label class="col-sm-4 col-form-label">Student Name</label>
								<div class="col-sm-8">
									<input type="text" readonly value="${std.name }"
										class="form-control">
								</div>
							</div>


							<button class="btn btn-primary float-right">Issue Book</button>
						</form>
					</c:if>
					<c:if test="${sinvalid }">
						<h6 class="text-danger font-weight-bold text-center">Invalid
							Student Id</h6>
					</c:if>
					<c:if test="${bunavailable }">
						<h6 class="text-danger font-weight-bold text-center">Book not
							available</h6>
					</c:if>
					<c:if test="${binvalid }">
						<h6 class="text-danger font-weight-bold text-center">Invalid
							book id</h6>
					</c:if>
				</div>
			</div>
		</div>
	</div>
</div>

<jsp:include page="footer.jsp"></jsp:include>