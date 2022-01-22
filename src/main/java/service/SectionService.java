package service;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import beans.Section;

import connexion.Connexion;
import dao.IDao;

public class SectionService implements IDao<Section> {

    @Override
    public boolean create(Section o) {
        String sql = "insert into section values (null, ?,?)";
        try {
            PreparedStatement ps = Connexion.getInstane().getConnection().prepareStatement(sql);
            ps.setString(1, o.getCode());
            ps.setInt(2, o.getEtage());
         
            if (ps.executeUpdate() == 1) {
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();

        }
        return false;
    }

    @Override
    public boolean delete(Section o) {
        String sql = "delete from section where id  = ?";
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
    public boolean update(Section o) {
    	//System.out.println(o.toString());
        String sql = "update section set code  = ?,idetage=?  where id  = ?";
        try {
            PreparedStatement ps = Connexion.getInstane().getConnection().prepareStatement(sql);
            ps.setString(1, o.getCode());
            ps.setInt(2, o.getEtage());
          
            ps.setInt(3, o.getId());
            if (ps.executeUpdate() == 1) {
                return true;
            }
        } catch (SQLException e) {
            System.out.println("update : erreur sql : " + e.getMessage());

        }
        return false;
    }
   
    @Override
    public Section findById(int id) {
        Section m = null;
        String sql = "select * from section where id  = ?";
        try {
            PreparedStatement ps = Connexion.getInstane().getConnection().prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return new Section(rs.getInt("id"), rs.getString("code"),rs.getInt("idetage"));
            }

        } catch (SQLException e) {
            System.out.println("findById " + e.getMessage());
        }
        return null;
    }
  
    @Override
    public List<Section> findAll() {
        List<Section> sections = new ArrayList<Section>();

        String sql = "select * from section order by idetage";
        try {
            PreparedStatement ps = Connexion.getInstane().getConnection().prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
            	sections.add(new Section(rs.getInt("id"), rs.getString("code"),rs.getInt("idetage")));
            }

        } catch (SQLException e) {
            System.out.println("findAll " + e.getMessage());
        }
  
        return sections;
    }
    
 
    
  

}
