<%@page import="java.util.Date"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%@include file="./basis_db.jsp" %>
<body>
<!-- DB 연결 -->
<%
   
   /* best 제품 */
   ArrayList<String> bname = new ArrayList<String>();
   ArrayList<Integer> bprice = new ArrayList<Integer>();
   ArrayList<String> bbrand = new ArrayList<String>();
   ArrayList<Integer> bcount = new ArrayList<Integer>();
   ArrayList<Integer> bidx = new ArrayList<Integer>();
   ArrayList<Date> bdate = new ArrayList<Date>();
   ArrayList<Integer> bgup = new ArrayList<Integer>();
   
   /* 신제품 */
   ArrayList<String> nname = new ArrayList<String>();
   ArrayList<Integer> nprice = new ArrayList<Integer>();
   ArrayList<String> nbrand = new ArrayList<String>();
   ArrayList<Integer> ncount = new ArrayList<Integer>();
   ArrayList<Integer> nidx = new ArrayList<Integer>();
   ArrayList<Date> ndate = new ArrayList<Date>();
   ArrayList<Integer> ngup = new ArrayList<Integer>();			
   
   /* 베스트이미지 */
   ArrayList<String> biname = new ArrayList<String>();
   ArrayList<Integer> biprice = new ArrayList<Integer>();
   ArrayList<String> bibrand = new ArrayList<String>();
   ArrayList<Integer> bicount = new ArrayList<Integer>();
   ArrayList<Integer> biidx = new ArrayList<Integer>();
   ArrayList<Date> bidate = new ArrayList<Date>();
   ArrayList<Integer> bigup = new ArrayList<Integer>();
   
   /* 뉴 이미지 */
   ArrayList<String> niname = new ArrayList<String>();
   ArrayList<Integer> niprice = new ArrayList<Integer>();
   ArrayList<String> nibrand = new ArrayList<String>();
   ArrayList<Integer> nicount = new ArrayList<Integer>();
   ArrayList<Integer> niidx = new ArrayList<Integer>();
   ArrayList<Date> nidate = new ArrayList<Date>();
   ArrayList<Integer> nigup = new ArrayList<Integer>();
   
   /* rnum */
   ArrayList<Integer> brnum = new ArrayList<Integer>();
   ArrayList<Integer> nrnum = new ArrayList<Integer>();
   
 
   //   DB연결
         
        stmt = conn.createStatement();
         String bsql = "SELECT * FROM PRODUCT";	
         pstmt = conn.prepareStatement(bsql);
         rs = pstmt.executeQuery();
         while (rs.next()) {
            bname.add(rs.getString("PRODUCTNAME"));
            bbrand.add(rs.getString("brandname"));
            bprice.add(rs.getInt("PRICE")); 
            bcount.add(rs.getInt("PURCHASECOUNT"));
            bidx.add(rs.getInt("idx"));
            bdate.add(rs.getDate("storagedate"));
            bgup.add(rs.getInt("gup"));
         }
         
         System.out.println(bname);
          
         String nsql = "select * from PRODUCT order by storagedate desc" ;	
         pstmt = conn.prepareStatement(nsql);
         rs = pstmt.executeQuery();
         while (rs.next()) {
            nname.add(rs.getString("PRODUCTNAME"));
            nbrand.add(rs.getString("brandname"));
            nprice.add(rs.getInt("PRICE"));
            ncount.add(rs.getInt("PURCHASECOUNT"));
            nidx.add(rs.getInt("idx"));
            ndate.add(rs.getDate("storagedate"));
            ngup.add(rs.getInt("gup"));
         }
         
         String bisql = "select * from (select rownum as rnum, a1.* from (select * FROM PRODUCT ORDER BY purchasecount desc) a1) a2 where a2.rnum >= 1 and a2.rnum <=8" ;	
         pstmt = conn.prepareStatement(bisql);
         rs = pstmt.executeQuery();
         while (rs.next()) {
        	 biname.add(rs.getString("PRODUCTNAME"));
             bibrand.add(rs.getString("brandname"));
             biprice.add(rs.getInt("PRICE")); 
             bicount.add(rs.getInt("PURCHASECOUNT"));
             biidx.add(rs.getInt("idx"));
             bidate.add(rs.getDate("storagedate"));
             bigup.add(rs.getInt("gup"));
             brnum.add(rs.getInt("rnum"));
          }
             System.out.println("brnum" + brnum);
         
         String nisql = "select * from (select rownum as rnum, a1.* from (select * FROM PRODUCT ORDER BY storagedate desc) a1) a2 where a2.rnum >= 1 and a2.rnum <=8" ;	
         pstmt = conn.prepareStatement(nisql);
         rs = pstmt.executeQuery();
         while (rs.next()) {
            niname.add(rs.getString("PRODUCTNAME"));
            nibrand.add(rs.getString("brandname"));
            niprice.add(rs.getInt("PRICE"));
            nicount.add(rs.getInt("PURCHASECOUNT"));
            niidx.add(rs.getInt("idx"));
            nidate.add(rs.getDate("storagedate"));
            nigup.add(rs.getInt("gup"));
            nrnum.add(rs.getInt("rnum"));
         }
         System.out.println("nrnum" + nrnum);
        
%>
<!-- DB 연결 끝 -->
</body>
</html>