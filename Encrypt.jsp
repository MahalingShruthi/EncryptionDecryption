<%@page import="javax.servlet.*"%>
<%@page import="java.io.*"%>
<%@page import="java.util.*"%>
<%@page import="java.security.*"%>
<html>
<body bgcolor="#12ffff">
<%	
	Random r=new Random();
	StringBuffer stringBuffer = new StringBuffer();
	String str1=" ";
	String str=request.getParameter("t");
	MessageDigest md;
	int k1=Integer.parseInt(request.getParameter("t1"));
	int k2=Integer.parseInt(request.getParameter("t2"));
	int l=str.length();
	int a[]=new int[l];
	int i=0;
	if(str.equals(""))
	{
		out.println("Enter message to encrypt<br/>");
		out.println("<a href='http://localhost:8080/MINIPROJECT/1.jsp'>Home</a>");
	}
	else
	{
		while(i<l)
		{	
			a[i]=(int)str.charAt(i);
			i++;
		}
		i=0;
		out.println("<br/><font size=+3 color='black'><u>Encrypted Text:</u><br/>");
		while(i<l)
		{
			int n=a[i],res=0;
			while(n!=0)
			{
				res=res*10+(n%10);
				n=n/10;
			}	
			if(i%2==0)
				a[i]=res+k1;
			else
				a[i]=res+k2;
			str1=str1+a[i]+".";
			out.print(a[i]+" ");
			i++;
		}
		out.println("<br/>Message has been Encrypted<br/>");
		try
		{
			md=MessageDigest.getInstance("MD5");
			md.update(str.getBytes());
			byte[] messageDigestMD5 = md.digest();
			for (byte bytes : messageDigestMD5)
			{	
				stringBuffer.append(String.format("%02x", bytes & 0xff));
			}
			out.println("<b><u>MAC for the above message is</b></u>");
			out.println(stringBuffer.toString());
		}
		catch (NoSuchAlgorithmException exception)
		{
			exception.printStackTrace();
		}%>
	<form action='http://localhost:8080/MINIPROJECT/Decrypt.jsp'>
		<input type='hidden' name='t1' value=<%=k1%>>
		<input type='hidden' name='t2' value=<%=k2%>>
		<input type='hidden' name='t3' value=<%=str1%>>
		<input type='hidden' name='t4' value=<%=stringBuffer.toString()%>>
		<input type='submit' value='Decrypt'>
	</form>
	<%}%>