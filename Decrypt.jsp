<%@page import="javax.servlet.http.*,javax.servlet.*,java.io.*"%>
<%@page import="java.util.StringTokenizer"%>
<html>
<body bgcolor="#12ffff">
<%
		try
		{
			String str=(String)request.getParameter("t3");
			String s=(String)request.getParameter("t4");
			StringTokenizer st;
			st=new StringTokenizer(str,".");
			int l=st.countTokens();
			int i=0;
			int a[]=new int[l];
			while(i<l)
			{
				a[i]=Integer.parseInt(st.nextToken());
				i++;
			}
			int k1=Integer.parseInt(request.getParameter("t1"));
			int k2=Integer.parseInt(request.getParameter("t2"));
			i=0;
			while(i<l)
			{
				if( i%2 ==0)
					a[i]-=k1;
				else
					a[i]-=k2;
				int n=a[i];
				int res=0;
				while(n>0)
				{
					res=res*10+(n%10);
					n=n/10;
				}
				if(res<10)
					res=res*10;
				a[i]=res;
				i++;	
			}
			i=0;
			out.println("<font color='black' size='+3'><b><u>"+"Data is:"+"</b></u>");
			while(i<l)
			{
				char c;
				if(a[i]==10)
					c='d';
				else if(a[i]==11)
					c='n';
				else if(a[i]==12)
					c='x';
				else
				c=(char)a[i];
				//if(c==' ')
				out.println("<font color='black' size='+3'>"+c+"</font>");
				i++;
			}
			out.println("<br/><font color='black' size='+3'>"+"<b><u>"+"MAC is:"+"<br/></u></b>"+s);
			//out.println("<br/>Both MAC's are verified");
		}
		catch(Exception e)
		{
			out.println("\nException occured "+e);
		}
out.println("<br/><a href='http://localhost:8080/MINIPROJECT/1.jsp'>Home</a>");
%>
