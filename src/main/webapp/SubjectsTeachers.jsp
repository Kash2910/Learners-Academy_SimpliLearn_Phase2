<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="pojo.*" %>
    <%@ page import="DAO.*" %>
    <%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Subjects and Teachers</title>
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


<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" 
    integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
</head>
<body>

<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
        <a href="#" class="navbar-brand">Learners Academy</a>
        <ul class="navbar-nav">
            <li class="nav-item">
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
    TeacherDAO tdao=new TeacherDAO();
    SubjectsDAO subdao=new SubjectsDAO();
    List<Teachers> tlist= tdao.getallteachers();
    List<Subjects> sublist= subdao.getallsubjects();
    %>
    
    <%
		String Class=request.getParameter("classname");
		List<SubjectTeachers> subteachlist=SubjectTeachersDAO.getclassReport(Class);
		%>
    
    <h5 align="center">Add Subjects and Teachers to <%=request.getParameter("classname") %></h5>
    <div class="container">
    
    <!-- List to show the add Subject Teachers to the list -->
    <form action="SubjectTeacherEditServlet" method="post">
    
    <input type="hidden" name="classname" value="<%=request.getParameter("classname") %>">
    	Select Subject <select name="subject">
    	<option>Select an option
    	<%for(Subjects sub:sublist) {%>
    	<option><%=sub.getSubjects()%>
    	<%} %>
    	</select>
    	<br><br>
    	Select Teacher <select name="teacher">
    	<option>Select an option
    	<%for(Teachers t:tlist) {%>
    	<option><%=t.getFname() %> <%=t.getLname() %>
    	<%} %>
    	</select>
    	<br>
    	<br>
    	<input type="submit" value="Add">
    </form>
    </div>

<!-- List of Subject Teachers of respective Class when clicked from the Class List -->
 <h5 align="center"> List of Subject Teachers</h5>
  <div class="container">
   <br>
      	<table border="1">
    	<tr><th>ID</th><th>Class</th><th>Subjects</th><th>Teachers</th><th>Action</th></tr>
    	<% for(SubjectTeachers list:subteachlist){ %>
    	<tr><td><%=list.getSubtId() %></td><td><%=list.getClassname() %></td><td><%=list.getSubject() %></td><td><%=list.getTeacher() %></td>
    	<td><a href="subjectsTeacherdelete.jsp?subtId=<%=list.getSubtId() %>&classname=<%=list.getClassname() %>">Delete Subject Teacher</a></td></tr>
    	<%} %>
    	</table>
    </div>
</body>
</html>