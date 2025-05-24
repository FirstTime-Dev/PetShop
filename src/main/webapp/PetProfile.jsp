<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.Pet" %>

<%
    // Biến session đã có sẵn, không cần khai báo lại
    List<Pet> petList = (List<Pet>) session.getAttribute("petList");
    if (petList == null) {
        petList = new ArrayList<>();

        petList.add(new Pet("Milo", "Chó", 2));
        petList.add(new Pet("Luna", "Mèo", 3));
        petList.add(new Pet("Rio", "Chim", 1));
        session.setAttribute("petList", petList);
    }

    String editName = (String) request.getAttribute("editName");
    String editType = (String) request.getAttribute("editType");
    Integer editAge = (Integer) request.getAttribute("editAge");
    Integer editIndex = (Integer) request.getAttribute("editIndex");
    
    // Lấy thông báo
    String successMsg = (String) request.getAttribute("success");
    String errorMsg = (String) request.getAttribute("error");
%>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hồ sơ thú cưng - PetShop</title>
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

        .profile-container {
            background: rgba(255, 255, 255, 0.95);
            border-radius: var(--border-radius);
            box-shadow: 0 8px 32px rgba(0,0,0,0.1);
            padding: 30px;
            margin-bottom: 30px;
            backdrop-filter: blur(10px);
        }

        .page-title {
            color: var(--text-color);
            font-size: 2.2rem;
            font-weight: 700;
            margin-bottom: 30px;
            text-align: center;
            position: relative;
            padding-bottom: 15px;
        }

        .page-title:after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 50%;
            transform: translateX(-50%);
            width: 100px;
            height: 3px;
            background: var(--primary-color);
            border-radius: 3px;
        }

        .add-pet-form {
            background: white;
            padding: 25px;
            border-radius: var(--border-radius);
            box-shadow: 0 4px 15px rgba(0,0,0,0.05);
            margin-bottom: 30px;
        }

        .form-control {
            border: 2px solid #e9ecef;
            border-radius: 10px;
            padding: 12px;
            font-size: 1rem;
            transition: all 0.3s ease;
        }

        .form-control:focus {
            border-color: var(--primary-color);
            box-shadow: 0 0 0 0.2rem rgba(76, 175, 80, 0.25);
        }

        .btn {
            padding: 12px 25px;
            border-radius: 10px;
            font-weight: 600;
            transition: all 0.3s ease;
        }

        .btn-success {
            background-color: var(--primary-color);
            border: none;
        }

        .btn-success:hover {
            background-color: var(--secondary-color);
            transform: translateY(-2px);
        }

        .pet-list {
            background: white;
            border-radius: var(--border-radius);
            overflow: hidden;
            box-shadow: 0 4px 15px rgba(0,0,0,0.05);
        }

        .table {
            margin-bottom: 0;
        }

        .table th {
            background-color: var(--light-gray);
            color: var(--text-color);
            font-weight: 600;
            border: none;
            padding: 15px;
        }

        .table td {
            padding: 15px;
            vertical-align: middle;
            border-color: #f0f0f0;
        }

        .pet-avatar {
            width: 40px;
            height: 40px;
            background: var(--light-gray);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-right: 10px;
        }

        .pet-name {
            display: flex;
            align-items: center;
        }

        .action-buttons .btn {
            padding: 8px 15px;
            margin: 0 5px;
        }

        .btn-warning {
            background-color: #ffc107;
            border: none;
            color: #000;
        }

        .btn-danger {
            background-color: var(--accent-color);
            border: none;
        }

        .empty-state {
            text-align: center;
            padding: 40px 20px;
            color: #6c757d;
        }

        .empty-state i {
            font-size: 3rem;
            margin-bottom: 15px;
            color: #dee2e6;
        }

        .back-btn {
            display: inline-flex;
            align-items: center;
            color: var(--text-color);
            text-decoration: none;
            margin-bottom: 20px;
            font-weight: 500;
        }

        .back-btn:hover {
            color: var(--primary-color);
        }

        .back-btn i {
            margin-right: 5px;
        }

        @media (max-width: 768px) {
            body {
                padding: 20px 0;
            }

            .profile-container {
                padding: 20px;
            }

            .page-title {
                font-size: 1.8rem;
            }

            .action-buttons .btn {
                padding: 6px 12px;
                font-size: 0.875rem;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <a href="index.jsp" class="back-btn">
            <i class="fas fa-arrow-left"></i>
            Quay lại trang chủ
        </a>
        
        <div class="profile-container">
            <h1 class="page-title">Hồ sơ thú cưng</h1>

            <% if (successMsg != null) { %>
                <div class="alert alert-success alert-dismissible fade show" role="alert">
                    <i class="fas fa-check-circle me-2"></i><%= successMsg %>
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
            <% } %>

            <% if (errorMsg != null) { %>
                <div class="alert alert-danger alert-dismissible fade show" role="alert">
                    <i class="fas fa-exclamation-circle me-2"></i><%= errorMsg %>
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
            <% } %>

            <div class="add-pet-form">
                <form method="post" action="PetProfileServlet" class="mb-4">
                    <div class="row g-3">
                        <div class="col-md-4">
                            <div class="input-group">
                                <span class="input-group-text bg-white border-end-0">
                                    <i class="fas fa-paw text-muted"></i>
                                </span>
                                <!-- 8.1.2: Nhập tên thú cưng -->
                                <input
                                    type="text"
                                    name="petName"
                                    class="form-control border-start-0"
                                    placeholder="Nhập tên thú cưng"
                                    required
                                    value="<%= editName != null ? editName : "" %>">
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="input-group">
                                <span class="input-group-text bg-white border-end-0">
                                    <i class="fas fa-tags text-muted"></i>
                                </span>
                                <!-- 8.1.2: Nhập loại thú cưng -->
                                <select name="petType" class="form-select border-start-0" required>
                                    <option value="" disabled <%= editType == null ? "selected" : "" %>>Chọn loại thú cưng</option>
                                    <option value="Chó" <%= editType != null && editType.equals("Chó") ? "selected" : "" %>>Chó</option>
                                    <option value="Mèo" <%= editType != null && editType.equals("Mèo") ? "selected" : "" %>>Mèo</option>
                                    <option value="Chim" <%= editType != null && editType.equals("Chim") ? "selected" : "" %>>Chim</option>
                                    <option value="Cá" <%= editType != null && editType.equals("Cá") ? "selected" : "" %>>Cá</option>
                                    <option value="Khác" <%= editType != null && editType.equals("Khác") ? "selected" : "" %>>Khác</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="input-group">
                                <span class="input-group-text bg-white border-end-0">
                                    <i class="fas fa-birthday-cake text-muted"></i>
                                </span>
                                <!-- 8.1.2: Nhập tuổi thú cưng -->
                                <input
                                    type="number"
                                    name="petAge"
                                    class="form-control border-start-0"
                                    placeholder="Nhập tuổi"
                                    required
                                    min="0"
                                    max="100"
                                    value="<%= editAge != null ? editAge : "" %>">
                            </div>
                        </div>
                    </div>
                    <div class="mt-3 text-end">
                        <% if (editName != null && editIndex != null) { %>
                            <input type="hidden" name="editIndex" value="<%= editIndex %>">
                            <button type="submit" name="action" value="update" class="btn btn-primary">
                                <i class="fas fa-check me-1"></i>Cập nhật
                            </button>
                            <a href="PetProfile.jsp" class="btn btn-secondary ms-2">
                                <i class="fas fa-times me-1"></i>Hủy
                            </a>
                        <% } else { %>
                            <button type="submit" name="action" value="add" class="btn btn-success">
                                <i class="fas fa-plus me-1"></i>Thêm thú cưng <!-- 8.1.3: Người dùng chọn “thêm thú cưng” -->
                            </button>
                        <% } %>
                    </div>
                </form>
            </div>

            <div class="pet-list">
                <% if (petList.isEmpty()) { %>
                    <div class="empty-state">
                        <i class="fas fa-paw"></i>
                        <h3>Chưa có thú cưng nào</h3>
                        <p>Hãy thêm thú cưng đầu tiên của bạn!</p>
                        <a href="InitDataServlet" class="btn btn-primary mt-3">
                            <i class="fas fa-magic me-2"></i>Thêm dữ liệu mẫu
                        </a>
                    </div>
                <% } else { %>
                    <table class="table">
                        <thead>
                            <tr>
                                <th style="width: 60px">#</th>
                                <th>Tên thú cưng</th>
                                <th>Loại</th>
                                <th>Tuổi</th>
                                <th style="width: 200px">Thao tác</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                for (int i = 0; i < petList.size(); i++) {
                                    Pet pet = petList.get(i);
                            %>
                            <tr>
                                <td class="text-center"><%= i+1 %></td>
                                <td>
                                    <a href="PetProfileServlet?action=view&index=<%= i %>" 
                                       class="pet-name text-decoration-none">
                                        <div class="pet-avatar">
                                            <i class="fas fa-paw"></i>
                                        </div>
                                        <%= pet.getName() %> <!-- 8.1.7. Người dùng có thể sửa tên , tuổi ,loài  -->
                                    </a>
                                </td>
                                <td>
                                    <span class="badge bg-info">
                                        <i class="fas fa-tag me-1"></i><%= pet.getType() %> <!-- 8.1.7. Người dùng có thể sửa tên , tuổi ,loài  -->
                                    </span>
                                </td>
                                <td><%= pet.getAge() %> tuổi</td> <!-- 8.1.7. Người dùng có thể sửa tên , tuổi ,loài  -->
                                <td>
                                    <div class="action-buttons">
                                        <a href="PetProfileServlet?action=edit&index=<%= i %>" 
                                           class="btn btn-warning btn-sm">
                                            <i class="fas fa-edit me-1"></i>Sửa <!-- 8.1.6.Người dùng chọn “sửa thú cưng” -->
                                        </a>
                                        <a href="PetProfileServlet?action=delete&index=<%= i %>" 
                                           class="btn btn-danger btn-sm"
                                           onclick="return confirm('Bạn chắc chắn muốn xóa thú cưng này?');"><!-- 8.1.11.Hệ thống hỏi xem có chắc chắn không -->
                                            <i class="fas fa-trash-alt me-1"></i>Xóa <!-- 8.1.10.Người dùng chọn “xóa thú cưng” -->
                                        </a>
                                    </div>
                                </td>
                            </tr>
                            <% } %>
                        </tbody>
                    </table>
                <% } %>
            </div>
        </div>
    </div>

    <!-- Scripts -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    
    <script>
        // Add smooth hover effects
        $(document).ready(function() {
            $('.btn').hover(
                function() { $(this).addClass('shadow-sm'); },
                function() { $(this).removeClass('shadow-sm'); }
            );
        });
    </script>
</body>
</html>
