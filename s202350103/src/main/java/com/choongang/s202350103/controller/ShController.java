package com.choongang.s202350103.controller;

	import java.util.List;

	import org.springframework.stereotype.Controller;
	import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
	import org.springframework.web.bind.annotation.RequestParam;
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
		
		//EventList 
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
			System.out.println("PointController attendance.getStart()->"+start);
			System.out.println("PointController attendance.getEnd()->"+end);
			
			
			List<Attendance> eventList = ps.listEvent(attendance);
			System.out.println("PointController listEvent.size()->"+eventList.size());
			
			model.addAttribute("totalEvent",totalEvent);
			model.addAttribute("eventList",eventList);
			model.addAttribute("page",page);
			
			
			return "sh/foEventList";
		}
			
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
				
		@RequestMapping(value = "attendancePage")
		public String attendancePage(@RequestParam("eNum") int eNum, @RequestParam("m_num") int m_num, Model model) {
			System.out.println("PointController attendancePage() Start..");
		    // 데이터 처리 및 모델 설정
		    Attendance attendance = ps.detailAttendance(eNum);
		    List<AttJoin> attJoinList = ps.listAttJoin(m_num);
		    System.out.println("PointController listAttJoin() attJoinList.size->" + attJoinList.size());
		    model.addAttribute("attendance", attendance);
		    model.addAttribute("attJoin", attJoinList);
		    return "sh/foAttendancePage";
		}
			
		@RequestMapping (value = "quizPage")
		public String quizPage(@RequestParam("eNum") int eNum, @RequestParam("m_num") int m_num, Model model) {
			Quiz quiz = ps.detailQuiz(eNum);
			List<QuizJoin> quizJoinList = ps.listQuizJoin(m_num);
			System.out.println("PointController divideEventNum() quizJoinList.size->"+quizJoinList.size());
			model.addAttribute("quizJoin",quizJoinList);
			model.addAttribute("quiz",quiz);
			return "sh/foQuizPage";
		}
		
	}
