<jsp:include flush="true" page="header.jsp" />

<div class="row">
	<div class="col-sm-12">
		<h4 class="text-center mb-2 border-bottom pb-2">
			Edit Product with id : ${bk.id }
			</h4>
		<form method="post">
			<div class="form-row">
				<div class="col-sm-4">
					<div class="form-group">
						<label>Product Name</label> <input type="text" name="bname"
							class="form-control" value="${bk.bname }">
					</div>
				</div>
				<div class="col-sm-4">
					<div class="form-group">
						<label>Book Author</label> <input type="text" name="author"
							value="${bk.author }" class="form-control">
					</div>
				</div>
				<div class="col-sm-4">
					<div class="form-group">
						<label>Book Publisher</label> <input type="text" name="publisher"
							value="${bk.publisher }" class="form-control">
					</div>
				</div>
				<div class="col-sm-4">
					<div class="form-group">
						<label>Book Price</label> <input type="text" name="price"
							value="${bk.price }" class="form-control">
					</div>
				</div>
				<div class="col-sm-4">
					<div class="form-group">
						<label>Description</label>
						<textarea rows="4" class="form-control" style="resize: none"
							name="description">${bk.description }</textarea>
					</div>
				</div>
				</div>
				<input type="submit" value="Save Book"
					class="btn btn-primary float-right">
		</form>
	</div>
</div>
<jsp:include flush="true" page="footer.jsp" />

