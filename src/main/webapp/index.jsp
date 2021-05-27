<%@ page import="java.util.Date" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%=new Date().toString()%>
<form method = "POST" action="parameter">
    <p><select name="model">
        <option>authentic</option>
        <option>differentiated</option>
    </select></p>
    <p><input type="text" name="sum" value="100000"></p>
    <p><input type="text" name="period" value="12"></p>
    <p><input type="text" name="rate" value="10.9"></p>
    <p><input type="text" name="date" value="2021-01"></p>
    <p><input type="submit" value="Submit">
</form>


</body>
</html>
