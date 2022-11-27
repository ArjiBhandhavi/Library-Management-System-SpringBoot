<jsp:include flush="true" page="header.jsp" />
<h4 class="text-center mb-2 border-bottom pb-2">Change Password</h4>
<jsp:include page="message.jsp" />
<div class="row">
	<div class="col-sm-5 mx-auto">
		<div class="card shadow">
			<div class="card-body">
				<form method="post">
					<div class="form-group">
						<label>Current Password</label> <input type="password" name="current" required
							class="form-control" placeholder="Current Password">
					</div>
					<div class="form-group">
						<label>Password</label> <input type="password" name="newpwd" required
							class="form-control" placeholder="New Password">
					</div>
					<div class="form-group">
						<label>Repeat Password</label> <input type="password" name="cpwd" required
							class="form-control" placeholder="Repeat Password">
					</div>
					<input type="submit" value="Update Password"
						class="btn btn-primary float-right px-3">
				</form>
				<div class="clearfix"></div>
			</div>
		</div>

	</div>
</div>
<jsp:include page="footer.jsp"></jsp:include>