<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, model.Product" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Tìm kiếm sản phẩm</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #ffffff;
            margin: 0;
            padding: 0;
        }
        .header {
            background-color: #2e7d32;
            color: white;
            padding: 10px 20px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            position: relative;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }
        .header .logo {
            height: 50px;
            flex-shrink: 0;
        }
        .header h1 {
            position: absolute;
            left: 50%;
            transform: translateX(-50%);
            margin: 0;
            font-size: 24px;
            font-weight: normal;
            white-space: nowrap;
        }
        .header-spacer {
            width: 50px;
            flex-shrink: 0;
        }
        .container {
            width: 80%;
            margin: 50px auto;
        }
        form {
            width: 100%;
            text-align: center;
            margin-bottom: 30px;
            display: inline-flex;
            align-items: center;
            justify-content: center;
        }
        input[type="text"] {
            padding: 10px;
            width: 300px;
            border: 2px solid #2e7d32;
            border-radius: 5px;
        }
        form button {
            background: none;
            border: none;
            cursor: pointer;
            margin-left: 5px;
            color: #2e7d32;
            transition: color 0.3s ease, transform 0.3s ease;
            font-size: 18px;
            padding: 0;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        form button:hover {
            color: #145214;
            transform: scale(1.2);
        }
        .products-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
            gap: 40px;
        }
        .product {
            width: 280px;
            height: 300px;
            border: 2px solid #2e7d32;
            border-radius: 10px;
            padding: 15px;
            background-color: #f9fdf9;
            box-shadow: 0 2px 8px rgba(46, 125, 50, 0.15);
            transition: transform 0.2s ease;
            display: flex;
            flex-direction: column;
            align-items: center;
            text-align: center;
        }
        .product:hover {
            transform: translateY(-5px);
            box-shadow: 0 6px 12px rgba(46, 125, 50, 0.3);
            cursor: pointer;
        }
        .product img {
            width: 100%;
            height: 180px;
            border-radius: 8px;
            margin-bottom: 10px;
        }
        .product h3 {
            margin: 5px 0 10px;
            color: #2e7d32;
            font-size: 20px;
            height: 48px;
            overflow: hidden;
        }
        .product p {
            margin: 8px 0;
            color: #555;
            font-size: 14px;
        }
        .product .price {
            font-weight: bold;
            color: #1b5e20;
            font-size: 18px;
        }
        .no-result {
            color: #d32f2f;
            text-align: center;
            font-size: 18px;
        }
    </style>
</head>
<body>
<div class="header">
    <img src="<%=request.getContextPath()%>/images/image.png" class="logo" />
    <h1>Tìm kiếm tất cả nhưng gì bạn cần</h1>
    <div class="header-spacer"></div>
</div>
<div class="container">
    <form id="searchForm" action="search" method="get">
        <input oninput="searchByName(this)" type="text" name="keyword" placeholder="Nhập tên sản phẩm...">
        <button type="submit">
            <i class="fas fa-search"></i>
        </button>
    </form>
    <div id="resultsContainer">
        <%
            List<Product> results = (List<Product>) session.getAttribute("searchResults");
            if (results == null || results.isEmpty()) {
        %>
        <div class="no-result">Không tìm thấy sản phẩm</div>
        <%
        } else {
        %>
        <div class="products-grid">
            <%
                for (Product p : results) {
            %>
            <div class="product">
                <img src="<%=request.getContextPath()%>/images/<%=p.getImage()%>" />
                <h3><%= p.getName() %></h3>
                <p class="price">Giá: <%= p.getPrice() %> VND</p>
                <p>Mô tả: <%= p.getDescription() %></p>
            </div>
            <%
                }
            %>
        </div>
        <%
            }
        %>
    </div>
</div>
<script>
    function searchByName(param) {
        var textSearch = param.value;
        $.ajax({
            url: '<%=request.getContextPath()%>/search',
            type: 'get',
            data: {
                txt : textSearch,
            },
            success: function(data) {
                var result = document.getElementById("resultsContainer");
                result.innerHTML = data;
            },
            error: function () {
                alert("Đã xảy ra lỗi khi tìm kiếm.");
            }
        });
    }
</script>
</body>
</html>
