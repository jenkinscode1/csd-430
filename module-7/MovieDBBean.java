package module5;
import java.io.*;
import java.sql.*;
import java.util.ArrayList;

public class MovieDBBean implements Serializable {

    private String url = "jdbc:mysql://localhost:3306/CSD430";
    private String user = "root";
    private String password = "zxzxzxA1!";

    public ArrayList<Integer> getMovieIDs() {
        ArrayList<Integer> list = new ArrayList<>();

        try (Connection conn = DriverManager.getConnection(url, user, password);
             PreparedStatement ps = conn.prepareStatement("SELECT movie_id FROM jelani_movies_data")) {

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(rs.getInt("movie_id"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public ResultSet getMovieByID(int id) throws SQLException {
        Connection conn = DriverManager.getConnection(url, user, password);
        PreparedStatement ps = conn.prepareStatement(
            "SELECT * FROM jelani_movies_data WHERE movie_id = ?");
        ps.setInt(1, id);
        return ps.executeQuery();
    }

public void insertMovie(String title, String genre, int year, double rating, String director) {
    String sql = "INSERT INTO jelani_movies_data (title, genre, release_year, rating, director) " +
                 "VALUES (?, ?, ?, ?, ?)";

    try (Connection conn = DriverManager.getConnection(url, user, password);
         PreparedStatement ps = conn.prepareStatement(sql)) {

        ps.setString(1, title);
        ps.setString(2, genre);
        ps.setInt(3, year);
        ps.setDouble(4, rating);
        ps.setString(5, director);
        ps.executeUpdate();

    } catch (SQLException e) {
        e.printStackTrace();
    }
}

public ResultSet getAllMovies() {
    try {
        Connection conn = DriverManager.getConnection(url, user, password);
        PreparedStatement ps = conn.prepareStatement("SELECT * FROM jelani_movies_data");
        return ps.executeQuery();
    } catch (SQLException e) {
        e.printStackTrace();
        return null;
    }
}
}