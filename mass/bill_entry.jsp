<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Bill Entry</title>
</head><link rel="stylesheet" href="style.css">
<body id="gred">
<div align="center">
    <h1 align="center">Bill Entry</h1>
    <form method="post" >
        <label for="itemName">Item Name:</label>
        <input type="text" name="itemName" required><br><br>

        <label for="price">Price:</label>
        <input type="number" name="price" required><br><br>

        <label for="quantity">Quantity:</label>
        <input type="number" name="quantity" value="1" required><br><br>

        <button class="button button1"><input type="submit" value="Add Item"></button>
    </form>
    </div>
    <a href="index.html"><button class="button button2">HOME</button></a>
</html>
