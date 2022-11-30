package admin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import conn.GetConn;
import member.MemberVO;

public class AdminDAO {
	// 싱글톤을 이용한 DB연결 객체 연결하기...
	GetConn getConn = GetConn.getInstance();
			
	private Connection conn = getConn.getConn();
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	private String sql = "";
	
	AdminVO vo = null;

	// 레벨 변경
	public void setLevelCheck(int idx, int level) {
		try {
			sql="update member set level = ? where idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, level);
			pstmt.setInt(2, idx);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		}finally {
			getConn.pstmtClose();
		}
	}

	public void setMemberDel(String mid) {
		try {
			sql="delete from member where mid = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		}finally {
			getConn.pstmtClose();
		}
	}

	// 방명록의 총 레코드 건수 구하기
public int totRecCnt() {
	int totRecCnt = 0;
	try {
		sql = "select count(*) as cnt from member";							
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		
		rs.next();
//		totRecCnt = rs.getInt(1); //필드 순번(count가 가장먼저있음)
		totRecCnt = rs.getInt("cnt"); // as로 별명 부여
	} catch (SQLException e) {
		System.out.println("SQL 에러 : " + e.getMessage());
	} finally {
		getConn.rsClose();
	}
	return totRecCnt;
}

// 관리자 페이지에서 탈퇴신청한 멤버 수 체크
public int totRecCnt2() {
	int totRecCnt = 0;
	try {
		sql = "select count(*) as cnt from member where userDel = 'OK' order by idx desc";							
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		
		rs.next();
//		totRecCnt = rs.getInt(1); //필드 순번(count가 가장먼저있음)
		totRecCnt = rs.getInt("cnt"); // as로 별명 부여
	} catch (SQLException e) {
		System.out.println("SQL 에러 : " + e.getMessage());
	} finally {
		getConn.rsClose();
	}
	return totRecCnt;
}

// 멤버 리스트 가져오기
public ArrayList<AdminVO> getMemList(int startIndexNo, int pageSize) {
	ArrayList<AdminVO> vos = new ArrayList<>();
	
	try {
		sql = "select * from member order by idx desc limit ?,?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, startIndexNo);
		pstmt.setInt(2, pageSize);
		rs = pstmt.executeQuery();
		
		while(rs.next()) {
			vo = new AdminVO();
			vo.setIdx(rs.getInt("idx"));
			vo.setMid(rs.getString("mid"));
			vo.setPwd(rs.getString("pwd"));
			vo.setNickName(rs.getString("nickName"));
			vo.setName(rs.getString("name"));
			vo.setGender(rs.getString("gender"));
			vo.setBirthday(rs.getString("birthday"));
			vo.setTel(rs.getString("tel"));
			vo.setAddress(rs.getString("address"));
			vo.setEmail(rs.getString("email"));
			vo.setHomePage(rs.getString("homePage"));
			vo.setJob(rs.getString("job"));
			vo.setHobby(rs.getString("hobby"));
			vo.setPhoto(rs.getString("photo"));
			vo.setContent(rs.getString("content"));
			vo.setUserInfor(rs.getString("userInfor"));
			vo.setUserDel(rs.getString("userDel"));
			vo.setPoint(rs.getInt("point"));
			vo.setLevel(rs.getInt("level"));
			vo.setVisitCnt(rs.getInt("visitCnt"));
			vo.setStartDate(rs.getString("startDate"));
			vo.setLastDate(rs.getString("lastDate"));
			vo.setTodayCnt(rs.getInt("todayCnt"));
			
			vos.add(vo);
		}
	} catch (SQLException e) {
		System.out.println("sql 오류 : "+e.getMessage());
		} finally {
			getConn.rsClose();
			}
	return vos;
}

// 멤버 검색
public ArrayList<AdminVO> getMemberSearch(String mid) {
	ArrayList<AdminVO> vos = new ArrayList<>();
	try {
		sql = "select * from member where mid like ?";				
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, "%"+mid+"%");
		rs = pstmt.executeQuery();
		
		while(rs.next()) {
			vo = new AdminVO();
			vo.setIdx(rs.getInt("idx"));
			vo.setMid(rs.getString("mid"));
			vo.setPwd(rs.getString("pwd"));
			vo.setNickName(rs.getString("nickName"));
			vo.setName(rs.getString("name"));
			vo.setGender(rs.getString("gender"));
			vo.setBirthday(rs.getString("birthday"));
			vo.setTel(rs.getString("tel"));
			vo.setAddress(rs.getString("address"));
			vo.setEmail(rs.getString("email"));
			vo.setHomePage(rs.getString("homePage"));
			vo.setJob(rs.getString("job"));
			vo.setHobby(rs.getString("hobby"));
			vo.setPhoto(rs.getString("photo"));
			vo.setContent(rs.getString("content"));
			vo.setUserInfor(rs.getString("userInfor"));
			vo.setUserDel(rs.getString("userDel"));
			vo.setPoint(rs.getInt("point"));
			vo.setLevel(rs.getInt("level"));
			vo.setVisitCnt(rs.getInt("visitCnt"));
			vo.setStartDate(rs.getString("startDate"));
			vo.setLastDate(rs.getString("lastDate"));
			vo.setTodayCnt(rs.getInt("todayCnt"));
			
			vos.add(vo);
		}
	} catch (SQLException e) {
		System.out.println("sql 오류 : "+e.getMessage());
		} finally {
			getConn.rsClose();
			}
	
	
	return vos;
}

