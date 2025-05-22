<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Trang chủ - Hệ thống đặt lịch dịch vụ</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <style>
        :root {
            --primary-color: #4CAF50;
            --secondary-color: #45a049;
        }

        body {
            font-family: 'Segoe UI', Arial, sans-serif;
            background: linear-gradient(135deg, #f5f7fa 0%, #e4e8eb 100%);
            min-height: 100vh;
        }

        .hero-section {
            padding: 100px 0;
            text-align: center;
            background: rgba(255, 255, 255, 0.9);
            border-radius: 15px;
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.1);
            backdrop-filter: blur(10px);
            margin: 50px auto;
            max-width: 900px;
        }

        .hero-title {
            color: #2c3e50;
            font-size: 2.5rem;
            font-weight: 700;
            margin-bottom: 30px;
            animation: fadeInDown 1s ease;
        }

        .hero-subtitle {
            color: #7f8c8d;
            font-size: 1.2rem;
            margin-bottom: 40px;
            animation: fadeInUp 1s ease;
        }

        .booking-btn {
            background-color: var(--primary-color);
            color: white;
            padding: 15px 40px;
            border-radius: 30px;
            border: none;
            font-size: 1.1rem;
            font-weight: 600;
            text-transform: uppercase;
            transition: all 0.3s ease;
            animation: pulse 2s infinite;
        }

        .booking-btn:hover {
            background-color: var(--secondary-color);
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(76, 175, 80, 0.3);
        }

        .features {
            margin-top: 50px;
            display: flex;
            justify-content: center;
            gap: 30px;
            flex-wrap: wrap;
            animation: fadeIn 1s ease;
        }

        .feature-item {
            text-align: center;
            padding: 20px;
            flex: 1;
            min-width: 200px;
            max-width: 250px;
        }

        .feature-icon {
            font-size: 2.5rem;
            color: var(--primary-color);
            margin-bottom: 15px;
        }

        .feature-title {
            font-weight: 600;
            color: #2c3e50;
            margin-bottom: 10px;
        }

        .feature-desc {
            color: #7f8c8d;
            font-size: 0.9rem;
        }

        @keyframes fadeInDown {
            from {
                opacity: 0;
                transform: translateY(-20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
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

        @keyframes fadeIn {
            from {
                opacity: 0;
            }
            to {
                opacity: 1;
            }
        }

        @keyframes pulse {
            0% {
                box-shadow: 0 0 0 0 rgba(76, 175, 80, 0.4);
            }
            70% {
                box-shadow: 0 0 0 10px rgba(76, 175, 80, 0);
            }
            100% {
                box-shadow: 0 0 0 0 rgba(76, 175, 80, 0);
            }
        }
    </style>
</head>
<body>
<div class="container">
    <div class="hero-section">
        <h1 class="hero-title">Chào mừng bạn đến với hệ thống đặt lịch dịch vụ</h1>
        <p class="hero-subtitle">Đặt lịch dễ dàng, nhanh chóng và tiện lợi</p>

        <form action="booking-form.jsp" method="get" class="mb-5">
            <button type="submit" class="booking-btn">
                <i class="fas fa-calendar-alt me-2"></i>
                Đặt lịch ngay
            </button>
        </form>

        <div class="features">
            <div class="feature-item">
                <i class="fas fa-clock feature-icon"></i>
                <h3 class="feature-title">Tiết kiệm thời gian</h3>
                <p class="feature-desc">Đặt lịch nhanh chóng chỉ trong vài phút</p>
            </div>

            <div class="feature-item">
                <i class="fas fa-calendar-check feature-icon"></i>
                <h3 class="feature-title">Linh hoạt</h3>
                <p class="feature-desc">Dễ dàng chọn thời gian phù hợp với bạn</p>
            </div>

            <div class="feature-item">
                <i class="fas fa-user-check feature-icon"></i>
                <h3 class="feature-title">Tin cậy</h3>
                <p class="feature-desc">Đội ngũ chuyên nghiệp, tận tâm</p>
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap JS and Popper.js -->
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
</body>
</html>
