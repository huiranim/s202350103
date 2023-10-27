package com.choongang.s202350103.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import com.choongang.s202350103.hrService.MemberService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@Slf4j
public class HrController {
	public final MemberService ms;
	
	@RequestMapping(value = "helloFo")
	public String memTot1(Model model) {
		System.out.println("Controller start..");
		int result = ms.memTot();
		System.out.println("Controller result -> "+ result);
		model.addAttribute("result", result);
		return "commonFo";
	}
	
	@RequestMapping(value = "helloBo")
	public String memTot2(Model model) {
		System.out.println("Controller start..");
		int result = ms.memTot();
		System.out.println("Controller result -> "+ result);
		model.addAttribute("result", result);
		return "commonBo";
	}
}
