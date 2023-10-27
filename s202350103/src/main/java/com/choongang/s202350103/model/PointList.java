package com.choongang.s202350103.model;

import java.util.Date;
import lombok.Data;

@Data
public class PointList {			//포인트 이력
	private int    p_num;			//적립번호
	private int    o_order_num;		//주문번호
	private int    m_num;			//회원번호
	private int    a_num;			//이벤트번호(출석)
	private int    q_num;			//이벤트번호(퀴즈)
	private Date   a_par_pdate;		//참여일자
	private int    p_list_type;		//적립유형
	private int    m_point;			//포인트
}
