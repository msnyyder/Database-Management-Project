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
        Connection conn = DriverManager.getConnection(url, username, password);

        Statement stmt = conn.createStatement();
        // update author information
        String author_update_query = "INSERT INTO Author (ID, FirstName, LastName, BirthDate) VALUES (?,?,?,?)";
	// update customer information
        String customer_query = "UPDATE Customer SET Address = ?,  City = ?, State = ?, Zip = ? WHERE LastName = ?";
	// select information from author table
        String author_report = "SELECT * FROM Author";
	//select information from book table
        String book_report = "SELECT S.BookID, B.Title, SUM(S.Quantity) AS Quantity, SUM(S.UnitPrice * S.Quantity) AS TotalSales " +
                             "FROM Sale S " +
                             "INNER JOIN Book AS B ON B.ID = S.BookID " +
                             "GROUP BY S.BookID " +
                             "ORDER BY BookID ASC";

        int user_choice = 1;
        main_loop: while (user_choice != 0) {
                System.out.println("To add a new author, enter 1.\nTo update customer address, press 2.\n" +
                        "To print author report, press 3.\nTo print book report, press 4. To exit, press 0.");

                user_choice = stdin.nextInt();
                switch(user_choice) {
                    case 0:
                        break main_loop;
                    case 1:
				
				/*get author id*/        
			   	ResultSet most_recent_author = stmt.executeQuery("SELECT ID from Author ORDER BY ID DESC LIMIT 1");
				most_recent_author.next();
				int author_ID = most_recent_author.getInt("ID");
				author_ID++;
		
				/*gather input from user*/
				

				System.out.println("Enter Author's first name");
				String author_first_name = stdin.next();

				System.out.println("Enter Author's last name");
				String author_last_name = stdin.next();

				System.out.println("Enter Author's birthday yyyy-mm-dd (Enter 'null' if birthday unknown)");
				String author_birth_date = stdin.next();
				java.sql.Date date = java.sql.Date.valueOf(author_birth_date);

				/*execute update*/
				PreparedStatement pstm = conn.prepareStatement(author_update_query);
				pstm.setInt(1, author_ID++);
				pstm.setString(2, author_first_name);
				pstm.setString(3, author_last_name);
				pstm.setDate(4, date);
				
				pstm.executeUpdate();
						
			
                        break;
                    case 2:
			// retrieve information from user
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

			// set variable parts of prepared query
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
			
			/*execute author display*/
		ResultSet rSet = stmt.executeQuery(author_report);
		while (rSet.next()){	
			/*retrieve author book count within author display query*/
			int authorBookCount = 0;
			String author_book_count_query = "SELECT * FROM BookAuthor WHERE AuthorID=?";
			PreparedStatement pst = conn.prepareStatement(author_book_count_query);
			pst.setInt(1, rSet.getInt("ID"));
			ResultSet rs=pst.executeQuery();
			if (rs.next()) {
				authorBookCount++;
			}
			/*display author list*/
			System.out.println(rSet.getInt("ID")+" "+rSet.getString("FirstName")+" "+rSet.getString("LastName")+" "
					+"Author Book Count:"+" "+ authorBookCount);
			
		}
			System.out.println();	
				

                        break;
                    case 4:
                        ResultSet rset = stmt.executeQuery(book_report);
                        while (rset.next ()) {
                           System.out.println (rset.getString ("BookID")+  "  " +
				                  rset.getString("Title")+ " " + rset.getInt("Quantity")+ " " + rset.getFloat("TotalSales"));
                        }
				System.out.println();
                        break;
                }

        }
    }
}
