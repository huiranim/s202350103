package com.choongang.s202350103.htService;

import java.util.List;

import org.springframework.stereotype.Service;

import com.choongang.s202350103.htDao.ReviewDao;
import com.choongang.s202350103.model.Review;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ReviewServiceImpl implements ReviewService {
	private final ReviewDao rd;

	@Override
	public int reviewTotal() {
		System.out.println("ReviewServiceImpl reviewTotal() Start..." );
		int total = rd.reviewTotal();
		System.out.println("ReviewServiceImpl reviewTotal() total--> " + total);
		return total;
	}
	
	@Override
	public int reviewInsert(Review review) {
		System.out.println("ReviewServiceImpl reviewInsert() Start...");
		int result = rd.reviewInsert(review);
		System.out.println("ReviewServiceImpl reviewInsert() result--> " + result);
		return result;
	}

	@Override
	public List<Review> listReview(Review review) {
		System.out.println("ReviewServiceImpl listReview() Start...");
		List<Review> list = rd.listReview(review);
		return list;
	}

	
	
	
}
