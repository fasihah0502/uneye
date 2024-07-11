<%@ include file='menu.jsp' %>
<%@ include file='db.jsp' %>
<body background='portfolio/pic/b5.png'>

<h1>NEWS</h1>
<section style='background-color: #ffb3ec;'>
<hr>
<%
Statement stmt=DB.createStatement();
String sql = "SELECT * from news ORDER BY posted_at DESC";
ResultSet rs=stmt.executeQuery(sql);
while(rs.next())
{    
    int id_news = rs.getInt("id");
    String title = rs.getString("title");
    String message = rs.getString("message");
    String posted_by = rs.getString("posted_by");
    String posted_at = rs.getString("posted_at");
    out.println("<h2 style='color:blue'>"+title+"<br>");
    out.println("<i style='color:black;font-size:12px'>"+posted_by);
    out.println("["+posted_at+"]</i></h2>");
    out.println("<p>"+message.replace("\n","<br>")+"</p>");
    
    //READ ANY REPLIES
    Statement stmt2=DB.createStatement();
    ResultSet replySet = stmt2.executeQuery("SELECT * from news_reply WHERE id_news = "+id_news+" ORDER BY posted_at DESC");
    out.println("<div style='color: blue; margin-left:30px;'>");
    while (replySet.next()){
        out.println("["+replySet.getString("posted_at")+"] ");
        out.println(replySet.getString("posted_by")+"<br>");
        out.println(replySet.getString("message")+"<hr>");
    }
    out.println("</div>");
    out.println("<hr>");
    replySet.close();
    stmt2.close();
}
rs.close();
stmt.close();
DB.close();
%>
</section>
