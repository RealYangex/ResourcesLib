package com.fengyukeji.resourceslib.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.fengyukeji.resourceslib.bean.CountByDate;
import com.fengyukeji.resourceslib.bean.Resources;
import com.fengyukeji.resourceslib.service.AdminSetingService;
import com.fengyukeji.resourceslib.service.CustomerService;
import com.fengyukeji.resourceslib.service.ResourceService;
import com.fengyukeji.resourceslib.service.SystemMessgeService;
import com.fengyukeji.resourceslib.utils.DateUtil;
import com.fengyukeji.resourceslib.utils.FileUtil;
import com.fengyukeji.resourceslib.utils.Msg;

/**
 *  资源管理控制器
 * @author xt
 *
 * 2018年1月11日
 */
@Controller
@RequestMapping("/Resources")
public class ResourcesController {
	
	@Autowired
	ResourceService resourceService;
	
	@Autowired
	CustomerService customerService;
	
	/**
	 *上传文件
	 * @return
	 * @throws IOException 
	 * @throws ParseException 
	 */
	@ResponseBody
	@RequestMapping("/uploadFile")
	public Msg uplaodFile(@RequestParam(value = "file", required = false) MultipartFile[] files, HttpServletRequest request) {
		Integer  parentId = Integer.parseInt(request.getParameter("parentId"));
		Integer adminId = 1;
		List<Resources> resourceList = new ArrayList();
		//获取文件夹的路径
		String folderPath = resourceService.getFloderPath(parentId);
		String serverPath = request.getServletContext().getRealPath("/");
		String fileSavePath = folderPath;
		System.out.println(serverPath);
        File pathFile = new File(serverPath+ fileSavePath);
        if (!pathFile.exists() && !pathFile.isDirectory()) {
            pathFile.mkdirs();
        }
        boolean checkName = true;
        String named = "";
        if (files != null && files.length > 0) {
        	
            //循环获取file数组中得文件      
            for (int i = 0; i < files.length; i++) {
                MultipartFile file = files[i]; //这个方法最慢           
                /*FileUtils.writeByteArrayToFile(new File("E:\\"+file.getOriginalFilename()), file.getBytes());*/
                //这个方法最快          
                try {
                	String fileFullName = file.getOriginalFilename();
                	if(resourceService.isNamedByName(parentId, fileFullName)){
                		named+=fileFullName;
                		checkName=false;
                		continue;
            		}
                    String type = fileFullName.substring(fileFullName.lastIndexOf("."));
                    String filename = fileFullName.substring(0,fileFullName.lastIndexOf("."));
                    Integer realType = FileUtil.FileTypeReadBySuffix(type.substring(1));
                    file.transferTo(new File(serverPath+ fileSavePath + "\\" + file.getOriginalFilename()));
                    resourceList.add(new Resources(null, fileFullName, parentId, null, realType, fileSavePath + file.getOriginalFilename(), DateUtil.getNowSqlDate(), adminId));
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				} 
                
                //这个方法其次      
                /*
                OutputStream os = new FileOutputStream("E:/" + file.getOriginalFilename()); //获取输入流 CommonsMultipartFile 中可以直接得到文件的流         
                InputStream is = file.getInputStream();
                byte[] bts = new byte[2048]; //一个一个字节的读取并写入             
                while (is.read(bts) != -1) {
                    os.write(bts);
                }
                os.flush();
                os.close();
                is.close();
                }   */
            	}
            } 
        //如果为空 不上传
        if(resourceList.size()!=0){
        	resourceService.uploadFile(resourceList);
        }
        if(!checkName){
        	Msg msg = new Msg();
    		msg.setCode(300);
    		msg.setMessage("文件上传完成；但"+named+"已经存在; 没有做任何操作;是否继续上传");
    		return msg;
        }
		return Msg.success();
	}
	/**
	 * 创建文件夹
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/mkdir")
	public Msg mkdir(Resources res,HttpServletRequest request){
		Integer parentId = Integer.parseInt(request.getParameter("parentId"));
		String name = request.getParameter("name");
		//获取文件夹的路径
		String folderPath = resourceService.getFloderPath(parentId);
		Integer adminId = 1;
		if(resourceService.isNamedByName(parentId, name)){
			Msg msg = new Msg();
			msg.setCode(300);
			msg.setMessage("当前文件夹已经存在");
			return msg;
		}
		int id = resourceService.mkdir(new Resources(null, name, parentId, null, 0, folderPath+name+"/", DateUtil.getNowSqlDate(), adminId));
		return Msg.success().add("id", id);
	}
	
	/**
	 * 根据当前id 获取该目录下的所有文件和文件夹
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/getFiles")
	public Msg getCurrentFile(HttpServletRequest request){
		Integer parentId = Integer.parseInt(request.getParameter("parentId"));
		List<Resources> fileList = resourceService.getFilesByParentId(parentId);
		return Msg.success().add("resources", fileList);
	}
	
	/**
	 * 根据文件类型 获取该类型的所有文件
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/getFilesByType")
	public Msg getFilesByType(HttpServletRequest request){
		Integer type = Integer.parseInt(request.getParameter("type"));
		List<Resources> fileList = resourceService.getFilesByType(type);
		return Msg.success().add("resources", fileList);
	}
	
	/**
	 * 根据文件名搜索文件
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/getFilesByName")
	public Msg getFilesByName(HttpServletRequest request){
		String searchContent = request.getParameter("searchContent");
		List<Resources> fileList = resourceService.getFilesByName(searchContent);
		return Msg.success().add("resources", fileList);
	}
	
	/**
	 * 删除文件和文件夹
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/deleteFile")
	public Msg deleteFile(HttpServletRequest request){
		Integer parentId = Integer.parseInt(request.getParameter("parentId"));
		Integer id = Integer.parseInt(request.getParameter("id"));
		Integer type = Integer.parseInt(request.getParameter("type"));
		String serverPath = request.getServletContext().getRealPath("/");
		if(id!=null&&type!=null){
																		//文件夹
			if(type==0){						
				resourceService.deleteFolderFile(id,parentId,serverPath);
																		//去除索引
				resourceService.divFolderChild(id,parentId);
			}else{
				resourceService.deleteFile(id,parentId,serverPath);
			}
		}
		return Msg.success();
	}
	
	
	/**
	 * 重命名
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/rename")
	public Msg rename(HttpServletRequest request){
		Integer parentId = Integer.parseInt(request.getParameter("parentId"));
		Integer id = Integer.parseInt(request.getParameter("id"));
		String name = request.getParameter("newname");
		String oldname = request.getParameter("oldname");
		String fileType = request.getParameter("fileType");
		String serverPath = request.getServletContext().getRealPath("/");
		//获取文件夹的路径
		String folderPath = resourceService.getFloderPath(parentId);
		Integer adminId = 1;
		if(resourceService.isNamedByName(parentId, name)){
			Msg msg = new Msg();
			msg.setCode(300);
			msg.setMessage("当前文件夹已经存在");
			return msg;
		}
		resourceService.rename(new Resources(id, name, null, null, null, folderPath+name, DateUtil.getNowSqlDate(), null),serverPath+folderPath,name,oldname,fileType);
		return Msg.success();
	}
	
	/**
	 * 返回 访问的id的存储路径
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/visit")
	public Msg visit(HttpServletRequest request){
		Integer id = Integer.parseInt(request.getParameter("id"));
		Resources res = resourceService.getFile(id);
		if(res!=null){
			return Msg.success().add("res", res);
		}
		return Msg.failed();
	}
	
	/**
	 * 下载
	 * @param request
	 * @return
	 */
	@RequestMapping("/download")
	public void download(HttpServletRequest request,HttpServletResponse response){
		Integer id = Integer.parseInt(request.getParameter("id"));
		Resources res = resourceService.getFile(id);
		if(res==null){
			try {
				PrintWriter out = response.getWriter();
				out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
		        out.println("<HTML>");
		        out.println("  <HEAD><TITLE>资源建设平台</TITLE></HEAD>");
		        out.println("  <BODY>");
		        out.print("   <center><h3>资源不存在<h3><hr>Tomocat 8.0<center> ");
		        out.println("  </BODY>");
		        out.println("</HTML>");
		        //最后要记得清空缓存区，并且关闭。
		        out.flush();
		        out.close();
				
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			return;
		}
		String filePath = res.getLocaltion(); 
		String name = res.getName();
		//模拟文件，myfile.txt为需要下载的文件  
        String fileName = request.getSession().getServletContext().getRealPath("/")+filePath;  
        try {
        	File file = new File(fileName);  
            if (file.exists()) {  
                String filename = file.getName();  
                InputStream fis = new BufferedInputStream(new FileInputStream( file));  
                name = URLEncoder.encode(name,"UTF-8");  
                response.reset();  
                response.setContentType("application/x-download");  
                response.addHeader("Content-Disposition","attachment;filename="+ new String(name.getBytes(),"UTF-8"));  
                response.addHeader("Content-Length", "" + file.length());  
                OutputStream out = new BufferedOutputStream(response.getOutputStream());  
                response.setContentType("application/octet-stream");  
                byte[] buffer = new byte[1024 * 1024 * 10];  
                int i = -1;  
                while ((i = fis.read(buffer)) != -1) {  
                    out .write(buffer, 0, i);  
  
                }  
                fis.close();  
                out .flush();  
                out .close();  
            } else {  
            	PrintWriter out = response.getWriter();
				out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
		        out.println("<HTML>");
		        out.println("  <HEAD><TITLE>A Servlet</TITLE></HEAD>");
		        out.println("  <BODY>");
		        out.print("   <center><h3>资源不存在<h3><hr>Tomocat 8.0<center> ");
		        out.println("  </BODY>");
		        out.println("</HTML>");
		        //最后要记得清空缓存区，并且关闭。
		        out.flush();
		        out.close();
            }  
        } catch (IOException ex) {  
            PrintWriter out;
			try {
				out = response.getWriter();
				out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
		        out.println("<HTML>");
		        out.println("  <HEAD><TITLE>资源建设平台</TITLE></HEAD>");
		        out.println("  <BODY>");
		        out.print("   <center><h3>资源不存在<h3><hr>Tomocat 8.0<center> ");
		        out.println("  </BODY>");
		        out.println("</HTML>");
		        //最后要记得清空缓存区，并且关闭。
		        out.flush();
		        out.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}  
              
        }  
	}
	
	/**
	 * flv 格式视频播放地址
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/playVideo")
	public Msg playVideo(HttpServletRequest request){
		String videoAdress = request.getParameter("src");
		request.getSession().setAttribute("videoAdress", videoAdress);
		return Msg.success();
	}
	
	/**
	 * flv 格式视频播放地址
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/getResourceInfo")
	public Msg getResourceInfo(HttpServletRequest request){
		long start = System.currentTimeMillis();
		//获取所有文件数
		long allFileCount = resourceService.getFileCountByType(0);
		
		//获取音频文件数
		long audioFileCount = resourceService.getFileCountByType(1);
		
		//获取视频文件数
		long videoFileCount = resourceService.getFileCountByType(2);
		
		//获取文档文件数
		long docFileCount = resourceService.getFileCountByType(3);
		
		//获取图片文件数
		long imageFileCount = resourceService.getFileCountByType(4);
		
		
		
		
		
		
		//获取用户数
		long allCusotmerCount = customerService.getAllCustomerCount();
		
		
		
		
		int audioPercent = (int)(((float)audioFileCount/allFileCount)*100);
		
		int vedioPercent = (int)(((float)videoFileCount/allFileCount)*100);
		
		int docPercent = (int)(((float)docFileCount/allFileCount)*100);
		
		int imagePercent = (int)(((float)imageFileCount/allFileCount)*100);
		
		long allVisitCount = customerService.getVisitCount();
		
		long end = System.currentTimeMillis();
		
		List<CountByDate> count = resourceService.getSubVisitCountByDay(12);
		
		System.out.println("消耗时间"+(end-start)+":ms");
		return Msg.success().add("allFileCount", allFileCount).add("audioPercent",audioPercent)
				.add("vedioPercent", vedioPercent).add("docPercent", docPercent).add("imagePercent", imagePercent)
				.add("allCusotmerCount", allCusotmerCount).add("allVisitCount",allVisitCount).add("count", count);
	}
	
	/**
	 * 获取一段时间的访问记录
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/getSubVisitCount")
	public Msg getSubVisitCount(){
		List<CountByDate> count = resourceService.getSubVisitCountByDay(12);
		return Msg.success().add("count", count);
	}
	
}
