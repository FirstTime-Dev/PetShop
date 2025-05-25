<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, model.Product" %>
<%
  List<Product> results = (List<Product>) request.getAttribute("searchResults");
%>
<div id="resultsContainer">
  <%
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
      <img src="<%=request.getContextPath()%>/images/<%=p.getImage()%>" alt="" />
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
