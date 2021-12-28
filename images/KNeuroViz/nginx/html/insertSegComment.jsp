
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="org.json.simple.*" %>

<% 
    request.setCharacterEncoding("UTF-8");
    String seg_id = request.getParameter("seg_id");
	String user_id = request.getParameter("user_id");
	String layer_id = request.getParameter("layer_id");
	String comment = request.getParameter("comment");
    
    Connection conn = null;
	PreparedStatement pstmt=null;
	ResultSet resultSet = null;
    Statement stmt = null;
    try
    {
		String jdbcUrl = "jdbc:mysql://mysql:3306/neuroglancer";
		String dbId = "admin";
		String dbPass = "Kbri2018!!";
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection(jdbcUrl,dbId,dbPass);
        //out.println("Connection success");
        pstmt = conn.prepareStatement("select * from comment where seg_id='"+seg_id+"'");
        resultSet = pstmt.executeQuery();
		int i = 0;
		while(resultSet.next())
        {
			i++;
			//out.println("while");
		}
		
		
		if(i == 0)
		{
			String query = "insert into comment(layer_idx,seg_id,user_id,comment,reg_date) values('"+layer_id+"','"+seg_id+"','"+user_id+"','"+comment+"',now())";
			stmt = conn.createStatement();
			stmt.executeUpdate(query); 
		}
		else
		{
			String query = "update comment set comment='"+comment+"' where seg_id='"+seg_id+"'";
			stmt = conn.createStatement();
			stmt.executeUpdate(query); 
		}
		
        
    }
    catch(Exception e)
    {
        //e.printStackTrace();
        out.print(e);
    }
    finally
    { 
        if (stmt != null) try { stmt.close(); } catch(SQLException ex) {}
        if (conn != null) try { conn.close(); } catch(SQLException ex) {}
    }
%>
