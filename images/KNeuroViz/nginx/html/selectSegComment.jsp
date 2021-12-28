<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="org.json.simple.*" %>
<%
	request.setCharacterEncoding("UTF-8");
    String user_id = request.getParameter("user_id");
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
		
		pstmt = conn.prepareStatement("select idx,seg_id,comment,reg_date from comment where user_id='"+user_id+"' and layer_idx="+layer_id);
        resultSet = pstmt.executeQuery();
		

		int i=0;
        while(resultSet.next())
        {
            JSONObject jsonObj = new JSONObject();
            jsonObj.put("idx",resultSet.getInt(1));
            jsonObj.put("seg_id",resultSet.getString(2));
            jsonObj.put("comment",resultSet.getString(3));
            jsonObj.put("reg_date",resultSet.getString(4));

            jsonArr.add(jsonObj);        
            i++;
        }
        out.print(jsonArr);
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
