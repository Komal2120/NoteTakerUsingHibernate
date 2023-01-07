<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Notes </title>
<%@ include file = "js_css.jsp" %>
</head>
<body>
<div class = "container-fluid">
<%@ include file = "navbar.jsp" %>

</div>
<form action=SaveNoteServlets method=post>
  <div class="form-group">
    <label  for="title">Title of Note</label>
    <input required type="text" class="form-control" id="title"  placeholder=" Title"  name="title">
   
  </div>
  <div class="form-group " class="container-text-center">
    <label  for="content">Note</label>
   <textarea  required id ="content"
   placeholder="Note"
   class=form-control
   style="height:300px"
   name="content"
   ></textarea>
  </div>

  <button type="submit" class="btn btn-primary">Submit</button>
</form>



</body>
</html>