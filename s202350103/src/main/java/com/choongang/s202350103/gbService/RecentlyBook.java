package com.choongang.s202350103.gbService;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

@Service
@RequiredArgsConstructor
public class RecentlyBook {
	// 쿠키에 저장할 값
	private String nb_num_value;
	ArrayList<String> recentBookList = null;
	HttpSession session;
	
	// 세션에 저장할 리스트를 만드는 메소드
	@SuppressWarnings("unchecked")
	public ArrayList<String> RecentlyBookList(String nb_num){
		this.nb_num_value = nb_num;
		System.out.println("nb_num_value -> "+nb_num_value);
		
		if(session != null) {
			System.out.println("Session이 null 아닐 때");
			if(session.getAttribute("recentlyList") != null) {
				System.out.println("null이 아닐 때 start...");
				recentBookList = (ArrayList<String>) session.getAttribute("recentlyList");
			}
		}else {
			System.out.println("Session이 null일 때");
			recentBookList = new ArrayList<String>();
		}
		recentBookList.add(nb_num_value);

		return recentBookList;
	}
}
