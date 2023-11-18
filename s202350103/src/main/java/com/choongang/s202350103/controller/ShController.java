package com.choongang.s202350103.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Base64;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.choongang.s202350103.model.AttJoin;
import com.choongang.s202350103.model.Attendance;
import com.choongang.s202350103.model.Member;
import com.choongang.s202350103.model.PointList;
import com.choongang.s202350103.model.Quiz;
import com.choongang.s202350103.model.QuizJoin;
import com.choongang.s202350103.shService.Paging;
import com.choongang.s202350103.shService.PointService;
import com.choongang.s202350103.yjService.MemberService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

	@Controller
	@RequiredArgsConstructor
	@Slf4j
	public class ShController {
		
		private final PointService ps;
		private final MemberService ms;
		
		//fo
		
		//EventList Page
		@RequestMapping(value = "eventList")
		public String eventList(Attendance attendance, Quiz quiz, String currentPage, Model model) {
			System.out.println("shController eventList() Start..");
			int totalAtt = ps.totalAtt();
			int totalQuiz = ps.totalQuiz();
			int totalEvent = totalAtt + totalQuiz;
			System.out.println("shController Attendance Count->"+ totalAtt);
			System.out.println("shController Quiz Count->"+ totalQuiz);
			
			Paging page = new Paging(totalEvent, currentPage);
			int start = page.getStart();
			int end = page.getEnd();
			attendance.setStart(start);
			attendance.setEnd(end);
			
			List<Attendance> eventList = ps.listEvent(attendance);

			model.addAttribute("totalEvent",totalEvent);
			model.addAttribute("eventList",eventList);
			model.addAttribute("page",page);
			
			
			return "sh/foEventList";
		}
		//해당 이벤트 분류(eventList -> eventPage 과정)
		@RequestMapping(value = "eventIn")
		public String pageIn(@RequestParam("eNum") int eNum, @RequestParam("m_num") int m_num, Model model) {
		    System.out.println("shController pageIn() Start..");
		    int num = ps.divideAttNum(eNum);
		    if(num == eNum) {
		    	System.out.println("eNum == a_num");
		    	return "forward:/attendancePage?eNum="+eNum+"&m_num="+m_num;
		    } else {
		    	System.out.println("eNum != a_num");
		    	return "forward:/quizPage?eNum="+eNum+"&m_num="+m_num;
		    }
		    
		}
		//Attendance Page		
		@RequestMapping(value = "attendancePage")
		public String attendancePage(@RequestParam("eNum") int eNum, @RequestParam("m_num") int m_num,AttJoin attJoin, Model model) {
			System.out.println("shController attendancePage() Start..");
			//캘린더
			Calendar cal = Calendar.getInstance();
			int month = ps.startMonth(eNum);
			int year  = ps.startYear(eNum);
			cal.set(year, month - 1, 1);
		    int dayOfWeek = cal.get(Calendar.DAY_OF_WEEK); //월 1일의 요일
		    int lastday = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
			// 데이터 처리 및 모델 설정
		    Attendance attendance = ps.detailAttendance(eNum);
		    attJoin.setM_num(m_num);
		    attJoin.setA_num(eNum);
		    List<AttJoin> attJoinList = ps.listAttJoin(attJoin);
		    List<AttJoin> dateList = ps.subDate(attJoin);
		    //당일 출석 유무 체크
		    int chance = ps.checkChance(attJoin);
		    System.out.println("chance->"+ chance);
		    
		    model.addAttribute("attendance", attendance);
		    model.addAttribute("date",dateList);
		    model.addAttribute("attJoin", attJoinList);
		    model.addAttribute("dayOfWeek",dayOfWeek);
		    model.addAttribute("lastday",lastday);
		    model.addAttribute("month",month);
		    model.addAttribute("cal",cal);
		    model.addAttribute("chance",chance);
		    model.addAttribute("m_num",m_num);
		    model.addAttribute("a_num",eNum);
		    return "sh/foAttendancePage";
		}
		
		//출석페이지 출석 버튼 클릭 메소드
		@RequestMapping(value = "checkAtt")
		public String checkAtt(@RequestParam("a_num") int a_num, @RequestParam("m_num") int m_num) {
			System.out.println("shController checkAtt() Start..");
			AttJoin attJoin = new AttJoin();
			attJoin.setA_num(a_num);
			attJoin.setM_num(m_num);
			//출석 참여
			ps.stampAtt(attJoin);
			//포인트 적립메소드
			ps.savePoint(attJoin);
			//포인트 이력 저장
			attJoin = ps.searchAtt(attJoin);
			ps.attPointList(attJoin);
			return "forward:/attendancePage?eNum="+a_num+"&m_num="+m_num;
		}
		
		//출석부 연속 출선 메소드 (ajax)
		@ResponseBody
		@RequestMapping(value = "checkAddAtt")
		public int checkAddAtt(@RequestParam("a_num") int a_num, @RequestParam("m_num") int m_num) {
			System.out.println("shController addAtt() Start..");
			
			AttJoin attJoin = new AttJoin();
			attJoin.setA_num(a_num);
			attJoin.setM_num(m_num);
			
			int result=0;
			int add = ps.checkAddAtt(a_num);		// 연속출석 일자		
			System.out.println("연속 출석 일자 :"+add);
			
			
			Calendar calendar = Calendar.getInstance();
			Date checkTime = calendar.getTime();
			attJoin.setA_par_pdate(checkTime);
		
			for(int i = 0; i < add; i++) {
				
				calendar.add(Calendar.DAY_OF_MONTH,-i);
				checkTime = calendar.getTime();
				int rowCount = ps.countAttRow(attJoin);
				if(rowCount == 1) {
					System.out.println("rowCount == 1");
					result = 1;
					continue;
				}else {
					System.out.println("result = 0");
					result = 0;
					break;
				}
			}
			System.out.println("m_num"+attJoin.getM_num());
			System.out.println("a_num"+attJoin.getA_num());
			System.out.println("result");
			if(result == 1) {
				ps.stampAddAtt(attJoin);
				ps.saveAddAtt(attJoin);
				ps.searchAddAtt(attJoin);
			}
			return result;
			
		}
				
		//Quiz Page
		@RequestMapping (value = "quizPage")
		public String quizPage(@RequestParam("eNum") int eNum, @RequestParam("m_num") int m_num, Model model) {
			System.out.println("shController quizPage() Start..");
			
			//해당 퀴즈 페이지 정보 호출
			Quiz quiz = ps.detailQuiz(eNum);
			
			//참여여부 확인
			QuizJoin quizJoin = new QuizJoin();
			quizJoin.setM_num(m_num);
			quizJoin.setQ_num(eNum);
			List<QuizJoin> quizJoinList = ps.listQuizJoin(m_num);
			
			//정답 횟수 확인 용
			int chance = ps.checkChance(quizJoin);
			
			System.out.println("shController divideEventNum() quizJoinList.size->"+quizJoinList.size());
			model.addAttribute("quizJoin",quizJoinList);
			model.addAttribute("quiz",quiz);
			model.addAttribute("chance",chance);
			model.addAttribute("m_num",m_num);
			model.addAttribute("eNum",eNum);
			return "sh/foQuizPage";
		}
		
		//Quiz 정답 제출
		@RequestMapping(value = "checkQuiz", method = RequestMethod.GET)
		public String checkQuiz(@RequestParam("m_num") int m_num, @RequestParam("eNum") int eNum) {
			System.out.println("shController quizAnswer() Start...");
			QuizJoin quizJoin = new QuizJoin();
			quizJoin.setM_num(m_num);
			quizJoin.setQ_num(eNum);
			//퀴즈 참여
			ps.checkedAnswer(quizJoin);
			//member table 포인트 적립
			ps.savePoint(quizJoin);
			//포인트 이력 저장
			quizJoin = ps.searchQuiz(quizJoin);
			ps.quizPointList(quizJoin);
			return "forward:/quizPage?eNum="+eNum+"&m_num="+m_num;
		}
		
		//bo
		//관리자 페이지 출석 생성 페이지 이동
		@RequestMapping(value = "boAttendance")
		public String boAttendance() {
			return "sh/boAttendance";
		}
		
		//관리자 페이지 출석이벤트 생성
		@RequestMapping(value = "createAtt", method= RequestMethod.POST)
		public String createAtt(@RequestParam("a_title") String a_title
							   ,@RequestParam("a_sdate")String a_sdate
							   ,@RequestParam("a_edate")String a_edate
							   ,@RequestParam("a_point") int a_point
							   ,@RequestParam("a_add") int a_add
							   ,@RequestParam("a_addpoint") int a_addpoint
							   ,HttpServletRequest request
							   ,@RequestParam("file1") MultipartFile file1
							   ,Model model) throws IOException {
			System.out.println("shController createAtt() Start..");
			Attendance attendance = new Attendance();
			attendance.setA_title(a_title);
			attendance.setA_sdate(a_sdate);
			attendance.setA_edate(a_edate);	
			attendance.setA_point(a_point);
			attendance.setA_add(a_add);
			attendance.setA_addpoint(a_addpoint);
			
			String uploadPath = request.getSession().getServletContext().getRealPath("/upload");
			System.out.println("shController uploadPath->"+uploadPath);
			String savedName = uploadFile(file1.getOriginalFilename(), file1.getBytes(), uploadPath);
			attendance.setA_image(savedName);
			
			// 생성 확인 용
			int result = ps.createAtt(attendance);
			
			model.addAttribute("result",result);

			return	"redirect:/boEventList";
		}
		
		@RequestMapping(value = "boQuiz")
		public String boQuiz() {
			return "sh/boQuiz";
		}
		
		//관리자 페이지 퀴즈이벤트 생성
		@RequestMapping(value = "createQuiz", method=RequestMethod.POST)
		public String createQuiz(@RequestParam("q_title") 	String q_title
								,@RequestParam("q_sdate") 	String q_sdate
								,@RequestParam("q_edate") 	String q_edate
								,@RequestParam("q_point") 	int q_point
								,@RequestParam("q_question") String q_question
								,@RequestParam("q_select1") String q_select1
								,@RequestParam("q_select2") String q_select2
								,@RequestParam("q_select3") String q_select3
								,@RequestParam("q_select4") String q_select4
								,@RequestParam("q_answer") 	int q_answer
								, HttpServletRequest request
								,@RequestParam("file1") MultipartFile file1
							    ,Model model) throws IOException {
			System.out.println("shController createQuiz() Start..");
			Quiz quiz = new Quiz();
			quiz.setQ_title(q_title);;
			quiz.setQ_sdate(q_sdate);
			quiz.setQ_edate(q_edate);
			quiz.setQ_point(q_point);
			quiz.setQ_question(q_question);
			quiz.setQ_select1(q_select1);
			quiz.setQ_select2(q_select2);
			quiz.setQ_select3(q_select3);
			quiz.setQ_select4(q_select4);
			quiz.setQ_answer(q_answer);
			
			String uploadPath = request.getSession().getServletContext().getRealPath("/upload");
			System.out.println("shController uploadPath->"+uploadPath);
			String savedName = uploadFile(file1.getOriginalFilename(), file1.getBytes(), uploadPath);
			quiz.setQ_image(savedName);
			
			int result = ps.createQuiz(quiz);
			
			model.addAttribute("result",result);
			
			return "redirect:/boEventList";
	}
		
		//이벤트 생성 시 이미지 File type으로 upload
		private String uploadFile(String originalName, byte[] fileDate, String uploadPath) throws IOException {
			//universally unique identifier(UUID)
			UUID uid = UUID.randomUUID();
			//requestPath = requestPath + "/resources/image";
			System.out.println("uploadPath->"+uploadPath);
			//Directory 생성
			File fileDirectory = new File(uploadPath);
			if (!fileDirectory.exists()) {
				//신규폴더(Directory) 생성
				fileDirectory.mkdir();
				System.out.println("업로드용 폴더 생성 : "+uploadPath);
			}
			
			String savedName = uid.toString()+"_"+originalName;
			log.info("savedName : "+savedName);
			File target = new File(uploadPath,savedName);
			//File target = new File(uploadPath,savedName);
			//FIle Upload --> uploadPath / UUID+_+originalName
			FileCopyUtils.copy(fileDate, target);	//org.springframework.util.FileCopyUtils
			
			return savedName;
		}
		
		
		//관리자 페이지 이벤트 목록 
		@RequestMapping(value = "boEventList")
		public String  boEventList(Model model) {
			System.out.println("shController boEventList() Start...");
			
			 Attendance attendance = new Attendance(); 
			 List<Attendance> attendanceList = ps.boEventList(attendance); 
			 model.addAttribute("event",attendanceList);
			 
			return "sh/boEventList";
		}
		
		//관리자 페이지 이벤트 목록에서 상세정보 누르면 작동하는 메소드
		@RequestMapping(value = "boEventDetail")
		public String boEventDetail(@RequestParam("eNum") int eNum, Model model) {
			System.out.println("shController boEventDetail() Start..");
			int num = ps.divideAttNum(eNum);
		    if(num == eNum) {
		    	Attendance attendance = new Attendance();
		    	attendance = ps.detailAttendance(eNum);
		    	
		    	model.addAttribute("attendance",attendance);
		    	model.addAttribute("eNum",eNum);
		    	return "sh/boAttendancePopUp";
		    } else {
				Quiz quiz = new Quiz();
				quiz = ps.detailQuiz(eNum);
				
				model.addAttribute("quiz",quiz);
				model.addAttribute("eNum",eNum);
				return "sh/boQuizPopUp";
		    }
		}
		
		//관리자 페이지 퀴즈 이벤트 정보 수정
		@ResponseBody
		@RequestMapping(value = "updateQuiz")
		public int updateQuiz(@RequestBody Quiz quiz) {
			System.out.println("shController updateQuiz() Start..");
			int result = ps.updateQuiz(quiz);
			return result;
		}
		
		//관리자 페이지 출석 이벤트 정보 수정 진행
		@ResponseBody
		@RequestMapping(value = "updateAttendance")
		public int updateAttendance(@RequestBody Attendance attendanceData,
						            HttpServletRequest request,
						            Model model) throws Exception {
			System.out.println("shController updateAttendance() Start..");
			Attendance attendance = new Attendance();
			attendance.setA_num(attendanceData.getA_num());
			attendance.setA_title(attendanceData.getA_title());
			attendance.setA_sdate(attendanceData.getA_sdate());
			attendance.setA_edate(attendanceData.getA_edate());	
			attendance.setA_point(attendanceData.getA_point());
			attendance.setA_add(attendanceData.getA_add());
			attendance.setA_addpoint(attendanceData.getA_addpoint());
			
			String uploadPath = request.getSession().getServletContext().getRealPath("/upload");
			System.out.println("shController uploadPath->"+uploadPath);
			String savedName = uploadFile(attendanceData.getFile1().getOriginalFilename(), attendanceData.getFile1().getBytes(), uploadPath);
			attendance.setA_image(savedName);
			
			int result = ps.updateAttendance(attendance);
			
			return result;
		} 
		
		@RequestMapping(value = "boSearchEvent")
		public String boSearchEvent(@RequestParam("eNum") int eNum, @RequestParam("a_title") String a_title,Model model) {
			System.out.println("shController boSearchEvent() Start..");
			Attendance attendance = new Attendance();
			attendance.setA_num(eNum);
			attendance.setA_title(a_title);
			List<Attendance> boEventList = ps.searchEvent(attendance);
			
			model.addAttribute("event",attendance);
			
			return "forward:/boEventList";
		}
		
		@RequestMapping(value="selectMemberPoint")
		public String selectMemberPoint(@RequestParam int m_num, Model model) {
			System.out.println("shController selectMemberPoint() Start...");
			List<PointList> memberPointList = ps.selectMemberPoint(m_num);
			Member member = ms.memberInfo(m_num);
			int sum = ps.pointSum(m_num);
			System.out.println("memberPointList.size()->"+memberPointList.size());
			model.addAttribute("memberPoint",memberPointList);
			model.addAttribute("member",member);
			model.addAttribute("sum",sum);
			model.addAttribute("m_num",m_num);
			return "sh/boMemberPointList";
		}
		
		//관리자 이벤트 수정 페이지에서 삭제 버튼 실행 시 작동하는 메소드(출석)
		@ResponseBody
		@RequestMapping(value = "deleteAtt")
		public int deleteAtt(@RequestParam("a_num") int a_num) {
			System.out.println("shController deleteAtt() start..");
			int result = ps.deleteAtt(a_num);
			return result;
		}
		
		//관리자 이벤트 수정 페이지에서 삭제 버튼 실행 시 작동하는 메소드(퀴즈)
		@ResponseBody
		@RequestMapping(value = "deleteQuiz")
		public int deleteQuiz(@RequestParam("q_num") int q_num) {
			System.out.println("shController deleteQuiz() Start...");
			int result = ps.deleteQuiz(q_num);
			return result;
		}
		
		@RequestMapping(value = "boPlusPoint")
		public String boPlusPoint(@RequestParam("m_num") int m_num, @RequestParam("point") int point) {
			System.out.println("shController boPlusPoint() Start...");
			Member member = new Member();
			member.setM_num(m_num);
			member.setM_point(point);
			ps.boInsertPlusPoint(member);
			ps.boUpdatePlusPoint(member);
			return "redirect:/selectMemberPoint?m_num="+m_num;
		}
		
		@RequestMapping(value = "boMinusPoint")
		public String boMinusPoint(@RequestParam("m_num") int m_num, @RequestParam("point") int point) {
			System.out.println("shController boMinusPoint() Start...");
			Member member = new Member();
			member.setM_num(m_num);
			member.setM_point(point);
			ps.boInsertMinusPoint(member);
			ps.boUpdateMinusPoint(member);
			return "redirect:/selectMemberPoint?m_num="+m_num;
		}
}
