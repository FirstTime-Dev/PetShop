<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Kết quả đặt lịch - Hệ thống đặt lịch dịch vụ</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        :root {
            --primary-color: #4CAF50;
            --secondary-color: #45a049;
        }

        body {
            font-family: 'Segoe UI', Arial, sans-serif;
            background: linear-gradient(135deg, #f5f7fa 0%, #e4e8eb 100%);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 20px;
        }

        .result-container {
            background: rgba(255, 255, 255, 0.95);
            border-radius: 20px;
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.1);
            backdrop-filter: blur(10px);
            padding: 40px;
            max-width: 600px;
            width: 100%;
            text-align: center;
            animation: fadeInUp 0.5s ease;
        }

        .result-icon {
            font-size: 4rem;
            margin-bottom: 20px;
            animation: scaleIn 0.5s ease;
        }

        .success-icon {
            color: var(--primary-color);
        }

        .error-icon {
            color: #dc3545;
        }

        .result-title {
            color: #2c3e50;
            font-size: 2rem;
            font-weight: 700;
            margin-bottom: 20px;
        }

        .result-message {
            color: #7f8c8d;
            font-size: 1.1rem;
            margin-bottom: 30px;
            line-height: 1.6;
        }

        .home-btn {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            background-color: var(--primary-color);
            color: white;
            padding: 12px 30px;
            border-radius: 30px;
            text-decoration: none;
            font-weight: 600;
            transition: all 0.3s ease;
        }

        .home-btn:hover {
            background-color: var(--secondary-color);
            transform: translateY(-2px);
            color: white;
            box-shadow: 0 5px 15px rgba(76, 175, 80, 0.3);
        }

        .home-btn i {
            margin-right: 8px;
        }

        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        @keyframes scaleIn {
            from {
                transform: scale(0);
            }
            to {
                transform: scale(1);
            }
        }

        /* Responsive adjustments */
        @media (max-width: 576px) {
            .result-container {
                padding: 30px 20px;
            }

            .result-title {
                font-size: 1.5rem;
            }

            .result-icon {
                font-size: 3rem;
            }
        }
    </style>
</head>
<body>
<div class="result-container">
    <%
        String message = (String) request.getAttribute("message");
        boolean isSuccess = message != null && !message.toLowerCase().contains("lỗi");
    %>

    <div class="result-icon <%= isSuccess ? "success-icon" : "error-icon" %>">
        <i class="fas <%= isSuccess ? "fa-circle-check" : "fa-circle-exclamation" %>"></i>
    </div>

    <h2 class="result-title">
        <%= isSuccess ? "Đặt lịch thành công!" : "Đặt lịch không thành công" %>
    </h2>

    <p class="result-message">${message}</p>

    <a href="index.jsp" class="home-btn">
        <i class="fas fa-home"></i>
        Quay lại trang chủ
    </a>
</div>

<!-- Bootstrap JS and Popper.js -->
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
</body>
</html>
