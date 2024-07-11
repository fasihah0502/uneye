<%@ include file='../db.jsp' %>
<h1 style="font-family:'Times New Roman';"><div style="width: 320px;
  padding: 10px;
  border: 5px solid gray;
  margin: 0;">Comment &#9997; &#129409;</div></h1>
<hr>

<%
try{
Statement stmt=DB.createStatement();
String sql = "SELECT * from blog_comment";
ResultSet rs=stmt.executeQuery(sql);
while(rs.next())
{    
    out.println("["+rs.getString("posted_at")+"] ");
        out.println("<i>"+rs.getString("posted_by")+"</i>"+"<br>");
        out.println("<h1 style='font-size:20px; color:#ffffb3;'>"+rs.getString("comment")+"</h1>"+"<hr>");
    }
    out.println("</div>");
out.println("<hr>");

}finally{
} 

%>
