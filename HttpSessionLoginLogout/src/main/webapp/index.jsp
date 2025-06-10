<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Enter Your Name</title>
  
</head>
<body>
   <form action="${pageContext.request.contextPath}/storeUser" method="post">

        <h2>Enter Your Name</h2> 
        <input type="text" name="username" placeholder="Your name..." required />
        <br><br>
        <input type="submit" value="Submit" />
    </form>
</body>
</html>