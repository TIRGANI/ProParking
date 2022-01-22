package service;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import beans.Etage;
import connexion.Connexion;
import dao.IDao;

public class EtageService implements IDao<Etage> {

	@Override
	public boolean create(Etage o) {
		String sql = "insert into etage values (null, ?)";
		try {
			PreparedStatement ps = Connexion.getInstane().getConnection().prepareStatement(sql);
			
			ps.setString(1, o.getCode());

			if (ps.executeUpdate() == 1) {
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();

		}
		return false;
	}

	@Override
	public boolean delete(Etage o) {
		String sql = "delete from etage where id  = ?";
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
	public boolean update(Etage o) {
		String sql = "update etage set code  = ?  where id  = ?";
		try {
			PreparedStatement ps = Connexion.getInstane().getConnection().prepareStatement(sql);
			ps.setString(1, o.getCode());
			ps.setInt(2, o.getId());

			
			if (ps.executeUpdate() == 1) {
				return true;
			}
		} catch (SQLException e) {
			System.out.println("update : erreur sql : " + e.getMessage());

		}
		return false;
	}

	@Override
	public Etage findById(int id) {
		Etage m = null;
		String sql = "select * from etage where id  = ?";
		try {
			PreparedStatement ps = Connexion.getInstane().getConnection().prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				return new Etage(rs.getInt("id"), rs.getString("code"));
			}

		} catch (SQLException e) {
			System.out.println("findById " + e.getMessage());
		}
		return null;
	}

	@Override
	public List<Etage> findAll() {
		List<Etage> etages = new ArrayList<Etage>();

		String sql = "select * from etage";
		try {
			PreparedStatement ps = Connexion.getInstane().getConnection().prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				etages.add(new Etage(rs.getInt("id"), rs.getString("code")));
			}

		} catch (SQLException e) {
			System.out.println("findAll " + e.getMessage());
		}

		return etages;
	}

}
