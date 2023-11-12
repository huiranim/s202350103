package com.choongang.s202350103.controller;

	import java.util.Calendar;
import java.util.List;

	import org.springframework.stereotype.Controller;
	import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.choongang.s202350103.model.AttJoin;
	import com.choongang.s202350103.model.Attendance;
	import com.choongang.s202350103.model.Quiz;
	import com.choongang.s202350103.model.QuizJoin;
	import com.choongang.s202350103.shService.Paging;
	import com.choongang.s202350103.shService.PointService;

	import lombok.RequiredArgsConstructor;
	import lombok.extern.slf4j.Slf4j;

	@Controller
	@RequiredArgsConstructor
	@Slf4j
	public class ShController {
		
		private final PointService ps;
		
		//fo
		
		//EventList Page
		@RequestMapping(value = "eventList")
		public String eventList(Attendance attendance, Quiz quiz, String currentPage, Model model) {
			System.out.println("PointController eventList() Start..");
			int totalAtt = ps.totalAtt();
			int totalQuiz = ps.totalQuiz();
			int totalEvent = totalAtt + totalQuiz;
			System.out.println("PointController Attendance Count->"+ totalAtt);
			System.out.println("PointController Quiz Count->"+ totalQuiz);
			
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
		    System.out.println("PointController pageIn() Start..");
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
			System.out.println("PointController attendancePage() Start..");
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
			System.out.println("PointController checkAtt() Start..");
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
//			System.out.println("PointController addAtt() Start..");
//			AttJoin attJoin = new AttJoin();
//			attJoin.setA_num(a_num);
//			attJoin.setM_num(m_num);
//			ps.checkAddAtt(attJoin);	
			
			AttJoin attJoin = new AttJoin();
			attJoin.setA_num(a_num);
			attJoin.setM_num(m_num);
			int totalCount = ps.addAtt(attJoin);
			if(totalCount == 3) {
				ps.stampAddAtt(attJoin);
				ps.saveAddAtt(attJoin);
				ps.searchAddAtt(attJoin);
			} else {
				totalCount = 0;
			}
			return totalCount;
		}
				
		//Quiz Page
		@RequestMapping (value = "quizPage")
		public String quizPage(@RequestParam("eNum") int eNum, @RequestParam("m_num") int m_num, Model model) {
			System.out.println("PointController quizPage() Start..");
			
			//해당 퀴즈 페이지 정보 호출
			Quiz quiz = ps.detailQuiz(eNum);
			
			//참여여부 확인
			QuizJoin quizJoin = new QuizJoin();
			quizJoin.setM_num(m_num);
			quizJoin.setQ_num(eNum);
			List<QuizJoin> quizJoinList = ps.listQuizJoin(m_num);
			
			//정답 횟수 확인 용
			int chance = ps.checkChance(quizJoin);
			
			System.out.println("PointController divideEventNum() quizJoinList.size->"+quizJoinList.size());
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
			System.out.println("PointController quizAnswer() Start...");
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
		
		@RequestMapping(value = "boAttendance")
		public String boAttendance() {
			return "sh/boAttendance";
		}
		
		//관리자 페이지 출석이벤트 생성
		@RequestMapping(value = "createAtt")
		public String createAtt(@RequestParam("a_title") String a_title, @RequestParam("a_sdate")String a_sdate, @RequestParam("a_edate")String a_edate,
				@RequestParam("a_image") String a_image, @RequestParam("a_point") int a_point, @RequestParam("a_add") int a_add, @RequestParam("a_addpoint") int a_addpoint ) {
			System.out.println("PointController createAtt() Start..");
			Attendance attendance = new Attendance();
			attendance.setA_title(a_title);
			attendance.setA_sdate(a_sdate);
			attendance.setA_edate(a_edate);	
			attendance.setA_image(a_image);
			attendance.setA_point(a_point);
			attendance.setA_add(a_add);
			attendance.setA_addpoint(a_addpoint);
			// 생성 확인 용
			int result = ps.createAtt(attendance);
			
			return	"redirect:/boAttendance";
		}
		
		@RequestMapping(value = "boQuiz")
		public String boQuiz() {
			return "sh/boQuiz";
		}
		
		@RequestMapping(value = "createQuiz")
		public String createQuiz(int q_num, String q_title, String q_sdate, String q_edate, String q_image, int q_point, String q_question, String q_select1, String q_select2, String q_select3, String q_select4, int q_answer) {
			System.out.println("PointController createQuiz() Start..");
			Quiz quiz = new Quiz();
			quiz.setQ_title(q_title);;
			quiz.setQ_sdate(q_sdate);
			quiz.setQ_edate(q_edate);
			quiz.setQ_image(q_image);
			quiz.setQ_point(q_point);
			quiz.setQ_question(q_question);
			quiz.setQ_select1(q_select1);
			quiz.setQ_select2(q_select2);
			quiz.setQ_select3(q_select3);
			quiz.setQ_select4(q_select4);
			quiz.setQ_answer(q_answer);
			
			int result = ps.createQuiz(quiz);
			return "redirect:/boQuiz";
	}
		//관리자 페이지 이벤트 목록 
		@RequestMapping(value = "boEventList")
		public String  boEventList(Model model) {
			System.out.println("PointController boEventList() Start...");
			
			 Attendance attendance = new Attendance(); 
			 List<Attendance> attendanceList = ps.boEventList(attendance); 
			 model.addAttribute("event",attendanceList);
			 
			return "sh/boEventList";
		}
		
		@RequestMapping(value = "boEventDetail")
		public String boEventDetail(@RequestParam("eNum") int eNum, Model model) {
			System.out.println("PointController boEventDetail() Start..");
			int num = ps.divideAttNum(eNum);
		    if(num == eNum) {
		    	Attendance attendance = new Attendance();
		    	attendance = ps.detailAttendance(eNum);
		    	
		    	model.addAttribute("attendance",attendance);
		    	
		    	return "sh/boAttendancePopUp";
		    } else {
				Quiz quiz = new Quiz();
				quiz = ps.detailQuiz(eNum);
				
				model.addAttribute("quiz",quiz);
				
				return "sh/boQuizPopUp";
		    }
		}
}
