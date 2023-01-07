<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import=" org.hibernate.*"  %>
    <%@ page import=" com.helper.*"  %>
    <%@ page import=" com.entities.*"  %>
    <%@ page import=" java.util.*"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Show Notes</title>
<%@ include file = "js_css.jsp" %>
</head>
<body>
<div class = "container-fluid">
<%@ include file = "navbar.jsp" %>
</div>
<div><h1 style="text-align:center">All Notes </h1></div>

<div class='row'>
<div class = 'col -12'>
<%
Session s = FactoryProvider.getfactory().openSession();
Query q = s.createQuery("from Note");
List<Note> list = q.list();
for(Note n :list){
	
	%>	
	<div class="card mt-3 ml-5" ">
  <img class="card-img-top" style='max-width:100px;'src="image/note.png" alt="Card image cap">
  <div class="card-body">
    <h5  class="card-title"><%= n.getTitle() %></h5>
    <p  class="card-text"><%= n.getContent() %></p>
    <a href="DeleteNoteServlet?note_id=<%= n.getId() %>" class="btn btn-danger">Delete</a>
    <a href="UpdateNote.jsp?note_id=<%= n.getId() %>" class="btn btn-primary">Update</a>
  </div>
</div>
	
<%
}

s.close();

%>


</div></div>



</body>
</html>