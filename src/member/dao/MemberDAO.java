package member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import member.bean.ZipcodeDTO;
import member.bean.MemberDTO;

public class MemberDAO {
	private static MemberDAO instance=null;
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private DataSource ds;

	public static MemberDAO getInstance() {
		if(instance==null) { //instance가 null인 경우는 맨처음 딱 한번뿐임
			synchronized (MemberDAO.class) { //{}구간-동기화:한사람이라도 먼저 접근하면 통과할때까지 아무도 못들어옴
				instance = new MemberDAO();
			}
		}
		return instance;
	} //MemberDAO getInstance()
	
	public MemberDAO() { //드라이버는 딱 한번만 부르면 됨 -> 생성자
		Context context;
		try {
			context = new InitialContext();
			ds = (DataSource)context.lookup("java:comp/env/jdbc/oracle"); //Tomcat의 경우에는 반드시 접두사가 들어가야 함(env)
		} catch (NamingException e) {
			e.printStackTrace();
		}
	} //MemberDAO()

	public int write(MemberDTO memberDTO) {
		int su=0;
		
		String sql = "insert into member values(?,?,?,?,?,?,?,?,?,?,?,?,sysdate)";
		
		
		try {
			//데이터소스로부터 커넥션하나를 얻어서바꿈
			conn = ds.getConnection();
			//생성
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberDTO.getName());
			pstmt.setString(2, memberDTO.getId());
			pstmt.setString(3, memberDTO.getPwd());
			pstmt.setString(4, memberDTO.getGender());
			pstmt.setString(5, memberDTO.getEmail1());
			pstmt.setString(6, memberDTO.getEmail2());
			pstmt.setString(7, memberDTO.getTel1());
			pstmt.setString(8, memberDTO.getTel2());
			pstmt.setString(9, memberDTO.getTel3());
			pstmt.setString(10, memberDTO.getZipcode());
			pstmt.setString(11, memberDTO.getAddr1());
			pstmt.setString(12, memberDTO.getAddr2());
			
			//실행 - 개수 리턴
			su = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
				try {
					if(pstmt!=null) pstmt.close();
					if(conn!=null) conn.close();
				} catch (SQLException e) {
				}
		}
		
		
		return su;
		
	}
	
	public void modify(MemberDTO memberDTO) {
		String sql = "update member set name=?"
								   + ", pwd=?"
								   + ", gender=?"
								   + ", email1=?"
								   + ", email2=?"
								   + ", tel1=?"
								   + ", tel2=?"
								   + ", tel3=?"
								   + ", zipcode=?"
								   + ", addr1=?"
								   + ", addr2=?"
								   + ", logtime=sysdate where id=?";
		
		try {
			conn = ds.getConnection();
			//생성
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberDTO.getName());
			pstmt.setString(2, memberDTO.getPwd());
			pstmt.setString(3, memberDTO.getGender());
			pstmt.setString(4, memberDTO.getEmail1());
			pstmt.setString(5, memberDTO.getEmail2());
			pstmt.setString(6, memberDTO.getTel1());
			pstmt.setString(7, memberDTO.getTel2());
			pstmt.setString(8, memberDTO.getTel3());
			pstmt.setString(9, memberDTO.getZipcode());
			pstmt.setString(10, memberDTO.getAddr1());
			pstmt.setString(11, memberDTO.getAddr2());
			pstmt.setString(12, memberDTO.getId());
			
			//실행
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
			} catch (SQLException e) {
			}
		}
	
	}

//--------------------------------------------------------------------	
	
	public MemberDTO login(String id, String pwd) {
		MemberDTO memberDTO = null;
		
		String sql = "select * from member where id=? and pwd=?";

		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pwd);
			
			//실행
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				memberDTO = new MemberDTO();
				memberDTO.setName(rs.getString("name"));
				memberDTO.setId(rs.getString("id"));
				memberDTO.setPwd(rs.getString("pwd"));
				memberDTO.setGender(rs.getString("gender"));
				memberDTO.setEmail1(rs.getString("email1"));
				memberDTO.setEmail2(rs.getString("email2"));
				memberDTO.setTel1(rs.getString("tel1"));
				memberDTO.setTel2(rs.getString("tel2"));
				memberDTO.setTel3(rs.getString("tel3"));
				memberDTO.setZipcode(rs.getString("zipcode"));
				memberDTO.setAddr1(rs.getString("addr1"));
				memberDTO.setAddr2(rs.getString("addr2"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
				if(rs!=null) rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return memberDTO;
	}
	
//--------------------------------------------------------------------
	
	public boolean isExistId(String id) {
		boolean exist = false;
		String sql = "select * from member where id=?";
		

		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				exist = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
				if(rs!=null) rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return exist;
		
	}
	
	public List<ZipcodeDTO> getZipcodeList(String sido, String sigungu, String roadname) {
		List<ZipcodeDTO> list = new ArrayList<ZipcodeDTO>();
		
		String sql = "select * from newzipcode where sido like ? and nvl(sigungu,0) like ? and roadname like ?";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%"+sido+"%");
			pstmt.setString(2, "%"+sigungu+"%");
			pstmt.setString(3, "%"+roadname+"%");
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ZipcodeDTO zipcodeDTO = new ZipcodeDTO();
				zipcodeDTO.setZipcode(rs.getString("zipcode"));
				zipcodeDTO.setSido(rs.getString("sido"));
				zipcodeDTO.setSigungu(rs.getString("sigungu") == null ? "" : rs.getString("sigungu"));
				zipcodeDTO.setYubmyundong(rs.getString("yubmyundong"));
				
//				if(rs.getString("ri")==null) {
//					zipcodeDTO.setRi("");
//				} else zipcodeDTO.setRi(rs.getString("ri"));
				
				zipcodeDTO.setRi(rs.getString("ri")==null ? "" : rs.getString("ri"));
				
				zipcodeDTO.setRoadname(rs.getString("roadname"));
				
				zipcodeDTO.setBuildingname(rs.getString("buildingname")==null ? "" : rs.getString("buildingname"));
				
				list.add(zipcodeDTO);
			} //while
			
		} catch (SQLException e) {
			e.printStackTrace();
			list = null; //일부러 error주기
		} finally {
			try {
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
				if(rs!=null) rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return list;
	}

	public MemberDTO getMember(String id) {
		MemberDTO memberDTO = null; // try/catch부분 잘못되면 memberDTO null이어야 해서
		
		String sql = "select * from member where id=?";

		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				memberDTO = new MemberDTO();
				memberDTO.setName(rs.getString("name"));
				memberDTO.setId(rs.getString("id"));
				memberDTO.setPwd(rs.getString("pwd"));
				memberDTO.setGender(rs.getString("gender"));
				memberDTO.setEmail1(rs.getString("email1"));
				memberDTO.setEmail2(rs.getString("email2"));
				memberDTO.setTel1(rs.getString("tel1"));
				memberDTO.setTel2(rs.getString("tel2"));
				memberDTO.setTel3(rs.getString("tel3"));
				memberDTO.setZipcode(rs.getString("zipcode"));
				memberDTO.setAddr1(rs.getString("addr1"));
				memberDTO.setAddr2(rs.getString("addr2"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
				if(rs!=null) rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return memberDTO;
	}
		
}