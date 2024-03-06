<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" />
        <link href="../assests/admin_css/addNewProduct.css" rel="stylesheet" />
        <link rel="icon" type="image/x-icon" href="<%=request.getContextPath()%>/assets/images/favicon/favicon.png">

        <title>Add new product</title>
    </head>
    <body>
        <div class="container">
            <h1 class="title">ADD NEW Category</h1>
            <form id="productForm" action="<%=request.getContextPath()%>/admin/add-new-category" method="post">
                <!-- Product Information -->
                <div class="form-group">
                    <label for="productName">Name:</label>
                    <input type="text" id="CategoryName" name="categoryName" required>
                </div>
                <!-- Submit Button -->
                <div class="form-group">
                    <button type="submit">Submit</button>
                </div>
            </form>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

        <script src="../assests/admin_js/add-new-product.js"></script>


    </body>
</html>