<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="kr.or.ksmart.driverdb.DriverDB"%>

<%-- 
<%@ include file="/minsert/m_insert_form.jsp" %>
 --%>
회원 리스트
<br>
<table width="100%" border="1">
	<tr>
		<td>이름</td>
		<td>아이디</td>
		<td>권한</td>
		<td>이름</td>
		<td>이메일</td>
		<td>수정</td>
		<td>삭제</td>
	</tr>
	<%
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			//02단계 :DB연결(Connection)시작
			DriverDB db = new DriverDB();
			conn = db.driverDbcon();
			System.out.println(conn + "<--conn");
			//02단계 :DB연결(Connection)끝
			System.out.println(conn + "<-- conn m_list.jsp");
			if (conn != null) {
				out.println("01 DB연결 성공");
			} else {
				out.println("02 DB연결 실패");
			}
			//03단계 :Query실행을 위한 statement 또는 prepareStatement객체생성 시작
			pstmt = conn.prepareStatement("select * from tb_member");
			//04단계 :Query실행 시작
			rs = pstmt.executeQuery();
			System.out.println(rs + "<-- rs m_list.jsp");
			//System.out.println(rs.next() + "<-- rs.next() m_list.jsp");
			//System.out.println(rs.next() + "<-- rs.next() m_list.jsp");
			//04단계 :Query실행 끝
			//05단계 :Query실행결과 사용
			//System.out.println(rs.next() + "<-- rs.next() m_list.jsp");
			//---   select문장 통해서 모든 회원 목록 가져와서 한줄씩 (레코드(record) or 로우(row))보여준다 시작 
			while (rs.next()) {
	%>
	<tr>
		<td><%=rs.getString("m_id")%></td>
		<td><%=rs.getString("m_pw")%></td>
		<td><%=rs.getString("m_level")%></td>
		<td><%=rs.getString("m_name")%></td>
		<td><%=rs.getString("m_email")%></td>
		<td><a
			href="<%=request.getContextPath()%>/mupdate/m_update_form.jsp?send_id=<%=rs.getString("m_id")%>">수정클릭</a>
		</td>
		<td><a
			href="<%=request.getContextPath()%>/mdelete/m_delete_pro.jsp?send_id=<%=rs.getString("m_id")%>">삭제클릭</a>
		</td>
	</tr>
	<%
		/*
							out.println(rs.getString("m_id") + "<-- m_id 필드=컬럼 값 in tb_member테이블 <br>");
							out.println(rs.getString("m_pw") + "<-- m_pw 필드=컬럼 값 in tb_member테이블 <br>");
							out.println(rs.getString("m_level") + "<-- m_level 필드=컬럼 값 in tb_member테이블 <br>");
							out.println(rs.getString("m_name") + "<-- m_name 필드=컬럼 값 in tb_member테이블 <br>");
							out.println(rs.getString("m_email") + "<-- m_email 필드=컬럼 값 in tb_member테이블 <br><br>"); 
				*/
			}
			//---   select문장 통해서 모든 회원 목록 가져와서 한줄씩 (레코드(record) or 로우(row))보여준다 끝

		} catch (SQLException ex) {
			out.println(ex.getMessage());
			ex.printStackTrace();
		} finally {
			// 6. 사용한 Statement 종료
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException ex) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {
				}

			// 7. 커넥션 종료
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException ex) {
				}
		}
	%>
</table>