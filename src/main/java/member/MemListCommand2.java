package member;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import guest.GuestDAO;
import guest.GuestVO;

public class MemListCommand2 implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*  페이징처리
		1. 페이지(pag 예약어때문에 학원에서 부르기)를 결정한다. 처음 접속시의 페이지는 무조건 1Page이다. : pag = 1
		2. 한 페이지의 분량을 결정한다. : pageSize = 5(사용자가 결정한다.) 이곳에서는 한페이지분량을 5로 했다. pageSize = 5
		3. 총 레코드 건수를 구한다. totRecCnt => SQL함수중 count(*)를 사용한다.
		4. 총 페이지 건수를 구한다. totPage =>  totRecCnt(전체건수) % pageSize(한페이지 분량) 값이 0이면 몫, 0이 아니면 '몫+1'
 	  5. 현재페이지의 시작 인덱스번호를 구한다. startIndexNo => (pag-1) * pageSize
 	  6. 현재 화면에 보여주는 시작번호를 구한다. curScrStartNo = totRecCnt - startIndexNo
	  */
		HttpSession session = request.getSession();
		int level = (int) session.getAttribute("sLevel");
		

		MemberDAO dao = new MemberDAO();
		
		// 1. 페이지(pag)를 결정한다.
		int pag = request.getParameter("pag")==null ? 1 : Integer.parseInt(request.getParameter("pag"));
		
		//2. 한 페이지의 분량을 결정한다.
		int pageSize = 3;
		
		//3. 총 레코드 건수를 구한다.		
		int totRecCnt = dao.totRecCnt(level);
//		System.out.println("totRecCnt" + totRecCnt);
		//4. 총 페이지 건수를 구한다.
		int totPage = (totRecCnt % pageSize) ==0 ? totRecCnt / pageSize : (totRecCnt / pageSize) +1;
		
		//5. 현재페이지의 시작 인덱스번호를 구한다.
		int startIndexNo = (pag-1) * pageSize;
		
		//6. 현재 화면에 보여주는 시작번호를 구한다.
		int curScrStartNo = totRecCnt - startIndexNo;
		
		// 블록페이징처리...(3단계) -> 블록의 시작번호를 0번부터 처리했다.
		// 1. 블록의 크기를 결정한다.(여기선 3으로 지정)
		int blockSize = 3;
		
		// 2. 현재페이지가 위치하고 있는 블록 번호를 구한다.(예: 1페이지는 0블록, 5페이지는 1블록
//		int curBlock = (pag % blockSize)==0 ? (pag / blockSize) - 1 : (pag / blockSize);
		int curBlock = (pag - 1) / blockSize;
		
		// 3. 마지막블록을 구한다.
//		int lastBlock = (totPage % blockSize)==0 ? (totPage / blockSize) - 1 : totPage / blockSize;		
			int lastBlock = (totPage - 1) / blockSize;
			
			System.out.println(totRecCnt);
			System.out.println(totPage);
		
//		ArrayList<GuestVO> vos = dao.getGuestList();
		ArrayList<MemberVO> vos = dao.getMemList2(startIndexNo, pageSize,level);
		
		request.setAttribute("vos", vos);
		request.setAttribute("pag", pag);
		request.setAttribute("totPage", totPage);
		request.setAttribute("curScrStartNo", curScrStartNo);
		request.setAttribute("blockSize", blockSize);
		request.setAttribute("curBlock", curBlock);
		request.setAttribute("lastBlock", lastBlock);
	
	}

}
