/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package createFileInvoice;
import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Chunk;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.Font.FontFamily;
import com.itextpdf.text.FontFactory;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import dao.BillDetailDAO;
import dao.ProductDAO;
import java.io.*;
import java.sql.SQLException;
import model.Bill;
import model.BillDetail;
import model.Product;
import model.Users;
/**
 *
 * @author khanh
 */
public class createFileInvoice {
    //create file html
    public void createHtml(String path,Bill bill,Users users) throws IOException, SQLException{
        ProductDAO productDAO = new ProductDAO();
        BillDetailDAO billDetailDAO = new BillDetailDAO();
        File file = new File(path +"/invoice.html");

        if(file.createNewFile()){
            System.out.println("create true!");
        }else{
            System.out.println("create failed!");
        }   
       FileWriter writer = new FileWriter(file);

              writer.write("<html><head>\n" +
               "<meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n" +
               "<title>Mobile E-Shop</title>\n" +
                      "<style>"
                      +".invoice{\n" +
                       "    font-family:sans-serif;\n" +
                       "    width: 50%;\n" +
                       "    margin-left: 25%;\n" +
                       "    margin-top: 5%;\n" +
                       "    background: gainsboro;\n" +
                       "    padding: 10px;\n" +
                       "    border-radius: 10px;\n" +
                       "}\n" +
                       ".invoicetb{\n" +
                       "    border-collapse: collapse;\n" +
                       "    width: 100%;\n" +
                       "    text-align: center;\n" +
                       "}"
                      + ".invoicetb th,td{\n" +
                       "    border: solid darkcyan;\n" +
                       "}\n" +
                       ".invoice a{\n" +
                       "    color: darkcyan;\n" +
                       "    padding: 0px 5px;\n" +
                       "}\n" +
                       "#headlink{\n" +
                       "    text-decoration: none;\n" +
                       "    color: black;\n" +
                       "    font-size: 25px;\n" +
                       "    position: relative;\n" +
                       "    float:right;\n" +
                       "    margin-right: 10px;\n" +
                       "    transition: 0.3s;\n" +
                       "}\n" +
                       "#headlink:hover{\n" +
                       "    text-decoration: none;\n" +
                       "    font-size: 120%;\n" +
                       "}"
                      + "</style>"
                      +
               "</head> <body>");
              String dataWrite=
                       "<div class=\"invoice\"><em><p>Envoice ID:+"+bill.getBillID()+"</p></em>"+
                       "<center><h1 style=\"color:darkcyan;\">INVOICE</h1></center>"+
                       "<p><b>Account:</b> "+users.getUserEmail()+"</p>"+
                       "<p><b>Payment Method:</b> "+bill.getPayment()+"</p>"+
                       "<p><b>Address:</b>"+bill.getAddress()+"</p>"+
                       "<p><b>Date:</b>"+bill.getDate()+"</p>"+
                       "<p><b>Bill Detail:</b></p>"+
                       "<center>"+
                       "<table class=\"invoicetb\"b>"+
                       "<tr>"+
                       "<th></th><th>Product ID</th><th>Product Name</th><th>Price</th><th>Quantity</th>"+
                       "</tr>";

                       int count=0;
                       for (BillDetail bd : billDetailDAO.getListBillDetailByBill(bill.getBillID())){
                           count++;
                           Product product = new Product();
                           product = productDAO.getProduct(bd.getProductID());
                           dataWrite = dataWrite + "<tr>\n" +
                           "<td><p>"+count+"</p></td>\n" +
                           "<td><p>"+bd.getProductID()+"</p></td>\n" +
                           "<td><p>"+product.getProductName()+"</p></td>\n" +
                           "<td><p>$"+bd.getPrice()+"</p></td>\n" +
                           "<td><p>"+bd.getQuantity()+"</p></td>\n" +
                           "</tr>";
                       }
                  dataWrite = dataWrite + "<tr>"+
                           "<td colspan=\"5\"><b><p class=\"invoicett\">Total: $" + bill.getTotal() + "</p></b></td>"+
                           "</tr>\n" +
                           "</table>";


              writer.write(dataWrite);
              writer.write("</body></html> ");

              writer.close();
    }
    //create file pdf
    public void createPdf(String path,Bill bill,Users users ) throws SQLException, DocumentException {
        ProductDAO productDAO = new ProductDAO();
        BillDetailDAO billDetailDAO = new BillDetailDAO();
        
        try {
            Document document = new Document();
            PdfWriter.getInstance(document, new FileOutputStream(path+"invoice.pdf"));
            document.open();
            Paragraph id = new Paragraph();
            
            Font font = new Font(FontFamily.TIMES_ROMAN);
            id.add("Envoice ID:"+ bill.getBillID());
            id.setFont(font);
            document.add(id);
           
            document.add(new Paragraph("INVOICE",FontFactory.getFont(FontFactory.TIMES_ROMAN, 14, Font.BOLD, new BaseColor(0,139,139))));
            
            document.add(new Chunk("Account:",FontFactory.getFont(FontFactory.TIMES_ROMAN, 14, Font.BOLD, new BaseColor(0,139,139))));
            document.add(new Chunk(users.getUserEmail()));
            document.add(new Paragraph(""));
            
            document.add(new Chunk("Payment Method:",FontFactory.getFont(FontFactory.TIMES_ROMAN, 14, Font.BOLD, new BaseColor(0,139,139))));
            document.add(new Chunk(bill.getPayment()));
            document.add(new Paragraph(""));
            
            document.add(new Chunk("Address:",FontFactory.getFont(FontFactory.TIMES_ROMAN, 14, Font.BOLD, new BaseColor(0,139,139))));
            document.add(new Chunk(bill.getAddress()));
            document.add(new Paragraph(""));
            
            document.add(new Chunk("Date:",FontFactory.getFont(FontFactory.TIMES_ROMAN, 14, Font.BOLD, new BaseColor(0,139,139))));
            document.add(new Chunk( bill.getDate().toString()));
            document.add(new Paragraph(""));
            
            document.add(new Paragraph("Bill Detail:",FontFactory.getFont(FontFactory.TIMES_ROMAN, 14, Font.BOLD, new BaseColor(0,139,139))));
            document.add(new Paragraph("\n"));
           
            //table
            PdfPTable table = new PdfPTable(5);
            table.setWidths(new float[] { (float)0.5 ,2,5,(float)1.8,(float)1.7});
            PdfPCell cell = new PdfPCell();
            cell.setHorizontalAlignment(Element.ALIGN_CENTER);
            table.addCell(cell);
            
            cell = new PdfPCell(new Phrase("Product ID",FontFactory.getFont(FontFactory.TIMES_ROMAN, 14, Font.BOLD, new BaseColor(0,139,139))));
            cell.setColspan(1);
            cell.setHorizontalAlignment(Element.ALIGN_CENTER);
            table.addCell(cell);
            
            cell = new PdfPCell(new Phrase("Product Name",FontFactory.getFont(FontFactory.TIMES_ROMAN, 14, Font.BOLD, new BaseColor(0,139,139))));
            cell.setHorizontalAlignment(Element.ALIGN_CENTER);
            table.addCell(cell);
            cell = new PdfPCell(new Phrase("Price",FontFactory.getFont(FontFactory.TIMES_ROMAN, 14, Font.BOLD, new BaseColor(0,139,139))));
            cell.setHorizontalAlignment(Element.ALIGN_CENTER);
            table.addCell(cell);
            cell = new PdfPCell(new Phrase("Quantity",FontFactory.getFont(FontFactory.TIMES_ROMAN, 14, Font.BOLD, new BaseColor(0,139,139))));
            cell.setHorizontalAlignment(Element.ALIGN_CENTER);
            table.addCell(cell);
            
            int count=0;
            for (BillDetail bd : billDetailDAO.getListBillDetailByBill(bill.getBillID())){
                    count++;
                    Product product = new Product();
                    product = productDAO.getProduct(bd.getProductID());
                    //stt
                    cell = new PdfPCell(new Phrase(String.valueOf(count)));
                    cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                    table.addCell(cell);
                    //id
                    cell = new PdfPCell(new Phrase(String.valueOf(bd.getProductID())));
                    cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                    table.addCell(cell);
                    //name
                    cell = new PdfPCell(new Phrase(String.valueOf(product.getProductName())));
                    cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                    table.addCell(cell);
                    //price    
                    cell = new PdfPCell(new Phrase("$"+String.valueOf(bd.getPrice())));
                    cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                    table.addCell(cell);
                    //quantity
                    cell = new PdfPCell(new Phrase(String.valueOf(bd.getQuantity())));
                    cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                    table.addCell(cell);
                    }
            
            cell = new PdfPCell(new Phrase("Total:$"+bill.getTotal(),FontFactory.getFont(FontFactory.TIMES_ROMAN, 14, Font.BOLD, new BaseColor(0,139,139))));
            cell.setColspan(5);
            cell.setHorizontalAlignment(Element.ALIGN_CENTER);
            table.addCell(cell);
           
            
           
            document.add(table);
            document.close();
        } catch (FileNotFoundException ex) {
            
        }
    }

}
