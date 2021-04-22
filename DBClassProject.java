// import the sql library
import java.sql.*;
import java.util.*;

public class DBClassProject {
    public static void main(String[] args) throws SQLException {
        // create a scanner to take in user input
        Scanner stdin = new Scanner(System.in);

        //record user input for username
        System.out.println("Enter a username: ");
        String username = stdin.next();

        // record user input for password
        System.out.println("Enter a password: ");
        String password = stdin.next();

        // connection saved as string
        String url = "jdbc:mysql://localhost/zion";
        // open the connection to the database whose url is above
        // hard-coded login info to make it easier to access
        Connection conn = DriverManager.getConnection(url, username, "");

        Statement stmt = conn.createStatement();
        // create queries to make the statement calls easier
        String author_query = "";
        String customer_query = "UPDATE Customer SET Address = ?,  City = ?, State = ?, Zip = ? WHERE LastName = ?";
        String author_report = "";
        String book_report = "SELECT S.BookID, B.Title, SUM(S.Quantity) AS Quantity, SUM(S.UnitPrice * S.Quantity) AS TotalSales " +
                             "FROM Sale S " +
                             "INNER JOIN Book AS B ON B.ID = S.BookID " +
                             "GROUP BY S.BookID " +
                             "ORDER BY BookID ASC";

        int user_choice = 1;
        main_loop: while (user_choice != 0) {
                System.out.println("To add a new author, enter 1. To update customer address, press 2. " +
                        "To print author report, press 3. To print book report, press 4. To exit, press 0.");

                user_choice = stdin.nextInt();
                switch(user_choice) {
                    case 0:
                        break main_loop;
                    case 1:

                        break;
                    case 2:
                        System.out.println("Enter the customer's last name: ");
                        String last_name = stdin.next();

                        System.out.println("Enter the street address: ");
                        String street_address = stdin.nextLine();
                        street_address = stdin.nextLine();

                        System.out.println("Enter the city: ");
                        String city = stdin.next();

                        System.out.println("Enter the state abbreviation: ");
                        String state = stdin.next();

                        System.out.println("Enter the ZIP code: ");
                        int zip_code = stdin.nextInt();

                        PreparedStatement pstmt = conn.prepareStatement(customer_query);
                        pstmt.setString(1, street_address);
                        pstmt.setString(2, city);
                        pstmt.setString(3, state);
                        pstmt.setInt(4, zip_code);
                        pstmt.setString(5, last_name);

                        pstmt.executeUpdate();
                        System.out.println("Update complete.");
                        break;
                    case 3:

                        break;
                    case 4:
                        ResultSet rset = stmt.executeQuery(book_report);
                        while (rset.next ()) {
                           System.out.println (rset.getString ("BookID")+  "  " +
				                  rset.getString("Title")+ " " + rset.getInt("Quantity")+ " " + rset.getFloat("TotalSales"));
                        }
                        break;
                }

        }
    }
}
