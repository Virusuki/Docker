<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="org.json.simple.*" %>
<%
	request.setCharacterEncoding("UTF-8");
    String user_id = request.getParameter("user_id");
	String prj_id = request.getParameter("prj_id");

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
		
		pstmt = conn.prepareStatement("SELECT a.project_name, b.idx AS layerIdx, b.data_type, b.data_url FROM project a LEFT JOIN layer b ON a.idx = b.project_id WHERE user_id = '"+user_id+"' AND a.idx = '"+prj_id+"'");
        resultSet = pstmt.executeQuery();
		

		int i=0;
        while(resultSet.next())
        {
            JSONObject jsonObj = new JSONObject();
			jsonObj.put("nrName",resultSet.getString(1));
			jsonObj.put("nrLayerIdx",resultSet.getString(2));
            jsonObj.put("nrInputType",resultSet.getString(3));
            jsonObj.put("source",resultSet.getString(4));
			

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
