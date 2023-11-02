package com.choongang.s202350103.htService;

import java.util.List;

import com.choongang.s202350103.model.Review;

public interface ReviewService {
	int            reviewInsert(Review review);
	int            reviewTotal();
	List<Review>   listReview(Review review);

	int            reviewRating(Review review);
	double         reviewAverage();
	
}
