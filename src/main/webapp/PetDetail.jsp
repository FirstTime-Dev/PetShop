<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.Pet" %>

<%
    Pet pet = (Pet) request.getAttribute("pet");
    if (pet == null) {
        response.sendRedirect("PetProfile.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chi tiết thú cưng - <%= pet.getName() %></title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        :root {
            --primary-color: #4CAF50;
            --secondary-color: #45a049;
            --accent-color: #ff6b6b;
            --text-color: #2c3e50;
            --light-gray: #f8f9fa;
            --border-radius: 15px;
        }

        body {
            font-family: 'Segoe UI', Arial, sans-serif;
            background: linear-gradient(135deg, #f5f7fa 0%, #e4e8eb 100%);
            min-height: 100vh;
            padding: 40px 0;
            color: var(--text-color);
        }

        .detail-container {
            background: rgba(255, 255, 255, 0.95);
            border-radius: var(--border-radius);
            box-shadow: 0 8px 32px rgba(0,0,0,0.1);
            padding: 30px;
            backdrop-filter: blur(10px);
        }

        .pet-header {
            display: flex;
            align-items: center;
            margin-bottom: 30px;
            padding-bottom: 20px;
            border-bottom: 2px solid var(--light-gray);
        }

        .pet-avatar-large {
            width: 100px;
            height: 100px;
            background: var(--light-gray);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-right: 20px;
            font-size: 2.5rem;
            color: var(--primary-color);
        }

        .pet-info h1 {
            margin: 0;
            color: var(--text-color);
            font-size: 2rem;
            font-weight: 700;
        }

        .pet-type-badge {
            display: inline-block;
            padding: 8px 16px;
            border-radius: 20px;
            background-color: #e3f2fd;
            color: #1976d2;
            font-size: 0.9rem;
            margin-top: 8px;
        }

        .pet-details {
            background: var(--light-gray);
            border-radius: var(--border-radius);
            padding: 20px;
            margin-top: 20px;
        }

        .detail-item {
            display: flex;
            align-items: center;
            margin-bottom: 15px;
            padding: 10px;
            background: white;
            border-radius: 10px;
        }

        .detail-icon {
            width: 40px;
            height: 40px;
            background: var(--light-gray);
            border-radius: 10px;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-right: 15px;
            color: var(--primary-color);
        }

        .detail-content {
            flex: 1;
        }

        .detail-label {
            font-size: 0.9rem;
            color: #6c757d;
            margin-bottom: 2px;
        }

        .detail-value {
            font-size: 1.1rem;
            font-weight: 500;
            color: var(--text-color);
        }

        .back-btn {
            display: inline-flex;
            align-items: center;
            color: var(--text-color);
            text-decoration: none;
            margin-bottom: 20px;
            font-weight: 500;
            transition: all 0.3s ease;
        }

        .back-btn:hover {
            color: var(--primary-color);
            transform: translateX(-5px);
        }

        .back-btn i {
            margin-right: 5px;
        }

        @media (max-width: 768px) {
            body {
                padding: 20px 0;
            }

            .detail-container {
                padding: 20px;
            }

            .pet-avatar-large {
                width: 80px;
                height: 80px;
                font-size: 2rem;
            }

            .pet-info h1 {
                font-size: 1.5rem;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <a href="PetProfile.jsp" class="back-btn">
            <i class="fas fa-arrow-left"></i>
            Quay lại danh sách
        </a>
        
        <div class="detail-container">
            <div class="pet-header">
                <div class="pet-avatar-large">
                    <i class="fas fa-paw"></i>
                </div>
                <div class="pet-info">
                    <h1><%= pet.getName() %></h1>
                    <div class="pet-type-badge">
                        <i class="fas fa-tag me-2"></i><%= pet.getType() %>
                    </div>
                </div>
            </div>

            <div class="pet-details">
                <div class="detail-item">
                    <div class="detail-icon">
                        <i class="fas fa-signature"></i>
                    </div>
                    <div class="detail-content">
                        <div class="detail-label">Tên thú cưng</div>
                        <div class="detail-value"><%= pet.getName() %></div>
                    </div>
                </div>

                <div class="detail-item">
                    <div class="detail-icon">
                        <i class="fas fa-birthday-cake"></i>
                    </div>
                    <div class="detail-content">
                        <div class="detail-label">Tuổi</div>
                        <div class="detail-value"><%= pet.getAge() %> tuổi</div>
                    </div>
                </div>

                <div class="detail-item">
                    <div class="detail-icon">
                        <i class="fas fa-paw"></i>
                    </div>
                    <div class="detail-content">
                        <div class="detail-label">Loại thú cưng</div>
                        <div class="detail-value"><%= pet.getType() %></div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Scripts -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html> 