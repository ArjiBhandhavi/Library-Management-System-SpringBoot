<jsp:include flush="true" page="header.jsp"/>

<div class="row">
    <div class="col-sm-6 mx-auto">
        <h4 class="text-center mb-2 border-bottom pb-2">Add New Book</h4>
        <form method="post">
                <div class="form-group">
                    <label>Book Name</label>   
                    <input type="text" name="bname" class="form-control" placeholder="Book Name">
                </div>                            	
                <div class="form-group">
                    <label>Book Author</label>   
                    <input type="text" name="author" class="form-control" placeholder="Author Name">
                </div>                                
                <div class="form-group">
                    <label>Book Publisher</label>   
                    <input type="text" name="publisher" class="form-control" placeholder="Publisher">
                </div>                                                                
                <div class="form-group">
                    <label>Book Price</label>   
                    <input type="text" name="price" class="form-control" placeholder="Product Price">
                </div>                                
                <div class="form-group">
                    <label>Description</label>
                    <textarea placeholder="Description" rows="4" class="form-control" 
                    style="resize: none" name="description"></textarea>
                </div>
            <input type="submit" value="Save Product" class="btn btn-primary float-right">
        </form>
    </div>
</div>
<jsp:include flush="true" page="footer.jsp"/>

