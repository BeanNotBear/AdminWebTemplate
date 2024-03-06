<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <link rel="icon" href="../assests/images/favicon/favicon.png" type="image/ico" />
        <title>Product Management</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
        <link href="../assests/admin_css/style.css" rel="stylesheet" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js" integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

    </head>
    <body class="sb-nav-fixed">
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <!-- Navbar Brand-->
            <a class="navbar-brand ps-3" href="<%=request.getContextPath()%>/admin/dashboard">Welcome Admin</a>
            <!-- Sidebar Toggle-->
            <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i
                    class="fas fa-bars"></i></button>
            <!-- Navbar-->
            <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown"
                       aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="<%=request.getContextPath()%>/admin/logout">Logout</a></li>
                    </ul>
                </li>
            </ul>
        </nav>
        <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav">
                            <div class="sb-sidenav-menu-heading">Core</div>
                            <a class="nav-link" href="<%=request.getContextPath()%>/admin/dashboard">
                                <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                                Dashboard
                            </a>
                            <a class="nav-link" href="<%=request.getContextPath()%>/admin/user">
                                <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                User Management
                            </a>
                            <a class="nav-link" href="<%=request.getContextPath()%>/admin/order">
                                <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                Order Management
                            </a>
                            <a class="nav-link" href="<%=request.getContextPath()%>/admin/category">
                                <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                Category Management
                            </a>
                            <a class="nav-link" href="<%=request.getContextPath()%>/admin/product">
                                <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                Product Management
                            </a>
                        </div>
                    </div>
                    <div class="sb-sidenav-footer">
                        <div class="small">Logged in as:</div>
                        <c:if test="${sessionScope.admin.role.toString() eq 'admin'}">
                            Admin
                        </c:if>
                        <c:if test="${sessionScope.admin.role.toString() eq 'super_admin'}">
                            Super Admin
                        </c:if>
                    </div>
                </nav>
            </div>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">List Product</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">Admin Role</li>
                        </ol>
                        <div class="add-action mb-2">
                            <a href="<%=request.getContextPath()%>/admin/add-new-product" class="btn btn-success waves-effect"> <i class="fa fa-plus-circle"></i> Add New Product</a>
                        </div>
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                Product Table
                            </div>
                            <div class="card-body">
                                <table id="datatablesSimple" class="datatable-table">
                                    <thead>
                                        <tr>
                                            <th style="width: 5%">ID</th>
                                            <th style="width: 40%">Name</th>
                                            <th style="width: 10%">Category</th>
                                            <th style="width: 10%">Price</th>
                                            <th style="width: 10%">Amount</th>
                                            <th style="width: 15%">Thumbnail</th>
                                            <th style="width: 10% !important; ">Actions</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="p" items="${Singleton.productDAO.getAll()}">
                                            <tr>
                                                <td>${p.ID}</td>
                                                <td>${p.name}</td>
                                                <td>
                                                    ${Singleton.categoryDAO.getNameCategory(p.categoryID)}
                                                </td>
                                                <td>${p.price}</td>
                                                <td>${p.amount}</td>
                                                <td>
                                                    <img src="<%=request.getContextPath()%>/${p.thumbnail}" style="width: 80px; height: 80px" 
                                                         class="card-img-top">
                                                </td>
                                                <td>
                                                    <a href="#" class="btn btn-info btn-tiny btn-view-detail"
                                                       style="background-color: rgb(74, 172, 114);" title="View Detail">
                                                        <i class="fa fa-search"></i>
                                                    </a>

                                                    <a href="#" class="btn btn-info btn-tiny" title="Edit">
                                                        <i class="fa fa-pencil"></i>
                                                    </a>

                                                    <button class="btn btn-danger btn-tiny" title="Delete" onclick="deleteProduct(${p.ID})">
                                                        <i class="fa fa-trash"></i>
                                                    </button>
                                                </td>
                                        <input class="brand"  type="hidden" value="${p.brand}"/>
                                        <input class="origin"  type="hidden" value="${p.origin}"/>
                                        <input class="expiryDate"  type="hidden" value="${p.expiryDate}"/>
                                        <input class="weight"  type="hidden" value="${p.weight}"/>
                                        <input class="preservation"  type="hidden" value="${p.preservation}"/>

                                        <input class="images"  type="hidden" value="${p.images}"/>

                                        <input class="createAt"  type="hidden" value="${p.createAt}"/>
                                        <input class="updateAt"  type="hidden" value="${p.updateAt}"/>
                                        <input class="deleteAt"  type="hidden" value="${p.deleteAt}"/>
                                        </tr>
                                    </c:forEach>

                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </main>
                <footer class="py-4 bg-light mt-auto">
                    <div class="container-fluid px-4">
                        <div class="d-flex align-items-center justify-content-between small">
                            <div class="text-muted">Copyright &copy; Group1's Website 2023</div>
                            <div>
                                <a href="#">Privacy Policy</a>
                                &middot;
                                <a href="#">Terms &amp; Conditions</a>
                            </div>
                        </div>
                    </div>
                </footer>
            </div>
        </div>


        <!-- View detail Product -->
        <div class="modal fade" id="detailModal" tabindex="-1" role="dialog" aria-labelledby="detailModalLabel"
             aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="detailModalLabel">Product Detail</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <!-- Detail table content will be inserted here dynamically -->
                        <table id="datatablesSimple" class="datatable-table">
                        </table>

                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>


  

        <script>
            let contextPath = '<%= request.getContextPath()%>/';
        </script>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        crossorigin="anonymous"></script>
        <script src="../assests/admin_js/scripts.js"></script>
        <script src="../assests/admin_js/view-detail-product.js"></script>
        <script src="../assests/admin_js/product-admin.js"></script>
        <script src="../assests/admin_js/add-product.js"></script>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="../assests/admin_js/chart-area-demo.js"></script>
        <script src="../assests/admin_js/chart-bar-demo.js"></script>
        <script src="../assests/admin_js/chart-pie-demo.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js"
        crossorigin="anonymous"></script>
        <script src="../assests/admin_js/datatables-simple-demo.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    </body>
</html>