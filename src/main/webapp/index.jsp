<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Petshop - Chăm sóc thú cưng</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <!-- Owl Carousel -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.theme.default.min.css" rel="stylesheet">
    <style>
        :root {
            --primary-color: #4CAF50;
            --secondary-color: #45a049;
            --accent-color: #ff6b6b;
            --text-color: #2c3e50;
            --light-gray: #f8f9fa;
        }

        body {
            font-family: 'Segoe UI', Arial, sans-serif;
            color: var(--text-color);
        }

        /* Navbar Styles */
        .navbar {
            background-color: white;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }

        .navbar-brand {
            font-weight: 700;
            color: var(--primary-color);
        }

        .nav-link {
            color: var(--text-color);
            font-weight: 500;
            transition: color 0.3s ease;
        }

        .nav-link:hover {
            color: var(--primary-color);
        }

        /* Search Section */
        .search-section {
            background: linear-gradient(135deg, #f5f7fa 0%, #e4e8eb 100%);
            padding: 40px 0;
        }

        .search-container {
            position: relative;
            max-width: 600px;
            margin: 0 auto;
        }

        .search-input {
            width: 100%;
            padding: 15px 20px;
            border: none;
            border-radius: 30px;
            box-shadow: 0 4px 20px rgba(0,0,0,0.1);
            font-size: 1.1rem;
            padding-right: 50px;
        }

        .search-btn {
            position: absolute;
            right: 5px;
            top: 5px;
            background: var(--primary-color);
            border: none;
            border-radius: 50%;
            width: 40px;
            height: 40px;
            color: white;
            transition: all 0.3s ease;
        }

        .search-btn:hover {
            background: var(--secondary-color);
            transform: scale(1.05);
        }

        /* Product Section */
        .section-title {
            text-align: center;
            margin-bottom: 40px;
            font-weight: 700;
            color: var(--text-color);
        }

        .product-card {
            background: white;
            border-radius: 15px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
            transition: transform 0.3s ease;
            margin-bottom: 30px;
            overflow: hidden;
        }

        .product-card:hover {
            transform: translateY(-5px);
        }

        .product-image {
            width: 100%;
            height: 200px;
            object-fit: cover;
        }

        .product-details {
            padding: 20px;
        }

        .product-title {
            font-weight: 600;
            margin-bottom: 10px;
            color: var(--text-color);
        }

        .product-price {
            color: var(--accent-color);
            font-weight: 700;
            font-size: 1.2rem;
            margin-bottom: 15px;
        }

        .product-rating {
            color: #ffd700;
            margin-bottom: 15px;
        }

        .stock-status {
            font-size: 0.9rem;
            color: var(--primary-color);
            margin-bottom: 15px;
        }

        .add-to-cart-btn {
            width: 100%;
            background: var(--primary-color);
            color: white;
            border: none;
            padding: 10px;
            border-radius: 5px;
            transition: all 0.3s ease;
        }

        .add-to-cart-btn:hover {
            background: var(--secondary-color);
        }

        /* Services Section */
        .services-section {
            background: var(--light-gray);
            padding: 60px 0;
        }

        .service-card {
            text-align: center;
            padding: 30px;
            background: white;
            border-radius: 15px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
            transition: transform 0.3s ease;
            margin-bottom: 30px;
        }

        .service-card:hover {
            transform: translateY(-5px);
        }

        .service-icon {
            font-size: 3rem;
            color: var(--primary-color);
            margin-bottom: 20px;
        }

        /* Cart Floating Button */
        .cart-float-btn {
            position: fixed;
            bottom: 30px;
            right: 30px;
            background: var(--accent-color);
            color: white;
            width: 60px;
            height: 60px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.5rem;
            box-shadow: 0 4px 15px rgba(0,0,0,0.2);
            transition: all 0.3s ease;
            z-index: 1000;
        }

        .cart-float-btn:hover {
            transform: scale(1.1);
            background: #ff5252;
            color: white;
        }

        .cart-badge {
            position: absolute;
            top: -5px;
            right: -5px;
            background: var(--primary-color);
            color: white;
            border-radius: 50%;
            width: 25px;
            height: 25px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 0.8rem;
        }

        /* Responsive Adjustments */
        @media (max-width: 768px) {
            .search-section {
                padding: 20px;
            }

            .product-card {
                margin-bottom: 20px;
            }

            .service-card {
                margin-bottom: 20px;
            }
        }
    </style>
</head>
<body>
<!-- Navbar -->
<nav class="navbar navbar-expand-lg sticky-top">
    <div class="container">
        <a class="navbar-brand d-flex align-items-center" href="#">
            <img src="images/image.png" alt="PetShop Logo" style="height: 40px; margin-right: 10px;">
            <span>PetShop</span>
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item">
                    <a class="nav-link" href="#products">Sản phẩm</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#services">Dịch vụ</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="booking-form.jsp">Đặt lịch</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#pet-profiles">Hồ sơ thú cưng</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#account">
                        <i class="fas fa-user me-1"></i>
                        Tài khoản
                    </a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<!-- Search Section -->
<section class="search-section">
    <div class="container">
        <div class="search-container">
            <input type="text" class="search-input" placeholder="Tìm kiếm sản phẩm..." id="searchInput">
            <button class="search-btn">
                <i class="fas fa-search"></i>
            </button>
        </div>
    </div>
</section>

<!-- Best Selling Products -->
<section class="py-5" id="products">
    <div class="container">
        <h2 class="section-title">Sản phẩm bán chạy</h2>
        <div class="row">
            <!-- Product Card 1 -->
            <div class="col-md-3 col-sm-6">
                <div class="product-card">
                    <img src="https://via.placeholder.com/300x200" alt="Product" class="product-image">
                    <div class="product-details">
                        <h5 class="product-title">Royal Canin Mini Adult</h5>
                        <div class="product-price">350.000đ</div>
                        <div class="product-rating">
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star-half-alt"></i>
                        </div>
                        <div class="stock-status">
                            <i class="fas fa-check-circle me-1"></i>
                            Còn hàng
                        </div>
                        <button class="add-to-cart-btn">
                            <i class="fas fa-shopping-cart me-1"></i>
                            Thêm vào giỏ
                        </button>
                    </div>
                </div>
            </div>

            <!-- Product Card 2 -->
            <div class="col-md-3 col-sm-6">
                <div class="product-card">
                    <img src="https://via.placeholder.com/300x200" alt="Product" class="product-image">
                    <div class="product-details">
                        <h5 class="product-title">Pate Whiskas cho mèo</h5>
                        <div class="product-price">25.000đ</div>
                        <div class="product-rating">
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="far fa-star"></i>
                        </div>
                        <div class="stock-status">
                            <i class="fas fa-check-circle me-1"></i>
                            Còn hàng
                        </div>
                        <button class="add-to-cart-btn">
                            <i class="fas fa-shopping-cart me-1"></i>
                            Thêm vào giỏ
                        </button>
                    </div>
                </div>
            </div>

            <!-- More product cards... -->
        </div>
    </div>
</section>

<!-- Services Section -->
<section class="services-section" id="services">
    <div class="container">
        <h2 class="section-title">Dịch vụ của chúng tôi</h2>
        <div class="row">
            <!-- Service Card 1 -->
            <div class="col-md-4">
                <div class="service-card">
                    <div class="service-icon">
                        <i class="fas fa-bath"></i>
                    </div>
                    <h4>Tắm và cắt tỉa lông</h4>
                    <p>Dịch vụ tắm và cắt tỉa lông chuyên nghiệp cho thú cưng</p>
                    <a href="booking-form.jsp" class="btn btn-primary">Đặt lịch ngay</a>
                </div>
            </div>

            <!-- Service Card 2 -->
            <div class="col-md-4">
                <div class="service-card">
                    <div class="service-icon">
                        <i class="fas fa-stethoscope"></i>
                    </div>
                    <h4>Khám và điều trị</h4>
                    <p>Dịch vụ khám và điều trị bệnh cho thú cưng</p>
                    <a href="booking-form.jsp" class="btn btn-primary">Đặt lịch ngay</a>
                </div>
            </div>

            <!-- Service Card 3 -->
            <div class="col-md-4">
                <div class="service-card">
                    <div class="service-icon">
                        <i class="fas fa-syringe"></i>
                    </div>
                    <h4>Tiêm phòng</h4>
                    <p>Dịch vụ tiêm phòng và vắc-xin cho thú cưng</p>
                    <a href="booking-form.jsp" class="btn btn-primary">Đặt lịch ngay</a>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Floating Cart Button -->
<a href="#cart" class="cart-float-btn">
    <i class="fas fa-shopping-cart"></i>
    <span class="cart-badge">0</span>
</a>

<!-- Scripts -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>

<script>
    // Autocomplete search
    $(document).ready(function() {
        $('#searchInput').on('input', function() {
            // Implement autocomplete logic here
            const searchTerm = $(this).val();
            if (searchTerm.length > 2) {
                // Make AJAX call to get suggestions
                // Example: $.get('/api/search-suggestions?term=' + searchTerm)
            }
        });
    });

    // Add to cart functionality
    $('.add-to-cart-btn').click(function() {
        // Implement add to cart logic here
        const currentCount = parseInt($('.cart-badge').text());
        $('.cart-badge').text(currentCount + 1);

        // Show success message
        alert('Đã thêm sản phẩm vào giỏ hàng!');
    });
</script>
</body>
</html>
