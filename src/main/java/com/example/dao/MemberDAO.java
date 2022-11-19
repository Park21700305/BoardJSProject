package com.example.dao;

import com.example.bean.MemberVO;
import com.example.util.JDBCUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class MemberDAO {
    static Connection conn = null;
    static PreparedStatement stmt = null;
    static ResultSet rs = null;

    private final String Member_INSERT = "insert into Member (photo, userid, username, gender, home, email) values (?,?,?,?,?,?)";
    private final String Member_UPDATE = "update Member set photo=?, userid=?, username=?, gender=?, home=?, email=? where sid=?";
    private final String Member_DELETE = "delete from Member where sid=?";
    private final String Member_GET = "select * from Member where sid=?";
    private static final String Member_LIST = "select * from Member order by sid desc";

    public int insertMember(MemberVO vo) {
        System.out.println("===> JDBC로 insertMember() 기능 처리");
        try {
            conn = JDBCUtil.getConnection();
            stmt = conn.prepareStatement(Member_INSERT);
            stmt.setString(1, vo.getPhoto());
            stmt.setString(2, vo.getUserid());
            stmt.setString(3, vo.getUsername());
            stmt.setString(4, vo.getGender());
            stmt.setString(5, vo.getHome());
            stmt.setString(6, vo.getEmail());
            stmt.executeUpdate();
            return 1;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    // 글 삭제
    public void deleteMember(MemberVO vo) {
        System.out.println("===> JDBC로 deleteMember() 기능 처리");
        try {
            conn = JDBCUtil.getConnection();
            stmt = conn.prepareStatement(Member_DELETE);
            stmt.setInt(1, vo.getSid());
            stmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public int updateMember(MemberVO vo) {
        System.out.println("===> JDBC로 updateMember() 기능 처리");
        try {
            conn = JDBCUtil.getConnection();
            stmt = conn.prepareStatement(Member_UPDATE);
            stmt.setString(1, vo.getPhoto());
            stmt.setString(2, vo.getUserid());
            stmt.setString(3, vo.getUsername());
            stmt.setString(4, vo.getGender());
            stmt.setString(5, vo.getHome());
            stmt.setString(6, vo.getEmail());
            stmt.setInt(7, vo.getSid());


            System.out.println(vo.getPhoto() + "-" + vo.getUserid() + "-" + vo.getUsername() + "-" + vo.getGender() +
                    "-" + vo.getHome() + "-" + vo.getEmail()+ "-" + vo.getSid());
            stmt.executeUpdate();
            return 1;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    public MemberVO getMember(int seq) {
        MemberVO one = new MemberVO();
        System.out.println("===> JDBC로 getMember() 기능 처리");
        try {
            conn = JDBCUtil.getConnection();
            stmt = conn.prepareStatement(Member_GET);
            stmt.setInt(1, seq);
            rs = stmt.executeQuery();
            if(rs.next()) {
                one.setSid(rs.getInt("sid"));
                one.setUserid(rs.getString("userid"));
                one.setUsername(rs.getString("username"));
                one.setGender(rs.getString("gender"));
                one.setHome(rs.getString("home"));
                one.setEmail(rs.getString("email"));
            }
            rs.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return one;
    }

    public static List<MemberVO> getMemberList(){
        List<MemberVO> list = new ArrayList<MemberVO>();
        System.out.println("===> JDBC로 getMemberList() 기능 처리");
        try {
            conn = JDBCUtil.getConnection();
            stmt = conn.prepareStatement(Member_LIST);
            rs = stmt.executeQuery();
            while(rs.next()) {
                MemberVO one = new MemberVO();
                one.setSid(rs.getInt("sid"));
                one.setUserid(rs.getString("userid"));
                one.setUsername(rs.getString("username"));
                one.setGender(rs.getString("gender"));
                one.setHome(rs.getString("home"));
                one.setEmail(rs.getString("email"));
                one.setRegdate(rs.getDate("regdate"));
                list.add(one);
            }
            rs.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public String getPhotoFilename(int sid){
        String filename = null;
        try{
            conn = JDBCUtil.getConnection();
            stmt = conn.prepareStatement(Member_GET);
            stmt.setInt(1,sid);
            rs = stmt.executeQuery();
            if(rs.next()){
                filename = rs.getString("photo");
            }
            rs.close();
        } catch (Exception e){
            e.printStackTrace();
        }
        System.out.println("==> JDBC로 getPgotoFilename() 기능 처리");
        return filename;
    }
}
