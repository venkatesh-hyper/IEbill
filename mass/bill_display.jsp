<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.io.FileWriter" %>
<%@ page import="java.io.BufferedWriter" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Bill Exports</title>
</head>
<link rel="stylesheet" href="style.css">
<body id="gred">

<%! List<String> items = new ArrayList<>(); %>
<%! List<Double> prices = new ArrayList<>(); %>
<%! List<Integer> quantities = new ArrayList<>(); %>
<%! String customerName = ""; %>
<%! Double totalAmount = 0.0; %>
<%! int numberOfItems = 0; %>

<h1 align="center"><b><U>BILL PRINTING</U></b></h1>

<form method="post" action="" align="center">
    <label for="customerName">Customer Name:</label>
    <input type="text" name="customerName"><br><br><br>

    <label for="item">Item:</label>
    <input type="text" name="item" required><br><br><br>

    <label for="price">Price:</label>
    <input type="number" name="price" required><br><br><br>

    <label for="quantity">Quantity:</label>
    <input type="number" name="quantity" value="1" required><br><br><br>

    <button class="button button2" type="submit" name="addItem" value="Add Item">ADD ITEMS</button>
</form>

<%
    if (request.getParameter("addItem") != null) {
        if (customerName.isEmpty()) {
            customerName = request.getParameter("customerName");
        }

        String item = request.getParameter("item");
        double price = Double.parseDouble(request.getParameter("price"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));

        items.add(item);
        prices.add(price);
        quantities.add(quantity);

        totalAmount += price * quantity;
        numberOfItems += quantity;
    }

    if (request.getParameter("printBill") != null) {
        String fileName = "bill_history.txt";
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(fileName, true))) {
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            String timestamp = dateFormat.format(new Date());

            for (int i = 0; i < items.size(); i++) {
                writer.write("Timestamp: " + timestamp + "\n");
                writer.write("Customer Name: " + customerName + "\n");
                writer.write("Item: " + items.get(i) + ": ₹" + prices.get(i) + " x " + quantities.get(i) + "\n");
                writer.write("Total Amount: ₹" + (prices.get(i) * quantities.get(i)) + "\n");
                writer.write("Number of Items: " + quantities.get(i) + "\n\n");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        // Reset the lists, totalAmount, and numberOfItems
        items.clear();
        prices.clear();
        quantities.clear();
        totalAmount = 0.0;
        numberOfItems = 0;
        customerName = "";
    }
%>

<h2>Items</h2>
<ul>
    <% for (int i = 0; i < items.size(); i++) { %>
        <li>Customer: <%= customerName %>, <%= items.get(i) %>: ₹<%= prices.get(i) %> x <%= quantities.get(i) %></li>
    <% } %>
</ul>

<p>Total Amount: ₹<%= totalAmount %></p>
<p>Number of Items: <%= numberOfItems %></p>

<form method="post" action="">
    <button class="button button1" type="submit" name="printBill" value="Print Bill" align="center">PRINT BILL</button>
</form>
<a href="index.html"><button class="button button2">HOME</button></a>

</body>
</html>
