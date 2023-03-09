<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import ="DAO.TeacherDAO" %>
    <%@ page import = "pojo.Teachers" %>
    <%@ page import = "java.util.*" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Teacher List</title>
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
.left{float: left; margin-left:10%;}
.right{float: right; margin-right:15%;}
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
	TeacherDAO dao= new TeacherDAO();
	List<Teachers> list =dao.getallteachers();
	%> 

<!--  Form to add Teachers -->
<div class= "container left">
	<form action="TeacherEditServlet" method="post">
	<table>
	<tr>
		<td>Teacher Id: </td> <td> <input type="text" name="tid"><br><br> </td>
	</tr>
	<tr>
		<td>First Name: </td> <td> <input type="text" name="fname"><br><br> </td>
	</tr>
	<tr>
		<td>Last Name: </td> <td> <input type="text" name="lname"><br><br> </td>
	</tr>
	<tr>
		<td>DOB: </td> <td> <input type="date" name="DOB"><br><br> </td>
	</tr>
	<tr>
		<td>Address: </td> <td> <input type="text" name="address"><br><br> </td>
	</tr>
	<tr>
		<td> Phone: </td> <td> <input type="text" name="phone"><br><br> </td>
	</tr>
	<tr>
		<td> Designation: </td> <td> <input type="text" name="designation">  </td>
	</tr>
	<tr>
	<td colspan="2"> <input type="submit" value="Update" style="margin-left:45%;"> </td>
	</tr>
	</table>
	</form>
	<br>
</div>

<h3 align="center"> List of Teachers</h3>

<!-- List showing All the Teachers -->
<div class="container right">

<table border="1">
<tr><th>ID</th><th>First Name</th><th>Last Name</th><th>DOB</th><th>Address</th><th>Phone</th><th>Designation</th><th>Action</th></tr>
<%for(Teachers t:list){ %>
<tr><td><%=t.getTid() %> </td><td><%=t.getFname() %></td><td><%=t.getLname() %></td><td><%=t.getDOB() %>   </td>
<td><%=t.getAddress() %></td><td><%=t.getPhone()%></td><td><%=t.getDesignation() %></td>
<td><a href="tdelete.jsp?tid=<%=t.getTid()%>">Delete </a></td>
</tr>
<%} %>
</table>
</div>
    
</body>
</html>