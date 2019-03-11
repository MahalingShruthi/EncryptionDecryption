<%@page import="java.util.Random"%>
	<%	Random r=new Random();
		int low=1000,h=2000;
		int k1=r.nextInt(h-low)+low;
		int k2=r.nextInt(h-low)+low;%>
<html>
	<body background="7.jpg">
		<table>
		<form action="http://localhost:8080/MINIPROJECT/Encrypt.jsp">
			<tr><td><font color="white" size="5">Compose Msg:</td><td><textarea name="t" rows="10" cols="20"/></textarea></td></tr>
			<tr><td><input type="hidden" name="t1" value="<%=k1%>"/></td></tr>
			<tr><td><input type="hidden" name="t2" value="<%=k2%>"/></td></tr>
			<tr><td colspan="2"><center><input type="submit" value="Encrypt"/></td></tr>
		</form>
	</body>
</html>