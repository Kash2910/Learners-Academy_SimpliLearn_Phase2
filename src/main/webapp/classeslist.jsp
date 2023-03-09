<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ page import ="DAO.*" %>
    <%@ page import = "pojo.*" %>
    <%@ page import = "java.util.*" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>CLASS LIST</title>
<style type="text/css">
.nav-bar {
  display: flex;
  justify-content: space-between;
  align-items: center;
  background-color: #333;
  color: white;
  height: 50px;
  padding: 0 20px;
  border-radius:15%;
}

.navbar-brand {
  font-size: 1.5rem;
  font-weight: bold;
  text-decoration:none;
}

.navbar-nav {
  display: flex;
  justify-content: center;
  align-items: center;
}

.nav-item {
  margin-right: 20px;
  list-style:none;
}

.nav-link {
  color: white;
  text-decoration: none;
  font-size: 1.2rem;
  font-weight: bold;
}

.nav-link:hover {
  color: #98eb34;
}
 
.btns {
  display: flex;
  justify-content: center;
  align-items: center;
  margin-top:20px;
  
}


.btn {
  margin: 0 10px;
  padding: 10px 20px;
  border-radius: 5px;
  background-color: #ffc107;
  color: white;
  text-align: center;
  text-decoration: none;
  font-size: 1.2rem;
  font-weight: bold;
  box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.2);
  list-style:none;
}

.btn:hover {
  background-color: #ff9800;
}

.btn-links{
text-decoration:none;
}

.table-container {
  display: flex;
  justify-content: center;
  align-items: center;
}

table {
  border-collapse: collapse;
  width: 100%;
  max-width: 800px;
  margin: 20px;
  background-color: #fff;
  box-shadow: 0 0 20px rgba(0, 0, 0, 0.15);
}

th, td {
  padding: 10px;
  text-align: left;
}

th {
  background-color: #4CAF50;
  color: #fff;
}

tr:nth-child(even) {
  background-color: #f2f2f2;
}

a {
  color: #2196F3;
  text-decoration: none;
}

a:hover {
  text-decoration: underline;
}

</style>

</head>
<body>
<div class="container"> 
<nav class="nav-bar">
        <a href="#" class="navbar-brand" style="color:#eb8934;">Learners Academy</a>
        <ul class="navbar-nav">
            <li class="nav-item nav-link active">
                <a href="classeslist.jsp" class="nav-link">Classes</a>
            </li>
            <li class="nav-item">
                <a href="studlist.jsp" class="nav-link">Students</a>
            </li>

            <li class="nav-item">
                <a href="subjectlist.jsp" class="nav-link">Subjects</a>
            </li>

            <li class="nav-item">
                <a href="teacherlist.jsp" class="nav-link">Teachers</a>
            </li>
            
            <li class="nav-item">
                <a href="LogoutServlet" class="nav-link">Logout</a>
            </li>
        </ul>
        
    </nav>

<%
ClassDAO dao= new ClassDAO();
List<ClassName> list=dao.getallclasses();
%> 

<div class="btns">
<br>
	<div class="btn btn-warning"><a href="classnew.jsp" class="btn-links">Update Class</a></div>
	<div class="btn btn-warning"><a href="studnew.jsp" class="btn-links">Update Student</a></div>
	<div class="btn btn-warning"><a href="technew.jsp" class="btn-links">Update Teachers</a></div>
</div>

<br>
<br>
<div class="table-container">
<table border="1">
<tr><th>ID</th><th>Class Name</th><th colspan="2">Action</th><th>Assign Subject & Teachers</th> <th>Details</th></tr>
<%for(ClassName cn:list){ %>
<tr><td><%=cn.getCid() %></td>
<td><%=cn.getClassname() %></td>
<td><a href="cedit.jsp?cid=<%=cn.getCid()%>">Edit</a></td>
<td><a href="cdelete.jsp?cid=<%=cn.getCid()%>">Delete</a></td>
<td><a href="SubjectsTeachers.jsp?classname=<%=cn.getClassname() %>">Subjects and Teachers</a></td>
<td><a href="classReport.jsp?classname=<%=cn.getClassname() %>">Class Report</a></td>
<%} %>
</table>
</div>
</div>
</body>
</html>