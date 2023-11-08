package com.choongang.s202350103.htDao;

import java.util.List;

import com.choongang.s202350103.model.Member;
import com.choongang.s202350103.model.Orderr;
import com.choongang.s202350103.model.Review;

public interface ReviewDao {
	int          reviewInsert(Review review);
	int          reviewTotal();
	List<Review> listReview(Review review);
	int          reviewRating(Review review);
	double       reviewAverage();
	List<Orderr> reviewWriteList(Orderr orderr);
	int          myReviewTotal(Orderr orderr);
	int 		 myReviewedTotal(Review review);
	List<Review> reviewedWriteList(Review review);
	Review       writedReview(Review review);
	int          reviewUpdate(Review review);
	int          reviewDelete(Review review);
}
