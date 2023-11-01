package com.choongang.s202350103.controller;

	import java.util.List;

	import org.springframework.stereotype.Controller;
	import org.springframework.ui.Model;
	import org.springframework.web.bind.annotation.RequestMapping;
	import org.springframework.web.bind.annotation.RequestParam;

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
		
		//EventList 
		@RequestMapping(value = "listEvent")
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
			System.out.println("PointController attendance.getStart()->"+start);
			System.out.println("PointController attendance.getEnd()->"+end);
			
			
			List<Attendance> eventList = ps.listEvent(attendance);
			System.out.println("PointController listEvent.size()->"+eventList.size());
			
			model.addAttribute("totalEvent",totalEvent);
			model.addAttribute("eventList",eventList);
			model.addAttribute("page",page);
			
			
			return "listEvent";
		}
			
			//해당 이벤트 번호를 가지고 있는 페이지로 회원정보와 같이 enter
			@RequestMapping(value = "evetIn")
			public String pageIn(@RequestParam("eNum") int eNum, @RequestParam("m_num") int m_num, Model model) {
				System.out.println("PointController pageIn() Start..");
				System.out.println("PointController eNum"+eNum);
				System.out.println("PointController m_num"+m_num);
				//attendance 테이블에 조회에서 a_num인지 체크
				if(ps.divideAttNum(eNum) != 0) {
					System.out.println("PointController pageIn() eNum == a_num");
					Attendance attendance = ps.detailAttendance(eNum);
					List<AttJoin> attJoinList = ps.listAttJoin(m_num);
					System.out.println("PointController listAttJoin() attJoinList.size->"+attJoinList.size());
					model.addAttribute("attendance",attendance);
					model.addAttribute("attJoin",attJoinList);
					return "attendancePage";
					} else {
						System.out.println("PointController pageIn() eNum == q_num");
						Quiz quiz = ps.detailQuiz(eNum);
						List<QuizJoin> quizJoinList = ps.listQuizJoin(m_num);
						System.out.println("PointController divideEventNum() quizJoinList.size->"+quizJoinList.size());
						model.addAttribute("quizJoin",quizJoinList);
						model.addAttribute("quiz",quiz);
						return "quizPage";
					}
			}
		
	}