// 탈퇴 신청 한 사람들 가져오기
	public ArrayList<AdminVO> getdelMemList(int startIndexNo, int pageSize) {
		ArrayList<AdminVO> vos = new ArrayList<>();
			
			try {
				sql = "select * from member where userDel = 'OK' order by idx desc limit ?,?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, startIndexNo);
				pstmt.setInt(2, pageSize);
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					vo = new AdminVO();
					vo.setIdx(rs.getInt("idx"));
					vo.setMid(rs.getString("mid"));
					vo.setPwd(rs.getString("pwd"));
					vo.setNickName(rs.getString("nickName"));
					vo.setName(rs.getString("name"));
					vo.setGender(rs.getString("gender"));
					vo.setBirthday(rs.getString("birthday"));
					vo.setTel(rs.getString("tel"));
					vo.setAddress(rs.getString("address"));
					vo.setEmail(rs.getString("email"));
					vo.setHomePage(rs.getString("homePage"));
					vo.setJob(rs.getString("job"));
					vo.setHobby(rs.getString("hobby"));
					vo.setPhoto(rs.getString("photo"));
					vo.setContent(rs.getString("content"));
					vo.setUserInfor(rs.getString("userInfor"));
					vo.setUserDel(rs.getString("userDel"));
					vo.setPoint(rs.getInt("point"));
					vo.setLevel(rs.getInt("level"));
					vo.setVisitCnt(rs.getInt("visitCnt"));
					vo.setStartDate(rs.getString("startDate"));
					vo.setLastDate(rs.getString("lastDate"));
					vo.setTodayCnt(rs.getInt("todayCnt"));
					
					vos.add(vo);
				}
			} catch (SQLException e) {
				System.out.println("sql 오류 : "+e.getMessage());
				} finally {
					getConn.rsClose();
					}
			return vos;
		}

	public ArrayList<AdminVO> getDelMemberSearch(String mid) {
		ArrayList<AdminVO> vos = new ArrayList<>();
		try {
			sql = "select * from member where mid like ? and userDel = 'OK' order by idx desc ";				
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%"+mid+"%");
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				vo = new AdminVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setMid(rs.getString("mid"));
				vo.setPwd(rs.getString("pwd"));
				vo.setNickName(rs.getString("nickName"));
				vo.setName(rs.getString("name"));
				vo.setGender(rs.getString("gender"));
				vo.setBirthday(rs.getString("birthday"));
				vo.setTel(rs.getString("tel"));
				vo.setAddress(rs.getString("address"));
				vo.setEmail(rs.getString("email"));
				vo.setHomePage(rs.getString("homePage"));
				vo.setJob(rs.getString("job"));
				vo.setHobby(rs.getString("hobby"));
				vo.setPhoto(rs.getString("photo"));
				vo.setContent(rs.getString("content"));
				vo.setUserInfor(rs.getString("userInfor"));
				vo.setUserDel(rs.getString("userDel"));
				vo.setPoint(rs.getInt("point"));
				vo.setLevel(rs.getInt("level"));
				vo.setVisitCnt(rs.getInt("visitCnt"));
				vo.setStartDate(rs.getString("startDate"));
				vo.setLastDate(rs.getString("lastDate"));
				vo.setTodayCnt(rs.getInt("todayCnt"));
				
				vos.add(vo);
			}
		} catch (SQLException e) {
			System.out.println("sql 오류 : "+e.getMessage());
			} finally {
				getConn.rsClose();
				}
		return vos;
	}
}
