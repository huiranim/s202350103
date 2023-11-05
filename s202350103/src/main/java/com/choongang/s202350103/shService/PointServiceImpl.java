package com.choongang.s202350103.shService;

import java.util.List;

import org.springframework.stereotype.Service;

import com.choongang.s202350103.shDao.AttJoinDao;
import com.choongang.s202350103.shDao.AttendanceDao;
import com.choongang.s202350103.shDao.QuizDao;
import com.choongang.s202350103.shDao.QuizJoinDao;
import com.choongang.s202350103.model.AttJoin;
import com.choongang.s202350103.model.Attendance;
import com.choongang.s202350103.model.Quiz;
import com.choongang.s202350103.model.QuizJoin;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class PointServiceImpl implements PointService {

	private final AttendanceDao ad;
	private final QuizDao		qd;
	private final AttJoinDao	ajd;
	private final QuizJoinDao	qjd;
	
	@Override
	public int totalAtt() {
		System.out.println("EventListService totalAtt() Start..");
		int totalAtt = ad.totalAtt();
		System.out.println("EventListService totalAtt()->"+ totalAtt);
		return totalAtt;
	}

	@Override
	public int totalQuiz() {
		System.out.println("EventListService totalQuiz() Start..");
		int totalQuiz = qd.totalQuiz();
		System.out.println("EventListService totalQuiz()->"+ totalQuiz);
		return totalQuiz;
	}

	@Override
	public List<Attendance> listEvent(Attendance attendance) {
		System.out.println("EventListService listEvent() Start..");
		List<Attendance> eventList = ad.listEvent(attendance);
		System.out.println("EventListService listEvent().size()->"+eventList.size());
		return eventList;
	}

	@Override
	public Attendance detailAttendance(int eNum) {
		System.out.println("EventListService listAttendance() Start...");
		Attendance attendance = ad.attendance(eNum);
		return attendance;
	}
	
	@Override
	public int divideAttNum(int eNum) {
		System.out.println("EventListService divideAttNum() Start...");
		int num = ad.divideAttNum(eNum);
		System.out.println("EventListService divideAttNum() num->"+num);
		return num;
	}

	@Override
	public List<AttJoin> listAttJoin(AttJoin attJoin) {
		System.out.println("EventListService listAttJoin() Start...");
		List<AttJoin> attJoinList = ajd.listAttJoin(attJoin);
		System.out.println("EventListService listAttJoin.size()->"+attJoinList.size());
		return attJoinList;
	}

	@Override
	public Quiz detailQuiz(int eNum) {
		System.out.println("EventListService detailQuiz() Start...");
		Quiz quiz = qd.quiz(eNum);
		return quiz;
	}

	@Override
	public List<QuizJoin> listQuizJoin(int m_num) {
		System.out.println("EventListService listAttJoin() Start...");
		List<QuizJoin> quizJoinList = qjd.listQuizJoin(m_num);
		return quizJoinList;
	}

	@Override
	public int startMonth(int eNum) {
		int sMonth = ad.startMonth(eNum);
		return sMonth;
	}

	@Override
	public int startYear(int eNum) {
		int sYear = ad.startYear(eNum);
		return sYear;
	}

}
