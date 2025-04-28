<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>동영상 재생기</title>
</head>
<body>
    <h1>동영상 재생</h1>
    <%
        // 데이터베이스 연결 설정
        String url = "jdbc:mariadb://192.168.1.30:3306/video_database";
        String user = "root"; // MySQL 사용자 이름
        String password = "root"; // MySQL 비밀번호
        
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;
        String fileName = "";

        try {
            // JDBC 드라이버 로드
            Class.forName("org.mariadb.jdbc.Driver");
            
            // 데이터베이스 연결
            conn = DriverManager.getConnection(url, user, password);
            stmt = conn.createStatement();
            
            // 동영상 파일 이름 가져오기
            String sql = "SELECT file_name FROM videos WHERE id = 1"; // id = 1인 동영상 가져오기
            rs = stmt.executeQuery(sql);

            if (rs.next()) {
                fileName = rs.getString("file_name");
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // 자원 해제
            try {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    %>
    <%
        if (!fileName.isEmpty()) {
    %>
        <video id="videoplay" class="video" autoplay controls width="640" height="360" >
            <source src="video/<%= fileName %>" type="video/mp4">
            브라우저가 동영상을 지원하지 않습니다.
        </video>
    <%
        } else {
    %>
        <p>동영상이 없습니다.</p>
    <%
        }
    %>
    <br>
    <br>
    <input  type = "button"  value = "재생"  onclick = "play( );">       // 재생 버튼 생성함
    <script  type = "text/javascript">
       function  play( )
       {
           var  videocontrol = document.getElementById("videoplay");    // 객체 생성함
           // 현재 미디어 파일이 정지 상태인지의 여부를 반환함
           if (videocontrol.pause)
               videocontrol.play( );         // 미디어 파일 재생함
           else
               alert ( " 현재 일시 중지된 상태입니다 !!! ");
        }
    </script>

</body>
</html>
