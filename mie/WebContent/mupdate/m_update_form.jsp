<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
 <%@ page import="kr.or.ksmart.dao.Mdao" %>
 <%@ page import="kr.or.ksmart.dto.Member" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" type="text/css" href="main.css" />
<style>
table, th, td {
    border: 1px solid black;
    border-collapse: collapse;
}
th, td {
    padding: 5px;
}
</style>
</head>
<body>
<%@ include file="/module/top.jsp" %>
<%@ include file="/module/left.jsp" %>
<%

//m_list에서 id값 받아온다 
String send_id = request.getParameter("send_id");
System.out.println(send_id + "<-- send_id m_update_form.jsp");

//jdbc연결된 Mdao 객체생성
Mdao mdao = new Mdao();
//Mdao객체내부 쿼리실행준비메서드에 받아온 id값 입력하고 
//Member객체형 m변수에 참조값 넣는다.
Member m = mdao.mSelectforUpdate(send_id);

//Member객체내부에서 회원정보를 꺼내온다.
String dbid = m.getM_id();
String dbpw = m.getM_pw();
String dblevel = m.getM_level();
String dbname = m.getM_name();
String dbemail = m.getM_email();
	
%>
<form action="<%= request.getContextPath() %>/mupdate/m_update_pro.jsp" method="post">
<table border="1">
<tr>
	<td>아이디</td>
	<td>
<input type="hidden" name="m_id" size="20" value="<%= dbid %>">	
		<%= dbid %>
		
<%-- 
<input type="text" name="m_id" size="20" value="<%= dbid %>" readonly> 
--%>
	
	</td>
<tr> 
<tr>
	<td>암호</td>
	<td><input type="text" name="m_pw" size="20" value="<%= dbpw %>"></td>
<tr>
<tr>
	<td>권한</td>
	<td><input type="text" name="m_level" size="20" value="<%= dblevel %>"></td>
<tr>
<tr>
	<td>이름</td>
	<td><input type="text" name="m_name" size="20" value="<%= dbname %>"></td>
<tr>
<tr>
	<td>이메일</td>
	<td><input type="text" name="m_email" size="20" value="<%= dbemail %>"></td>
<tr>
<tr>
	<td colspan="4"><input type="submit" value="회원수정버튼"></td>
</tr>
</table>
</form>



<%@ include file="/module/hadan.jsp" %>

</body>
</html>






