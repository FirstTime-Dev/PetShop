<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8" />
    <title>Admin - Doanh Thu</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />

    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet" />

    <style>
        :root {
            --primary-color: #4CAF50;
            --text-color: #2c3e50;
            --bg-light-custom: #f8f9fa;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: var(--bg-light-custom);
            color: var(--text-color);
            min-height: 100vh;
        }

        .sidebar {
            background-color: white;
            height: 100vh;
            position: sticky;
            top: 0;
            padding-top: 2rem;
            box-shadow: 0 0 10px rgb(0 0 0 / 0.1);
        }

        .sidebar h4 {
            color: var(--primary-color);
            font-weight: 700;
            margin-bottom: 1.5rem;
            text-align: center;
        }

        .sidebar .nav-link {
            color: var(--text-color);
            font-weight: 500;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding-left: 1.5rem;
            padding-right: 1rem;
            border-radius: 0.375rem;
            transition: background-color 0.3s, color 0.3s;
        }

        .sidebar .nav-link:hover,
        .sidebar .nav-link.active {
            background-color: var(--primary-color);
            color: white !important;
        }

        main {
            padding: 2rem;
        }

        main h1 {
            color: var(--primary-color);
            margin-bottom: 2rem;
            font-weight: 700;
        }

        @media (max-width: 767.98px) {
            .sidebar {
                height: auto;
                position: relative;
                padding-top: 1rem;
            }
        }
    </style>
</head>
<body>
<div class="container-fluid">
    <div class="row">
        <!-- Sidebar -->
        <nav class="col-md-3 sidebar d-flex flex-column">
            <h4 class="text-center">Menu Admin</h4>
            <ul class="nav flex-column gap-2">
                <li class="nav-item">
                    <a class="nav-link" href="admin.jsp">Trang chủ Admin <i class="fa-solid fa-angle-right"></i></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="adminOrders">Danh sách đơn hàng <i class="fa-solid fa-angle-right"></i></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="adminAccounts">Danh sách tài khoản <i class="fa-solid fa-angle-right"></i></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="adminProducts">Danh sách sản phẩm <i class="fa-solid fa-angle-right"></i></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="adminCategories">Danh mục sản phẩm <i class="fa-solid fa-angle-right"></i></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="adminAddProduct">Thêm sản phẩm <i class="fa-solid fa-angle-right"></i></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="adminAddCategory">Thêm danh mục <i class="fa-solid fa-angle-right"></i></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="adminUpdateProduct">Cập nhật sản phẩm <i class="fa-solid fa-angle-right"></i></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="adminUpdateCategory">Cập nhật danh mục <i class="fa-solid fa-angle-right"></i></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" href="adminRevenue">Xem doanh thu <i class="fa-solid fa-angle-right"></i></a>
                </li>
            </ul>
        </nav>

        <!-- Main content -->
        <main class="col-md-9 main-content text-center">
            <h1>Bảng Doanh Thu</h1>

            <c:choose>
                <c:when test="${not empty revenues}">
                    <table class="table table-bordered table-hover text-center align-middle">
                        <thead class="table-success">
                        <tr>
                            <th>ID</th>
                            <th>Ngày</th>
                            <th>Số Tiền (VNĐ)</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="rev" items="${revenues}">
                            <tr>
                                <td>${rev.id}</td>
                                <td><fmt:formatDate value="${rev.date}" pattern="dd/MM/yyyy"/></td>
                                <td><fmt:formatNumber value="${rev.amount}" type="number" groupingUsed="true" maxFractionDigits="0"/> VNĐ</td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </c:when>
                <c:otherwise>
                    <div class="text-center mt-5">
                        <h3>Chưa có dữ liệu doanh thu</h3>

                    </div>
                </c:otherwise>
            </c:choose>
        </main>
    </div>
</div>

<!-- Bootstrap JS Bundle -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
