<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="pojo.*" %>
    <%@ page import="DAO.*" %>
    <%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Subject List</title>
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

.left{float: left; margin-left:20%;}
.right{float: right; margin-right:30%;}
</style>

</head>
<body>
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
    <br>
    
    <% 
    SubjectsDAO dao =new SubjectsDAO();
    List<Subjects> list = dao.getallsubjects(); 
    ClassDAO cdao=new ClassDAO();
    List<ClassName> clist= cdao.getallclasses();
    %>
    
    <!-- Subject List Edit Form -->
<div class="container left">
<form action="SubjectEditServlet" method="post">
<table>
<tr>
	<td>Subject Id: </td><td> <input name="subid" type="text">
<br><br> </td>
</tr>
<tr>
	<td colspan="2" >
	Class:
	<select name="classname" >
	<option> Select Class</option>
	<%for(ClassName cn: clist){ %>
	<option><%=cn.getClassname() %>
	<%} %>
	</select>
	<br><br>
	</td>
</tr>
<tr>
<td>Subjects: </td> 
<td>
<input name="subjects" type="text">
<br><br>
</td>
</tr>
<tr>
<td colspan="2"> <input value="submit" type="submit" style="margin-left:45%;"> </td>
</tr>
</table>
</form>
</div>
    
    <!-- List of Subjects -->
    <div class="container right">
    	<h4 align="center"> List of Subjects </h4>
    	
    	<table border="1">
    	<tr><th>ID</th><th>Class</th><th>Subjects</th><th>Action</th></tr>
    	<% for(Subjects sub:list){ %>
    	<tr><td><%=sub.getSubid() %></td><td><%=sub.getClassname() %></td><td><%=sub.getSubjects() %></td>
    	<td><a href="subdelete.jsp?subid=<%=sub.getSubid() %>">Delete Subject</a></td></tr>
    	<%} %>
    	</table>
    </div>
    
    
</body>
</html>