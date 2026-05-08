package com.hms.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.hms.entity.Specialist;

public class SpecialistDAO {
	
	private Connection conn;

	public SpecialistDAO(Connection conn) {
		super();
		this.conn = conn;
	}
	
	public boolean addSpecialist(String sp) {
		
		boolean f = false;
		
		try {
			
			String sql = "insert into specialist (specialistName) values(?)";
			PreparedStatement pstmt = this.conn.prepareStatement(sql);
			
			pstmt.setString(1, sp);
			
			pstmt.executeUpdate();
			
			f = true;
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
		return f;
		
	}
	
	public List<Specialist> getAllSpecialist(){
		
		List<Specialist> spList = new ArrayList<Specialist>();
		
		Specialist specialistObj = null;
		
		try {
			
			String sql = "select * from specialist";
			PreparedStatement pstmt = this.conn.prepareStatement(sql);
			ResultSet resultSet = pstmt.executeQuery();
			
			while(resultSet.next()) {
				
				//create object
				specialistObj = new Specialist();
				//specialistObj.setId(resultSet.getInt("id"));
				//specialistObj.setSpecialistName(resultSet.getString("specialist_name"));
				//above two line same as below line
				specialistObj.setId(resultSet.getInt(1));//column index number 1 -(id)
				specialistObj.setSpecialistName(resultSet.getString(2));//column index number 2 -(specialist_name)
				
				//now add specialist object into List 
				spList.add(specialistObj);
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return spList;
	}

	public boolean updateSpecialist(Specialist specialist) {
	    boolean f = false;
	    
	    try {
	        String sql = "update specialist set specialistName=? where id=?";
	        PreparedStatement pstmt = this.conn.prepareStatement(sql);
	        pstmt.setString(1, specialist.getSpecialistName());
	        pstmt.setInt(2, specialist.getId());
	        
	        int i = pstmt.executeUpdate();
	        if(i == 1) {
	            f = true;
	        }
	        
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    
	    return f;
	}

	public boolean deleteSpecialist(int id) {
	    boolean f = false;
	    
	    try {
	        String sql = "delete from specialist where id=?";
	        PreparedStatement pstmt = this.conn.prepareStatement(sql);
	        pstmt.setInt(1, id);
	        
	        int i = pstmt.executeUpdate();
	        if(i == 1) {
	            f = true;
	        }
	        
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    
	    return f;
	}

	public Specialist getSpecialistById(int id) {
	    Specialist specialist = null;
	    
	    try {
	        String sql = "select * from specialist where id=?";
	        PreparedStatement pstmt = this.conn.prepareStatement(sql);
	        pstmt.setInt(1, id);
	        ResultSet rs = pstmt.executeQuery();
	        
	        while(rs.next()) {
	            specialist = new Specialist();
	            specialist.setId(rs.getInt(1));
	            specialist.setSpecialistName(rs.getString(2));
	        }
	        
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    
	    return specialist;
	}
}
