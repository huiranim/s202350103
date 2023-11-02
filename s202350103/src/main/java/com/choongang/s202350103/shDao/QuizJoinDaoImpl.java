package com.choongang.s202350103.shDao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.choongang.s202350103.model.QuizJoin;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class QuizJoinDaoImpl implements QuizJoinDao {

	private final SqlSession session;
	
	@Override
	public List<QuizJoin> listQuizJoin(int m_num) {
		System.out.println("QuizJoinDaoImpl listQuizJoin() Start..");
		List<QuizJoin> quizJoinList = session.selectList("shQuizJoinList",m_num);
		System.out.println("QuizJoinDaoImpl listQuizJoin() quizJoinList.size()->"+quizJoinList.size());
		return quizJoinList;
	}

}
