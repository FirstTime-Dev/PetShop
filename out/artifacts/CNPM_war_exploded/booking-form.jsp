<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Đặt lịch chăm sóc thú cưng</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f9f9f9;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .form-container {
            background: #fff;
            padding: 30px 40px;
            border-radius: 10px;
            box-shadow: 0 0 12px rgba(0, 0, 0, 0.15);
            width: 400px;
        }
        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 20px;
        }
        label {
            display: block;
            margin-top: 12px;
            font-weight: bold;
            color: #444;
        }
        input, select {
            width: 100%;
            padding: 8px;
            margin-top: 5px;
            border-radius: 5px;
            border: 1px solid #ccc;
        }
        button {
            margin-top: 20px;
            padding: 10px;
            width: 100%;
            background-color: #28a745;
            border: none;
            color: white;
            font-weight: bold;
            border-radius: 5px;
            cursor: pointer;
        }
        button:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>
<div class="form-container">
    <h2>Đặt lịch chăm sóc thú cưng</h2>
    <form action="${pageContext.request.contextPath}/bookService" method="post">
        <label>Loại dịch vụ:</label>
        <select name="serviceType">
            <option value="Tắm">Tắm</option>
            <option value="Khám">Khám</option>
            <option value="Tiêm">Tiêm</option>
            <option value="Cắt tỉa lông">Cắt tỉa lông</option>
        </select>

        <label>Ngày:</label>
        <input type="date" name="date" required>

        <label>Giờ:</label>
        <input type="time" name="time" required>

        <label>Tên thú cưng:</label>
        <input type="text" name="petName" required>

        <label>Loại thú cưng:</label>
        <input type="text" name="petType" required>

        <button type="submit">Gửi yêu cầu</button>
    </form>
</div>
</body>
</html>
