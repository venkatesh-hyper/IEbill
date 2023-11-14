/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/billServlet")
public class BillServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Retrieve data from the form
        String productName = request.getParameter("productName");
        int quantity = Integer.parseInt(request.getParameter("quantity"));

        // Calculate total cost (replace this with your actual business logic)
        double unitPrice = 10.0; // Replace with your actual unit price
        double totalCost = unitPrice * quantity;

        // Generate bill
        String billContent = "Product: " + productName + "<br>" +
                             "Quantity: " + quantity + "<br>" +
                             "Unit Price: $" + unitPrice + "<br>" +
                             "Total Cost: $" + totalCost;

        // Send the bill as the response
        response.setContentType("text/html");
        response.getWriter().println("<html><body>");
        response.getWriter().println("<h2>Generated Bill</h2>");
        response.getWriter().println(billContent);
        response.getWriter().println("</body></html>");
    }
}