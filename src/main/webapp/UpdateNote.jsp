<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.helper.* , org.hibernate.* ,com.entities.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Note</title>
<%@ include file="js_css.jsp"%>

</head>
<body>
	<div class="container-fluid">
		<%@ include file="navbar.jsp"%>

		<%
		int id = Integer.parseInt(request.getParameter("note_id"));
		Session s = FactoryProvider.getfactory().openSession();
		Note n = (Note) s.get(Note.class, id);
		%>
		<form action=UpdateNoteServlet method=post>
			<div class="form-group">
				<input value="<%=n.getId()%>" type="hidden" id="note_id" name="note_id"> <label
					for="title">Title of Note</label> <input required type="text"
					class="form-control" id="title" placeholder=" Title" name="title"
					value="<%=n.getTitle()%>">

			</div>

			<div class="form-group " class="container-text-center">
				<label for="content">Note</label>
				<textarea required id="content" placeholder="Note"
					class=form-control style="height: 300px" name="content">
  <%=n.getContent()%></textarea>
			</div>

			<button type="submit" class="btn btn-success">Save Changes</button>
		</form>
</body>
</html>