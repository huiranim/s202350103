package com.choongang.s202350103.domain;

import java.util.Date;

import lombok.Data;

@Data
public class kakaoPayReadyVO {
	//response
    private String tid, next_redirect_pc_url;
    private Date created_at;
}
