package connexion;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Connexion {

 //   private static String login = "vx9yja8icnurd04r";
  //  private static String password = "uvcmiy247dwfa56p";
   // private static String url = "jdbc:mysql://r6ze0q02l4me77k3.chr7pe7iynqr.eu-west-1.rds.amazonaws.com/lxhec6cg69fqphaa";
	/*private static String login = "root";
    private static String password = "";
    private static String url = "jdbc:mysql://localhost:3306/parking";*/
    private static String login = "he9sm4xs8rtp6lkg";
    private static String password = "f241jzu1aqsbfomi";
    private static String url = "jdbc:mysql://d3y0lbg7abxmbuoi.chr7pe7iynqr.eu-west-1.rds.amazonaws.com/pnrgxdlim56nh0rh";
	private Connection connection = null;
    private static Connexion instane;

    private Connexion() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(url, login, password);
        } catch (ClassNotFoundException e) {
            System.out.println("Driver introvable");
        } catch (SQLException e) {
            System.out.println("Connexion errror");
            System.out.println(e.getMessage());
        }
    }

    public Connection getConnection() {
        return connection;
    }

    public static Connexion getInstane() {
        if (instane == null) {
            instane = new Connexion();
        }
        return instane;
    }

}
