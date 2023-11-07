package com.choongang.s202350103.shService;

import java.util.List;

import com.choongang.s202350103.model.AttJoin;
import com.choongang.s202350103.model.Attendance;
import com.choongang.s202350103.model.Quiz;
import com.choongang.s202350103.model.QuizJoin;

public interface PointService {
	
	// 출석 이벤트 갯수
	int 			 totalAtt();
	int 			 totalQuiz();
	//EventList에서 a_num+q_num 하기위한 메소드
	List<Attendance> listEvent(Attendance attendance);
	//EventList에서 합친 a_num을 다시 분류
	int 			 divideAttNum(int eNum);
	//출석이벤트에 회원정보를 가지고 들어가는 메소드
	Attendance 		 detailAttendance(int eNum);
	List<AttJoin> 	 listAttJoin(AttJoin attJoin);
	Quiz 			 detailQuiz(int eNum);
	List<QuizJoin>   listQuizJoin(int m_num);
	int 			 startMonth(int eNum);
	int 			 startYear(int eNum);
	int 			 createAtt(Attendance attendance);
	List<AttJoin> 	 subDate(AttJoin attJoin);
	int 			 stampAtt(AttJoin attJoin);
	int 			 savePoint(AttJoin attJoin);
	int 			 checkChance(AttJoin attJoin);
	int 			 checkChance(QuizJoin quizJoin);
	void 			 checkedAnswer(QuizJoin quizJoin);
	void 			 savePoint(QuizJoin quizJoin);
	
	
}
