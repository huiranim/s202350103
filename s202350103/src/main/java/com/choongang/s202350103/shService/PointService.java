package com.choongang.s202350103.shService;

import java.util.List;

import com.choongang.s202350103.model.AttJoin;
import com.choongang.s202350103.model.Attendance;
import com.choongang.s202350103.model.Member;
import com.choongang.s202350103.model.PointList;
import com.choongang.s202350103.model.Quiz;
import com.choongang.s202350103.model.QuizJoin;

public interface PointService {
	
	int 			 totalAtt();								// 출석 이벤트 갯수
	int 			 totalQuiz();
	List<Attendance> listEvent(Attendance attendance);			//EventList에서 a_num+q_num 하기위한 메소드
	int 			 divideAttNum(int eNum);					//EventList에서 합친 a_num을 다시 분류
	Attendance 		 detailAttendance(int eNum);				//출석이벤트에 회원정보를 가지고 들어가는 메소드
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
	void 			 attPointList(AttJoin attJoin);
	AttJoin 		 searchAtt(AttJoin attJoin);
	QuizJoin 		 searchQuiz(QuizJoin quizJoin);
	void 			 quizPointList(QuizJoin quizJoin);
	int 			 addAtt(AttJoin attJoin);
	void 			 stampAddAtt(AttJoin attJoin);				//연속 출석 이력 (출석)
	void 			 saveAddAtt(AttJoin attJoin);				//연속 출석 포인트 지급
	void 			 searchAddAtt(AttJoin attJoin);				//연속 출석 이력(포인트 이력) 
	int 			 createQuiz(Quiz quiz);
	List<Attendance> boEventList(Attendance attendane);
	int 			 updateQuiz(Quiz quiz);						//퀴즈 이벤트 정보 수정
	int 			 updateAttendance(Attendance attendance);
	List<Attendance> searchEvent(Attendance attendance);		//관리자페이지 이벤트목록 조건검색 메소드
	List<PointList>  selectMemberPoint(int m_num);
	int 			 pointSum(int m_num);
	int 			 boUpdatePlusPoint(Member member);
	int 			 boInsertPlusPoint(Member member);
	int 			 boInsertMinusPoint(Member member);
	int 			 boUpdateMinusPoint(Member member);
	int 			 checkAddAtt(int a_num);					//attendance 연속출석조건 일수 확인 메소드
	int 			 checkAddAtt1(AttJoin attJoin);
	int 			 checkAddAtt2(AttJoin attJoin);
	int 			 countAttRow(AttJoin attJoin);
	int 			 deleteAtt(int a_num);						//관리자페이지 Attendance 이벤트 삭제
	int 			 deleteQuiz(int q_num);						//관리자 페이지 Quiz 이벤트 삭제

	
	
}
