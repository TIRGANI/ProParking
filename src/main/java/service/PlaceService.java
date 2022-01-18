package service;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import beans.Place;
import beans.Section;
import connexion.Connexion;
import dao.IDao;

public class PlaceService implements IDao<Place>{

	@Override
	public boolean create(Place o) {
		 String sql = "insert into place values (null, ?, ?, ?, ?)";
	        try {
	            PreparedStatement ps = Connexion.getInstane().getConnection().prepareStatement(sql);
	            ps.setString(1, o.getNumero());
	            ps.setString(2, o.getEtat());
	            ps.setString(3, o.getType());
	            ps.setInt(4, o.getIdsection());
	         
	            if (ps.executeUpdate() == 1) {
	                return true;
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();

	        }
	        return false;
	}

	@Override
	public boolean delete(Place o) {
		 String sql = "delete from place where id  = ?";
	        try {
	            PreparedStatement ps = Connexion.getInstane().getConnection().prepareStatement(sql);
	            ps.setInt(1, o.getId());
	            if (ps.executeUpdate() == 1) {
	                return true;
	            }
	        } catch (SQLException e) {
	            System.out.println("delete : erreur sql : " + e.getMessage());

	        }
	        return false;
	}

	@Override
	public boolean update(Place o) {
		  String sql = "update place set numero  = ?,etat = ? ,type = ? ,idsection = ?  where id  = ?";
	        try {
	            PreparedStatement ps = Connexion.getInstane().getConnection().prepareStatement(sql);
	            ps.setString(1, o.getNumero());
	            ps.setString(2, o.getEtat());
	            ps.setString(3, o.getType());
	            ps.setInt(4, o.getIdsection());
	          
	            ps.setInt(5, o.getId());
	            if (ps.executeUpdate() == 1) {
	                return true;
	            }
	        } catch (SQLException e) {
	            System.out.println("update : erreur sql : " + e.getMessage());

	        }
	        return false;
	}

	@Override
	public Place findById(int id) {
		 Place m = null;
	        String sql = "select * from place where id  = ?";
	        try {
	            PreparedStatement ps = Connexion.getInstane().getConnection().prepareStatement(sql);
	            ps.setInt(1, id);
	            ResultSet rs = ps.executeQuery();
	            if (rs.next()) {
	                return new Place(rs.getInt("id"), rs.getString("numero"), rs.getString("etat"), rs.getString("type"), rs.getInt("idsection"));
	            }

	        } catch (SQLException e) {
	            System.out.println("findById " + e.getMessage());
	        }
	        return null;
	}

	@Override
	public List<Place> findAll() {
		 List<Place> places = new ArrayList<Place>();

	        String sql = "select * from place";
	        try {
	            PreparedStatement ps = Connexion.getInstane().getConnection().prepareStatement(sql);
	            ResultSet rs = ps.executeQuery();
	            while (rs.next()) {
	            	places.add(new Place(rs.getInt("id"), rs.getString("numero"), rs.getString("etat"), rs.getString("type"), rs.getInt("idsection")));
	            }

	        } catch (SQLException e) {
	            System.out.println("findAll " + e.getMessage());
	        }
	  
	        return places;
	}
	

}
