package com.onlinehr.utils;

import java.sql.DriverManager;

import com.mysql.jdbc.Connection;

/**
 * 数据库连接
 * @author firmideal
 *
 */
public class DataBase {
	public static Connection getConn(){
		   Connection conn = null;
		   try{
		       //加载数据库驱动程序
		      Class.forName("org.gjt.mm.mysql.Driver");   
		      String url = "jdbc:mysql://localhost:3306/onlinehr";    //数据库 
		      String user = "root"; 
		      String pass = "root";
		      conn = (Connection) DriverManager.getConnection(url,user,pass);    
		   }catch(Exception e){
		      e.printStackTrace();
		   }
		   return conn;		   
		}    
}
