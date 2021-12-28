<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="org.json.simple.*" %>
<%
	request.setCharacterEncoding("UTF-8");
    String layer_id = request.getParameter("layer_id");

	Connection conn=null;
	PreparedStatement pstmt=null;
	ResultSet resultSet = null;
    JSONArray jsonArr = new JSONArray();
	String str="";

	try{
		String jdbcUrl = "jdbc:mysql://mysql:3306/neuroglancer";
		String dbId = "admin";
		String dbPass = "Kbri2018!!";
	
        Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcUrl,dbId ,dbPass );
		
		pstmt = conn.prepareStatement("SELECT seg_url FROM layer WHERE idx = '"+layer_id+"'");
        resultSet = pstmt.executeQuery();
		
		String msg = "";
		while(resultSet.next())
        {
			msg = resultSet.getString(1);
		}

        out.print(msg);
	}
	catch(Exception e)
	{ 
		e.printStackTrace();
		out.println(e);
	}
	finally
	{
		if(resultSet != null) resultSet.close();
		if(pstmt != null) pstmt.close();
		if(conn != null) conn.close();
	}

%>
