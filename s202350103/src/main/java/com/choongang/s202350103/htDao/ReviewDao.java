package com.choongang.s202350103.htDao;

import java.util.List;

import com.choongang.s202350103.model.Review;

public interface ReviewDao {
	int          reviewInsert(Review review);
	int          reviewTotal();
	List<Review> listReview(Review review);
}
