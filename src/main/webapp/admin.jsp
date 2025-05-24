<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8" />
    <title>Admin Dashboard - Petshop Style</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet" />
    <style>
        :root {
            --primary-color: #4CAF50;
            --secondary-color: #45a049;
            --text-color: #2c3e50;
            --bg-light-custom: #f8f9fa;
        }

        body {
            font-family: 'Segoe UI', Arial, sans-serif;
            color: var(--text-color);
            background-color: var(--bg-light-custom);
            min-height: 100vh;
        }

        /* Sidebar */
        .sidebar {
            background-color: white;
            box-shadow: 0 0 10px rgb(0 0 0 / 0.1);
            height: 100vh;
            padding-top: 3rem;
            position: sticky;
            top: 0;
        }

        .sidebar h4 {
            color: var(--primary-color);
            font-weight: 700;
            margin-bottom: 1.5rem;
        }

        .sidebar .nav-link {
            color: var(--text-color);
            font-weight: 500;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding-left: 1.5rem;
            padding-right: 1rem;
            transition: background-color 0.3s, color 0.3s;
            border-radius: 0.375rem;
        }

        .sidebar .nav-link:hover,
        .sidebar .nav-link.active {
            background-color: var(--primary-color);
            color: white !important;
        }

        /* Main content */
        .main-content {
            padding: 2rem;
        }

        .main-content h1 {
            color: var(--primary-color);
            font-weight: 700;
            margin-bottom: 2rem;
        }

        .main-content img {
            max-width: 100%;
            border-radius: 1rem;
            box-shadow: 0 8px 24px rgb(0 0 0 / 0.15);
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
                    <a class="nav-link active" href="admin">
                        Trang chủ Admin <i class="fa-solid fa-angle-right"></i>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="adminOrders">
                        Danh sách đơn hàng <i class="fa-solid fa-angle-right"></i>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="adminAccounts">
                        Danh sách tài khoản <i class="fa-solid fa-angle-right"></i>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="adminProducts">
                        Danh sách sản phẩm <i class="fa-solid fa-angle-right"></i>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="adminCategories">
                        Danh mục sản phẩm <i class="fa-solid fa-angle-right"></i>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="adminAddProduct">
                        Thêm sản phẩm <i class="fa-solid fa-angle-right"></i>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="adminAddCategory">
                        Thêm danh mục <i class="fa-solid fa-angle-right"></i>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="adminUpdateProduct">
                        Cập nhật sản phẩm <i class="fa-solid fa-angle-right"></i>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="adminUpdateCategory">
                        Cập nhật danh mục <i class="fa-solid fa-angle-right"></i>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="adminRevenue">
                        Xem doanh thu <i class="fa-solid fa-angle-right"></i>
                    </a>
                </li>
            </ul>
        </nav>

        <!-- Main content -->
        <main class="col-md-9 main-content text-center">
            <h1>Trang chủ Admin</h1>
            <img src="https://static.vecteezy.com/system/resources/previews/023/629/421/non_2x/pet-shop-indoor-cartoon-illustration-vector.jpg" alt="Background Image" />
        </main>
    </div>
</div>

<!-- Bootstrap JS + Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>

