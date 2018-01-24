package com.fengyukeji.resourceslib.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.fengyukeji.resourceslib.bean.Anwser;
import com.fengyukeji.resourceslib.bean.Subject;
import com.fengyukeji.resourceslib.dao.AnwserMapper;
import com.fengyukeji.resourceslib.service.SubjectService;
import com.fengyukeji.resourceslib.utils.Msg;
import com.fengyukeji.resourceslib.utils.SimpleExcelWrite;

/**
 *  subject 控制器
 * @author xt
 *
 * 2018年1月21日
 */
@RequestMapping("/Subject")
@Controller
public class SubjectController {
	
	@Autowired
	SubjectService subjectService;
	
	@Autowired
	AnwserMapper anwserMapper;
	/**
	 * 根据id删除问题和答案
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/deleteSubjectAnwser")
	public Msg deleteSubjectAnwser(HttpServletRequest request) {
		Integer id= Integer.parseInt(request.getParameter("id"));
		subjectService.deleteSubjectAnwser(id);
		return Msg.success();
	}
	
	/**
	 * 根据id删除问题和答案
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/addSubjectAnwser")
	public Msg addSubjectAnwser(HttpServletRequest request) {
		String title= request.getParameter("title");
		String item1= request.getParameter("item1");
		String item2= request.getParameter("item2");
		String item3= request.getParameter("item3");
		String item4= request.getParameter("item4");
		String trueAnwser = request.getParameter("trueAnwser");
		//先存题目
		Integer subjectId = subjectService.addSubect(new Subject(null,title,1,null,null,null,null));
		// return;
		List<Anwser> anwserList = new ArrayList();
		if(item1.equals(trueAnwser)){
			anwserList.add(new Anwser(null,item1,null,true,subjectId));
		}else{
			anwserList.add(new Anwser(null,item1,null,false,subjectId));
		}
		if(item2.equals(trueAnwser)){
			anwserList.add(new Anwser(null,item2,null,true,subjectId));
		}else{
			anwserList.add(new Anwser(null,item2,null,false,subjectId));
		}	
		if(!item3.equals("")){
			if(item3.equals(trueAnwser)){
				anwserList.add(new Anwser(null,item3,null,true,subjectId));
			}else{
				anwserList.add(new Anwser(null,item3,null,false,subjectId));
			}
		}
		if(!item4.equals("")){
			if(item4.equals(trueAnwser)){
				anwserList.add(new Anwser(null,item4,null,true,subjectId));
			}else{
				anwserList.add(new Anwser(null,item4,null,false,subjectId));
			}
		}
		
		//subjectService.deleteSubjectAnwser(id);
		for(Anwser anwser:anwserList){
			anwserMapper.insertSelective(anwser);
		}
		return Msg.success();
	}
	
	/**
	 * 批量添加 试题
	 * @return
	 */
	
	@ResponseBody
	@RequestMapping("/uploadFile")
	public Msg addSubjectBath(MultipartFile file,HttpServletRequest request){
		if(null!=file&&!file.isEmpty()){
			//取得原文件名
			String fileName = file.getOriginalFilename();
			//获取文件后缀名
			String suffix = fileName.substring(fileName.lastIndexOf(".")).toLowerCase();
			if(!suffix.equals(".xls")){
				Msg msg = new Msg();
				msg.setCode(100);
				msg.setMessage("上传文件格式不符");
				return msg;
			}
			//获取上传的绝对路径
			String realPath = request.getSession().getServletContext().getRealPath("/"+"Excelupload/");
			//如果路径不存在 则创建该路径
			File realPathDirectory = new File(realPath);
			if(realPathDirectory==null||!realPathDirectory.exists()){
				realPathDirectory.mkdirs();
			}
			
			String format ="yyyyMMddHHmmss";
            SimpleDateFormat simpleDateFormat =new SimpleDateFormat(format);
            String MyFileName= simpleDateFormat.format(new Date()) + suffix;
			File uploadFile = new File(realPathDirectory+"/"+MyFileName);
			
			try{
				//设置路径 
				SimpleExcelWrite.path = uploadFile.toString();
				file.transferTo(uploadFile);
				//插入数据
				if(!subjectService.insertConfirm()){
					Msg msg = new Msg();
					msg.setCode(100);
					return msg;
				}
				
			}catch(Exception e){
				e.printStackTrace();
				return Msg.failed();
			}
			
		}
		
		
		return Msg.success();
	}
	
}
