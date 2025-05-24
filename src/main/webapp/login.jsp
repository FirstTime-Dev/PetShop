<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Đăng nhập - PetShop</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />

    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet" />

    <style>
        body {
            background: linear-gradient(135deg, #e4f0e2, #c4d9b6);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            color: #2c3e50;
        }

        .login-container {
            background: white;
            padding: 40px 30px;
            border-radius: 15px;
            box-shadow: 0 8px 20px rgba(0,0,0,0.15);
            width: 100%;
            max-width: 400px;
            text-align: center;
        }

        .login-container h2 {
            margin-bottom: 30px;
            font-weight: 700;
            color: #4CAF50;
        }

        .form-label {
            font-weight: 600;
            text-align: left;
            display: block;
            margin-bottom: 8px;
        }

        .form-control:focus {
            border-color: #4CAF50;
            box-shadow: 0 0 8px #4CAF50aa;
        }

        button.btn-login {
            background-color: #4CAF50;
            border: none;
            width: 100%;
            padding: 12px;
            font-weight: 700;
            font-size: 1.1rem;
            border-radius: 10px;
            transition: background-color 0.3s ease;
        }

        button.btn-login:hover {
            background-color: #45a049;
        }

        .error-msg {
            margin-top: 20px;
            color: #ff4c4c;
            font-weight: 600;
        }

        /* Icon inside input */
        .input-icon {
            position: relative;
        }

        .input-icon > i {
            position: absolute;
            left: 12px;
            top: 50%;
            transform: translateY(-50%);
            color: #4CAF50;
            pointer-events: none;
        }

        .input-icon > input {
            padding-left: 38px !important;
        }
    </style>
</head>
<body>
<div class="login-container">
    <h2><i class="fas fa-paw me-2"></i>Đăng nhập PetShop</h2>
    <form action="login" method="post" novalidate>
        <div class="mb-4 input-icon">
            <i class="fas fa-user"></i>
            <input type="text" name="username" class="form-control" placeholder="Tên đăng nhập" required autofocus />
        </div>

        <div class="mb-4 input-icon">
            <i class="fas fa-lock"></i>
            <input type="password" name="password" class="form-control" placeholder="Mật khẩu" required />
        </div>

        <button type="submit" class="btn btn-login">Đăng nhập</button>
    </form>

    <c:if test="${not empty error}">
        <p class="error-msg">${error}</p>
    </c:if>
</div>

<!-- Bootstrap JS Bundle (Popper + Bootstrap) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
