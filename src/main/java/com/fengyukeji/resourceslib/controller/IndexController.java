package com.fengyukeji.resourceslib.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 首页控制器
 * @author xt
 *
 * 2018年1月15日
 */
@RequestMapping("/Index")
@Controller
public class IndexController {
	/**
	 * 首页
	 * @return
	 */
	@RequestMapping("/index")
	public String index(){
		
		return "index";
	}
}
