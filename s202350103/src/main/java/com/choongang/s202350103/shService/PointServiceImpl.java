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
		System.out.println("PointService totalAtt() Start..");
		int totalAtt = ad.totalAtt();
		System.out.println("PointService totalAtt()->"+ totalAtt);
		return totalAtt;
	}

	@Override
	public int totalQuiz() {
		System.out.println("PointService totalQuiz() Start..");
		int totalQuiz = qd.totalQuiz();
		System.out.println("PointService totalQuiz()->"+ totalQuiz);
		return totalQuiz;
	}

	@Override
	public List<Attendance> listEvent(Attendance attendance) {
		System.out.println("PointService listEvent() Start..");
		List<Attendance> eventList = ad.listEvent(attendance);
		System.out.println("PointService listEvent().size()->"+eventList.size());
		return eventList;
	}

	@Override
	public Attendance detailAttendance(int eNum) {
		System.out.println("PointService listAttendance() Start...");
		Attendance attendance = ad.attendance(eNum);
		return attendance;
	}
	
	@Override
	public int divideAttNum(int eNum) {
		System.out.println("PointService divideAttNum() Start...");
		int num = ad.divideAttNum(eNum);
		System.out.println("PointService divideAttNum() num->"+num);
		return num;
	}

	@Override
	public List<AttJoin> listAttJoin(AttJoin attJoin) {
		System.out.println("PointService listAttJoin() Start...");
		List<AttJoin> attJoinList = ajd.listAttJoin(attJoin);
		System.out.println("PointService listAttJoin.size()->"+attJoinList.size());
		return attJoinList;
	}

	@Override
	public Quiz detailQuiz(int eNum) {
		System.out.println("PointService detailQuiz() Start...");
		Quiz quiz = qd.quiz(eNum);
		return quiz;
	}

	@Override
	public List<QuizJoin> listQuizJoin(int m_num) {
		System.out.println("PointService listAttJoin() Start...");
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

	@Override
	public int createAtt(Attendance attendance) {
		int result = ad.createAtt(attendance);
		return result;
	}

	@Override
	public List<AttJoin> subDate(AttJoin attJoin) {
		List<AttJoin> dateList = ajd.subDate(attJoin);
		return dateList;
	}

	@Override
	public int stampAtt(AttJoin attJoin) {
		int result = ajd.stampAtt(attJoin);
		return result;
	}

	@Override
	public int savePoint(AttJoin attJoin) {
		int point = ajd.savePoint(attJoin);
		return point;
	}

	@Override
	public int checkChance(AttJoin attJoin) {
		int chance = ajd.checkChance(attJoin);
		return chance;
	}

	@Override
	public int checkChance(QuizJoin quizJoin) {
		int chance = qjd.checkChance(quizJoin);
		return chance;
	}

	@Override
	public void checkedAnswer(QuizJoin quizJoin) {
		qjd.checkedAnswer(quizJoin);
	}

	@Override
	public void savePoint(QuizJoin quizJoin) {
		qjd.savePoint(quizJoin);
	}

	@Override
	public void attPointList(AttJoin attJoin) {
		ajd.attPointList(attJoin);
		
	}

	@Override
	public AttJoin searchAtt(AttJoin attJoin) {
		attJoin = ajd.searchAtt(attJoin);
		return attJoin;
	}

	@Override
	public QuizJoin searchQuiz(QuizJoin quizJoin) {
		quizJoin = qjd.searchQuiz(quizJoin);
		return quizJoin;
	}

	@Override
	public void quizPointList(QuizJoin quizJoin) {
		qjd.quizPointList(quizJoin);
		
	}

	@Override
	public int addAtt(AttJoin attJoin) {
		System.out.println("PointService addAtt() Start..");
		int count = ajd.addAtt(attJoin);
		return count;
	}

	@Override
	public void stampAddAtt(AttJoin attJoin) {
		System.out.println("PointService stampAddAtt() Start..");
		ajd.stampAddAtt(attJoin);
	}
	
	@Override
	public void saveAddAtt(AttJoin attJoin) {
		System.out.println("PointService saveAddAtt() Start..");
		ajd.saveAddAtt(attJoin);
	}

	@Override
	public void searchAddAtt(AttJoin attJoin) {
		System.out.println("PointService searchAddAtt() Start..");
		ajd.searchAddAtt(attJoin);
	}

	@Override
	public int createQuiz(Quiz quiz) {
		System.out.println("PointService createQuiz() Start..");
		int result = qd.createQuiz(quiz);
		return result;
	}

}
