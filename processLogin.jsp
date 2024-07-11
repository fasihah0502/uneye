<%@ include file="db.jsp" %>

<%
if (request.getParameter("login") != null){
    String uname = request.getParameter("u");
    String pword = request.getParameter("p");
    
    //Create SQL statement
    Statement stmt=DB.createStatement();
    String sql = "select * from user where email ='"+uname+"' and password='"+pword+"'";
    //Execute select SQL and get the record
    ResultSet rs=stmt.executeQuery(sql);
    if(rs.next())//if email and password matched
    {
        String fullname = rs.getString("fullname");
        String userlevel = rs.getString("userlevel");
		
        session.setAttribute("email",uname);
        session.setAttribute("fullname",fullname);
        session.setAttribute("userlevel",userlevel);
		
        out.println("Welcome "+ rs.getString("fullname") + " ["+userlevel+"]");
        if (userlevel.equals("admin"))
            out.println("<meta http-equiv='REFRESH' content='3;url=admin/index.jsp'>");
        else if (userlevel.equals("user"))
            out.println("<meta http-equiv='REFRESH' content='3;url=user/index.jsp'>");    
        return;


    }else{
        out.println("Your username/pwd is incorrect");
        out.println("<meta http-equiv='REFRESH' content='3;url=login.jsp'>");
    }
}
%>