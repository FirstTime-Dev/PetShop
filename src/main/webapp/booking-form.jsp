<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%
    LocalDate currentDate = LocalDate.now();
    String todayDate = currentDate.format(DateTimeFormatter.ISO_DATE);
%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đặt lịch chăm sóc thú cưng - Hệ thống đặt lịch dịch vụ</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        :root {
            --primary-color: #4CAF50;
            --secondary-color: #45a049;
            --error-color: #dc3545;
        }

        body {
            font-family: 'Segoe UI', Arial, sans-serif;
            background: linear-gradient(135deg, #f5f7fa 0%, #e4e8eb 100%);
            min-height: 100vh;
            padding: 40px 0;
        }

        .booking-container {
            background: rgba(255, 255, 255, 0.95);
            border-radius: 20px;
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.1);
            backdrop-filter: blur(10px);
            padding: 40px;
            max-width: 800px;
            margin: 0 auto;
            animation: fadeIn 0.5s ease;
        }

        .form-header {
            text-align: center;
            margin-bottom: 40px;
        }

        .form-header h2 {
            color: #2c3e50;
            font-size: 2.2rem;
            font-weight: 700;
            margin-bottom: 15px;
        }

        .form-header p {
            color: #7f8c8d;
            font-size: 1.1rem;
        }

        .form-group {
            margin-bottom: 25px;
            position: relative;
        }

        .form-label {
            font-weight: 600;
            color: #2c3e50;
            margin-bottom: 8px;
            display: block;
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

        .form-select {
            border: 2px solid #e9ecef;
            border-radius: 10px;
            padding: 12px;
            font-size: 1rem;
            transition: all 0.3s ease;
            background-position: right 12px center;
        }

        .form-select:focus {
            border-color: var(--primary-color);
            box-shadow: 0 0 0 0.2rem rgba(76, 175, 80, 0.25);
        }

        .input-icon {
            position: absolute;
            right: 15px;
            top: 45px;
            color: #7f8c8d;
        }

        .submit-btn {
            background-color: var(--primary-color);
            color: white;
            padding: 15px 40px;
            border-radius: 10px;
            border: none;
            font-size: 1.1rem;
            font-weight: 600;
            width: 100%;
            margin-top: 20px;
            transition: all 0.3s ease;
        }

        .submit-btn:hover {
            background-color: var(--secondary-color);
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(76, 175, 80, 0.3);
        }

        .back-btn {
            display: inline-block;
            color: #7f8c8d;
            text-decoration: none;
            margin-top: 20px;
            transition: color 0.3s ease;
        }

        .back-btn:hover {
            color: var(--primary-color);
        }

        .service-type-card {
            border: 2px solid #e9ecef;
            border-radius: 10px;
            padding: 15px;
            margin-bottom: 10px;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .service-type-card:hover {
            border-color: var(--primary-color);
            background-color: #f8f9fa;
        }

        .service-type-card.selected {
            border-color: var(--primary-color);
            background-color: #f1f8f1;
        }

        .service-icon {
            font-size: 1.5rem;
            color: var(--primary-color);
            margin-right: 10px;
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        /* Responsive adjustments */
        @media (max-width: 768px) {
            .booking-container {
                margin: 20px;
                padding: 30px;
            }

            .form-header h2 {
                font-size: 1.8rem;
            }
        }
    </style>
</head>
<body>
<div class="container">
    <div class="booking-container">
        <div class="form-header">
            <h2>Đặt lịch chăm sóc thú cưng</h2>
            <p>Hãy điền thông tin để đặt lịch dịch vụ cho thú cưng của bạn</p>
        </div>

        <form action="${pageContext.request.contextPath}/bookService" method="post" class="needs-validation" novalidate>
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group">
                        <label class="form-label">Loại dịch vụ</label>
                        <div class="service-type-card selected" onclick="selectService(this, 'Tắm')">
                            <i class="fas fa-bath service-icon"></i>
                            <span>Tắm</span>
                        </div>
                        <div class="service-type-card" onclick="selectService(this, 'Khám')">
                            <i class="fas fa-stethoscope service-icon"></i>
                            <span>Khám</span>
                        </div>
                        <div class="service-type-card" onclick="selectService(this, 'Tiêm')">
                            <i class="fas fa-syringe service-icon"></i>
                            <span>Tiêm</span>
                        </div>
                        <div class="service-type-card" onclick="selectService(this, 'Cắt tỉa lông')">
                            <i class="fas fa-cut service-icon"></i>
                            <span>Cắt tỉa lông</span>
                        </div>
                        <input type="hidden" name="serviceType" id="serviceType" value="Tắm" required>
                    </div>
                </div>

                <div class="col-md-6">
                    <div class="form-group">
                        <label class="form-label">Ngày đặt lịch</label>
                        <input type="date"
                               class="form-control"
                               name="date"
                               id="bookingDate"
                               required
                               value="<%= todayDate %>"
                               min="<%= todayDate %>">
                        <i class="fas fa-calendar input-icon"></i>
                        <div class="invalid-feedback">
                            Vui lòng chọn ngày đặt lịch (không được chọn ngày trong quá khứ)
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="form-label">Giờ đặt lịch</label>
                        <select class="form-select" name="time" id="bookingTime" required>
                            <option value="">Chọn giờ đặt lịch</option>
                            <option value="08:00">08:00</option>
                            <option value="09:00">09:00</option>
                            <option value="10:00">10:00</option>
                            <option value="11:00">11:00</option>
                            <option value="13:00">13:00</option>
                            <option value="14:00">14:00</option>
                            <option value="15:00">15:00</option>
                            <option value="16:00">16:00</option>
                        </select>
                        <i class="fas fa-clock input-icon"></i>
                        <div class="invalid-feedback">
                            Vui lòng chọn giờ đặt lịch
                        </div>
                        <small class="text-muted">Thời gian làm việc: 8:00 - 17:00 (Nghỉ trưa: 12:00 - 13:00)</small>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-md-6">
                    <div class="form-group">
                        <label class="form-label">Tên thú cưng</label>
                        <input type="text" class="form-control" name="petName" required placeholder="VD: Mèo mập">
                        <i class="fas fa-paw input-icon"></i>
                    </div>
                </div>

                <div class="col-md-6">
                    <div class="form-group">
                        <label class="form-label">Loại thú cưng</label>
                        <select class="form-select" name="petType" required>
                            <option value="">Chọn loại thú cưng</option>
                            <option value="Chó">Chó</option>
                            <option value="Mèo">Mèo</option>
                            <option value="Hamster">Hamster</option>
                            <option value="Khác">Khác</option>
                        </select>
                        <i class="fas fa-chevron-down input-icon"></i>
                    </div>
                </div>
            </div>

            <div class="form-group">
                <label class="form-label">Ghi chú thêm (không bắt buộc)</label>
                <textarea class="form-control" name="notes" rows="3" placeholder="Nhập các yêu cầu đặc biệt hoặc lưu ý về thú cưng của bạn"></textarea>
            </div>

            <button type="submit" class="submit-btn">
                <i class="fas fa-calendar-check me-2"></i>
                Xác nhận đặt lịch
            </button>

            <div class="text-center">
                <a href="home.jsp" class="back-btn">
                    <i class="fas fa-arrow-left me-2"></i>
                    Quay lại trang chủ
                </a>
            </div>
        </form>
    </div>
</div>

<!-- Bootstrap JS and Popper.js -->
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>

<script>
    // Form validation
    (function () {
        'use strict'
        var forms = document.querySelectorAll('.needs-validation')
        Array.prototype.slice.call(forms).forEach(function (form) {
            form.addEventListener('submit', function (event) {
                const dateInput = document.getElementById('bookingDate');
                const timeInput = document.getElementById('bookingTime');

                // Kiểm tra ngày
                const selectedDate = new Date(dateInput.value);
                const today = new Date();
                today.setHours(0, 0, 0, 0);

                if (selectedDate < today) {
                    event.preventDefault();
                    event.stopPropagation();
                    alert('Không thể chọn ngày trong quá khứ');
                    return;
                }

                // Kiểm tra giờ
                if (!timeInput.value) {
                    event.preventDefault();
                    event.stopPropagation();
                    alert('Vui lòng chọn giờ đặt lịch');
                    return;
                }

                if (!form.checkValidity()) {
                    event.preventDefault();
                    event.stopPropagation();
                }

                form.classList.add('was-validated');
            }, false)
        })
    })()

    // Service type selection
    function selectService(element, service) {
        document.querySelectorAll('.service-type-card').forEach(card => {
            card.classList.remove('selected');
        });
        element.classList.add('selected');
        document.getElementById('serviceType').value = service;
    }
</script>
</body>
</html>
