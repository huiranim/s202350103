package com.choongang.s202350103.htDao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.choongang.s202350103.model.Review;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class ReviewDaoImpl implements ReviewDao {
	private final SqlSession session;

	
	@Override
	public int reviewInsert(Review review) {
		System.out.println("ReviewDaoImpl reviewInsert() Start....");
		int result = 0;
		try {
			result = session.insert("htReviewInsert", review);
		} catch (Exception e) {
			System.out.println("ReviewDaoImpl reviewInsert() Exception-->" + e.getMessage());
		}
		return result;
	}

	@Override
	public List<Review> listReview(Review review) {
		System.out.println("ReviewDaoImpl listReview() Start...");
		List<Review> list = null;
		try {
			list = session.selectList("htReviewList", review);
		}catch (Exception e) {
			System.out.println("ReviewDaoImpl listReview() Exception-->" + e.getMessage());
		}
		return list;
	}
    
	
	@Override
	public int reviewTotal() {
		System.out.println("ReviewDaoImpl reviewTotal() Start....");
		int total = 0;
		try {
			total = session.selectOne("htReviewTotal");
		}catch (Exception e) {
			System.out.println("ReviewDaoImpl reviewTotal() total--> " + total);
		}
		return total;
	}
	
	@Override
	public int reviewRating(Review review) {
		System.out.println("ReviewDaoImpl reviewRating() Start....");
		int total = 0;
		try {
			total = session.selectOne("htReviewRating",review);
		}catch (Exception e) {
			System.out.println("ReviewDaoImpl reviewRating() total--> " + total);
		}
		return total;
	}

	@Override
	public double reviewAverage() {
		System.out.println("ReviewDaoImpl reviewAverage() Start....");
		double average = 0;
		try {
			average = session.selectOne("htReviewAverage");
			System.out.println("ReviewDaoImpl reviewAverage() average->"+average);
		}catch (Exception e) {
			System.out.println("ReviewDaoImpl reviewAverage() average--> " + average);
		}
		return average;
	}

}
