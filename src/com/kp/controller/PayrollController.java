package com.kp.controller;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.kp.model.ModelValue;
import com.kp.model.PassEncoding;

public class PayrollController {

	ModelValue MV = new ModelValue();

	public ModelValue validateLogin(String user, String pass) throws ClassNotFoundException, SQLException {

		Connection conn = DatabaseConnection.openConnection();
		String sql = "select * from registration where Username=? and Password= ?";

		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, user);
		pstmt.setString(2, new PassEncoding().generateMD5(pass));

		ResultSet rs = pstmt.executeQuery();

		if (rs.next()) {

			MV.setUsername(rs.getString("Username"));

			return MV;
		} else {
			return null;
		}
	}
	
	protected boolean validateLogin(String user, String pass, String mobile, String position, String address,
			String city, String state, String country) throws ClassNotFoundException, SQLException {
		
		
		Connection conn = DatabaseConnection.openConnection();
		String sql = "insert into registration values(?,?,?,?,?,?,?,?)";

		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, user);
		pstmt.setString(2, pass);
		pstmt.setString(3, position);
		pstmt.setString(4, mobile);
		pstmt.setString(5, address);
		pstmt.setString(6, city);
		pstmt.setString(7, state);
		pstmt.setString(8, country);

		int rs = pstmt.executeUpdate();

		if (rs > 0) {

			System.out.println("check");
			return true;
		} else {
			return false;
		}
	}


	public boolean regEmployee(StringBuilder value) throws ClassNotFoundException, SQLException {

		String[] mValue = value.toString().split("  ");
		for(String k:mValue)
		{
			System.out.println(k);
		}
		Connection conn = DatabaseConnection.openConnection();
		String sql = "Insert into emp_registration (Username,FullName,empGender,empStatus,empDateOfBirth,empFatherHusband,empAddress,empCity,empState,empDistrict,empCountry,empPhonNo,empMobileNo,empEmail,Password,empImage)  values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, mValue[1]);
		pstmt.setString(2, mValue[2]+" "+mValue[3]);
		pstmt.setString(3, mValue[4]);
		pstmt.setString(4, mValue[5]);
		pstmt.setString(5, mValue[6]);
		pstmt.setString(6, mValue[7]);
		pstmt.setString(7, mValue[8]);
		pstmt.setString(8, mValue[9]);
		pstmt.setString(9, mValue[10]);
		pstmt.setString(10, mValue[11]);
		pstmt.setString(11, mValue[12]);
		pstmt.setString(12, mValue[13]);
		pstmt.setString(13, mValue[14]);
		pstmt.setString(14, mValue[15]);
		pstmt.setString(15, new PassEncoding().generateMD5(mValue[16]));
		pstmt.setString(16, mValue[0]);
		int res = pstmt.executeUpdate();

		if (res > 0) {
			return true;
		}

		return false;
	}

	public JSONArray employeedetail(String id, String date) {

		try {

			Connection conn = DatabaseConnection.openConnection();
			String sql = "Select  e.empId,e.empImage,e.empDate,r.Username  from  emp_log as e inner join emp_registration as r where e.empId=? and r.Id=?  and e.empDate=? ";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, id);
			pstmt.setString(3, date);

			ResultSet resultset = pstmt.executeQuery();
			JSONObject jsonobject = new JSONObject();
			JSONArray jsonarray = new JSONArray();
			while (resultset.next()) {
				jsonobject.put("id", resultset.getString("empId"));
				jsonobject.put("username", resultset.getString("Username"));
				jsonobject.put("image", resultset.getString("empImage"));
				jsonobject.put("date", resultset.getString("empDate"));
				jsonarray.add(jsonobject);

			}

			System.out.print(jsonarray);
			return jsonarray;

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	public JSONArray employeedetail() {
		
		try {
			
			Connection conn=DatabaseConnection.openConnection();
			String sql="select * from emp_registration";
			PreparedStatement pstmt=conn.prepareStatement(sql);
			
			ResultSet resultset=pstmt.executeQuery();
			JSONObject jsonobject=new JSONObject();
			JSONArray jsonarray=new JSONArray();
			while(resultset.next())
			{
				jsonobject.put("id", resultset.getString("Id"));
				jsonobject.put("username",resultset.getString("Username"));
				jsonobject.put("email",resultset.getString("empEmail"));
				jsonobject.put("mobile", resultset.getString("empMobileNo"));
				jsonarray.add(jsonobject);
			}
			
			System.out.print(jsonarray);
			return jsonarray;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	 private int  count=0;
	public  int  checkSalary(String empId, String fromDate, String toDate) throws ClassNotFoundException, SQLException {

		Connection conn=DatabaseConnection.openConnection();
		String sql = "select * from emp_log where empId=? and  empDate between ? and ? ";

		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, empId);
		pstmt.setString(2, fromDate);
		pstmt.setString(3, toDate);
		
        System.out.println(fromDate+ "    "+toDate);
		ResultSet rs = pstmt.executeQuery();

		  
	

		while(rs.next())
		{
			count++;
		}
			return count;
		
		}
	
	
	public boolean checkPassword(String Id,String password) throws SQLException
	{
		Connection conn=DatabaseConnection.openConnection();
		String sql="select * from emp_registration where Id=?";
		PreparedStatement pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, Id);
		
		ResultSet rs=pstmt.executeQuery();
		if(rs.next())
		if(new PassEncoding().generateMD5(password).equals(rs.getString("Password")))
		{
			System.out.println("success");
			return true;
			
		}
		else
		{
			return false;
		}
		return false;
	}
	
	
	public boolean changePassword(String Id,String password) throws SQLException
	{
		Connection conn=DatabaseConnection.openConnection();
		String sql="update emp_registration set Password=? where Id=?";
		PreparedStatement pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, new PassEncoding().generateMD5(password));
		pstmt.setString(2, Id);
		
		int rs=pstmt.executeUpdate();
		if(rs>0)
		{
			return true;
			
		}
		else
		{
			return false;
		}
	}
	
	public boolean checkEmail(String email) throws SQLException
	{
		Connection conn=DatabaseConnection.openConnection();
		String sql="select * from registration where Email=?";
		PreparedStatement pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, email);
		
		ResultSet rs=pstmt.executeQuery();
		if(rs.next())
		if(email.equals(rs.getString("Email")))
		{
			System.out.println("success");
			return true;
			
		}
		else
		{
			return false;
		}
		return false;
	}
	public boolean changePass(String email,String pass) throws SQLException
	{
		Connection conn=DatabaseConnection.openConnection();
		String sql="update registration set Password=? where Email=?";
		PreparedStatement pstmt=conn.prepareStatement(sql);
		pstmt.setString(1,new PassEncoding().generateMD5(pass) );
		pstmt.setString(2, email);
		
		int rs=pstmt.executeUpdate();
		if(rs>0)
		{
				return true;
				
			}
			else
			{
				return false;
			}
	}
	
	@SuppressWarnings("unchecked")
	public JSONArray viewLocation(String Id,String Date) throws SQLException
	{
		Connection conn=DatabaseConnection.openConnection();
		String sql="select   emp_longitude,emp_latitude from emp_location where emp_id=? and  emp_date=? ";
		PreparedStatement pstmt=conn.prepareStatement(sql);
    	pstmt.setString(1, Id);
		pstmt.setString(2, Date);
		
		ResultSet rs=pstmt.executeQuery();
		JSONObject jsonobject=new JSONObject();
		JSONArray jsonarray=new JSONArray();
		while(rs.next())
		{
			jsonobject.put("lng", rs.getString("emp_longitude"));
			jsonobject.put("lat", rs.getString("emp_latitude"));
			System.out.println(jsonobject);
			jsonarray.add(jsonobject);
			
		}
		System.out.println(jsonarray);
		
		
		return jsonarray;
		
		
	}
}
