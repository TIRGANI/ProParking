package service;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import beans.Place;
import beans.Users;
import connexion.Connexion;
import dao.IDao;

public class UsersService implements IDao<Users>{

	@Override
	public boolean create(Users o) {
		 String sql = "INSERT INTO `users`(`id`, `login`, `email`, `password`, `role`, `etat`) VALUES(null, ?, ?, ?, ?,null)";
		 System.out.println(o);
	        try {
	            PreparedStatement ps = Connexion.getInstane().getConnection().prepareStatement(sql);
	            ps.setString(1, o.getLogin());
	            ps.setString(2, o.getEmail());
	            ps.setString(3, o.getPassword());
	            ps.setString(4, o.getRole());
	         
	            if (ps.executeUpdate() == 1) {
	            	
	                return true;
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();

	        }
	        return false;
	}

	@Override
	public boolean delete(Users o) {
		 String sql = "delete from users where id  = ?";
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
	public boolean update(Users o) {
		  String sql = "update users set login  = ?,email = ? ,password = ? ,role = ?,etat=?  where id  = ?";
	        try {
	            PreparedStatement ps = Connexion.getInstane().getConnection().prepareStatement(sql);
	            ps.setString(1, o.getLogin());
	            ps.setString(2, o.getEmail());
	            ps.setString(3, o.getPassword());
	            ps.setString(4, o.getRole());
	            ps.setString(5, o.getEtat());
	            ps.setInt(6, o.getId());
	            if (ps.executeUpdate() == 1) {
	                return true;
	            }
	        } catch (SQLException e) {
	            System.out.println("update : erreur sql : " + e.getMessage());

	        }
	        return false;
	}

	@Override
	public Users findById(int id) {
		 Place m = null;
	        String sql = "select * from users where id  = ?";
	        try {
	            PreparedStatement ps = Connexion.getInstane().getConnection().prepareStatement(sql);
	            ps.setInt(1, id);
	            ResultSet rs = ps.executeQuery();
	            if (rs.next()) {
	                return new Users(rs.getInt("id"), rs.getString("login"), rs.getString("email"), rs.getString("password"), rs.getString("role"),rs.getString("etat"));
	            }

	        } catch (SQLException e) {
	            System.out.println("findById " + e.getMessage());
	        }
	        return null;
	}
	public Users findByLogin(String login) {
		 Place m = null;
	        String sql = "select * from users where login  like ?";
	        try {
	            PreparedStatement ps = Connexion.getInstane().getConnection().prepareStatement(sql);
	            ps.setString(1, login);
	            ResultSet rs = ps.executeQuery();
	            if (rs.next()) {
	                return new Users(rs.getInt("id"), rs.getString("login"), rs.getString("email"), rs.getString("password"), rs.getString("role"),rs.getString("etat"));
	            }

	        } catch (SQLException e) {
	            System.out.println("findById " + e.getMessage());
	        }
	        return null;
	}
	@Override
	public List<Users> findAll() {
		 List<Users> us = new ArrayList<Users>();

	        String sql = "select * from users";
	        try {
	            PreparedStatement ps = Connexion.getInstane().getConnection().prepareStatement(sql);
	            ResultSet rs = ps.executeQuery();
	            while (rs.next()) {
	            	us.add(new Users(rs.getInt("id"), rs.getString("login"), rs.getString("email"), rs.getString("password"), rs.getString("role"),rs.getString("etat")));
	            }

	        } catch (SQLException e) {
	            System.out.println("findAll " + e.getMessage());
	        }
	  
	        return us;
	}
	



}
