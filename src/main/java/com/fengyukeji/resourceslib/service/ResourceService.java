package com.fengyukeji.resourceslib.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TreeMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fengyukeji.resourceslib.bean.CountByDate;
import com.fengyukeji.resourceslib.bean.Resources;
import com.fengyukeji.resourceslib.bean.ResourcesExample;
import com.fengyukeji.resourceslib.dao.ResourcesMapper;
import com.fengyukeji.resourceslib.dao.VisitMapper;
import com.fengyukeji.resourceslib.utils.FileUtil;
import com.fengyukeji.resourceslib.utils.Msg;

/**
 * resourceService 层
 * @author xt
 *
 * 2018年1月11日
 */
@Service
public class ResourceService {
	
	@Autowired
	ResourcesMapper resourcesMapper;
	
	@Autowired
	VisitMapper visitMapper;
	
	/**
	 * 上传文件
	 * @param resourceList
	 */
	public void uploadFile(List<Resources> resourceList) {
		String childrenId = "";
		Integer parentId = 0;
		for(Resources res:resourceList){
			int id = resourcesMapper.insertSelective(res);
			childrenId+=res.getId()+";";
			parentId = res.getParentId();
		}
		this.setChildrenId(parentId, childrenId.substring(0,childrenId.length()-1));
		
	}
	/**
	 * 新建文件夹
	 * @param resources
	 */
	public int mkdir(Resources resources) {
		
		resourcesMapper.insertSelective(resources);
		String id = resources.getId().toString();
		this.setChildrenId(resources.getParentId(), id);
		return 1;
	}
	
	/**
	 * 根据父id 设置子节点id
	 * @param parentId
	 * @param childrenID
	 */
	public void setChildrenId (Integer parentId,String childrensId){
		String beforeId = resourcesMapper.selectByPrimaryKey(parentId).getChildrensId();
		if(beforeId!=null){
			beforeId = beforeId+";";
			resourcesMapper.updateByPrimaryKeySelective(new Resources(parentId, null, null, beforeId+childrensId, null, null, null, null));
		}else{
			resourcesMapper.updateByPrimaryKeySelective(new Resources(parentId, null, null, childrensId, null, null, null, null));
		}
	}
	/**
	 *  根据父节点id 获取器目录下的所有文件夹和文件夹
	 * @param parentId
	 * @return
	 */
	public List<Resources> getFilesByParentId(Integer parentId) {
		String childrenId = resourcesMapper.selectByPrimaryKey(parentId).getChildrensId();
		if(childrenId==null||childrenId.equals("")){
			return null;
		}
		String childrenIds[] = childrenId.split(";");
		if(childrenIds.length==0){
			return null;
		}
		List<Resources> fileList = new ArrayList();
		for(String childstr:childrenIds){
			Integer childId = Integer.parseInt(childstr);
			Resources res = resourcesMapper.selectByPrimaryKey(childId);
			if(res==null) continue;
			fileList.add(res);
		}
		return fileList;
	}
	/**
	 *  根据文件类型 获取该类型的文件
	 * @param type
	 * @return
	 */
	public List<Resources> getFilesByType(Integer type) {
		ResourcesExample example = new ResourcesExample();
		example.createCriteria().andResResourcesTypeEqualTo(type);
		List<Resources> resList = resourcesMapper.selectByExample(example);
		if(resList.size()!=0){
			return resList;
		}
		return null;
	}
	/**
	 *  根据文件名搜索文件
	 * @param type
	 * @return
	 */
	public List<Resources> getFilesByName(String searchContent) {
		ResourcesExample example = new ResourcesExample();
		example.createCriteria().andNameLike(searchContent);
		//System.out.println(searchContent);
		List<Resources> resList = resourcesMapper.selectByExample(example);
		//System.out.println(resList);
		if(resList.size()!=0){
			return resList;
		}
		return null;
	}
	
	
	/**
	 * 根据名字判断是否有重名
	 * @param parentId 当前文件夹id
	 * @param name 文件名字
	 * @return
	 */
	public boolean isNamedByName(Integer parentId,String name){
		ResourcesExample example = new ResourcesExample();
		example.createCriteria().andParentIdEqualTo(parentId).andNameEqualTo(name);
		if(resourcesMapper.selectByExample(example).size()==0){
			return false;
		}
		return true;
	}
	
	/**
	 * 根据id 删除文件
	 * @param id
	 * @param serverPath 
	 */
	public void deleteFile(Integer id,Integer parentId, String serverPath) {
		String fileName = resourcesMapper.selectByPrimaryKey(id).getLocaltion();
		resourcesMapper.deleteByPrimaryKey(id);
																				//更新根节点
		this.divChildId(id, parentId);
		FileUtil.deleteFile(serverPath+fileName);
		return;
	}
	
	/**
	 * 根据id 删除文件  带有文件夹  但没有更新父级索引
	 * @param id
	 * @param serverPath 
	 */
	public void deleteFileWithFolder(Integer id,Integer parentId, String serverPath) {
		String fileName = resourcesMapper.selectByPrimaryKey(id).getLocaltion();
		resourcesMapper.deleteByPrimaryKey(id);
		FileUtil.deleteFile(serverPath+fileName);
		System.out.println("先删除文件");
		return;
	}
	
	/**
	 * 根据id 删除文件夹
	 * @param parentId 
	 * @param id 
	 * @param id
	 * @param serverPath 
	 */
	public void deleteFolder(Integer id, Integer parentId, String serverPath) {
		String folderPath = resourcesMapper.selectByPrimaryKey(id).getLocaltion();
		FileUtil.delete(serverPath+folderPath);
		resourcesMapper.deleteByPrimaryKey(id);
		System.out.println("后删除文件件");
		return;
	}
	
	/**
	 * 根据id 去除文件夹的父级索引
	 * @param id
	 * @param parentId
	 */
	public void divFolderChild(Integer id,Integer parentId){
		String childrenId = resourcesMapper.selectByPrimaryKey(parentId).getChildrensId();
		if(childrenId==null||childrenId.equals("")){
			return;
		}
		String childrenIds[] = childrenId.split(";");
		if(childrenIds.length==0){
			return;
		}
		String newChild = "";
		for(String childstr:childrenIds){
			if(childstr.equals(String.valueOf(id))){
				continue;
			}
			newChild+=childstr+";";
		}
		newChild = newChild.substring(0,newChild.length()-1);
		resourcesMapper.updateByPrimaryKeySelective(new Resources(parentId, null, null, newChild, null, null, null, null));
		
	}
	
	
	/**
	 * 删除文件夹 递归调用  但没有去除删除文件夹的的父级索引
	 * @param id
	 * @param parentId 
	 * @param serverPath 
	 */
	public void deleteFolderFile(Integer id, Integer parentId, String serverPath) {
		List<Resources> resList = this.getFilesByParentId(id);
		if(resList!=null) {
			for(Resources res:resList){
				if(res.getResResourcesType()==0){
					this.deleteFolderFile(res.getId(),res.getParentId(),serverPath);
				}else{
					this.deleteFileWithFolder(res.getId(),parentId,serverPath);
				}
			}
		}
		this.deleteFolder(id,parentId,serverPath);
		//TODO 空指针异常
	}
	
	/**
	 * 根据文件夹id获取文件夹存储路径
	 * @param parentId
	 * @return
	 */
	public String getFloderPath(Integer parentId) {
		
		return resourcesMapper.selectByPrimaryKey(parentId).getLocaltion();
	}
	/**
	 * 根据父id 去除其子id
	 * @param id
	 * @param parentId
	 */
	public void divChildId(Integer id,Integer parentId){
		String childrenId = resourcesMapper.selectByPrimaryKey(parentId).getChildrensId();
		if(childrenId==null||childrenId.equals("")){
			return;
		}
		String childrenIds[] = childrenId.split(";");
		if(childrenIds.length==0){
			return;
		}
		String newChild = "";
		for(String childstr:childrenIds){
			if(childstr.equals(String.valueOf(id))){
				continue;
			}
			newChild+=childstr+";";
		}
		newChild = newChild.substring(0,newChild.length()-1);
		resourcesMapper.updateByPrimaryKeySelective(new Resources(parentId, null, null, newChild, null, null, null, null));
	}
	
	/**
	 * 重名操作
	 * @param resources
	 * @param serverPath
	 * @param name
	 * @param oldname 
	 * @param fileType 
	 */
	public void rename(Resources resources, String serverPath, String name, String oldname, String fileType) {
		
		System.out.println(serverPath+" "+name+" "+oldname);
																								//不是文件夹
		if(fileType.equals("0")){
																								//修改数据库
			resourcesMapper.updateByPrimaryKeySelective(resources);
																								//修改物理路径
			FileUtil.renameFile(serverPath, oldname, name);
		}else{
																								//文件夹 需要修改起子级路径
		}
		
	}
	/**
	 * 访问指定id 的文件
	 * @param id
	 * @return
	 */
	public Resources getFile(Integer id) {
		return resourcesMapper.selectByPrimaryKey(id);
	}
	
	/**
	 * 获取文件的数量 根据类型
	 * @return
	 */
	public long getFileCountByType(Integer type) {
		if(type==0){
			return resourcesMapper.countByExample(null);
		}else{
			ResourcesExample example = new ResourcesExample();
			example.createCriteria().andResResourcesTypeEqualTo(type);
			return resourcesMapper.countByExample(example);
		}
		
	}
	public List<CountByDate> getSubVisitCountByDay(int days) {
		SimpleDateFormat format =  new SimpleDateFormat("yyyy-MM-dd");  
		Date date = new Date();  
		Calendar c = Calendar.getInstance();  
		c.setTime(date);  
		c.add(Calendar.DATE, -days);  
															//获取指定多少天前 格式"2017-12-21"
		String dateBeforeStr = format.format(c.getTime()); 
		List<CountByDate> countByDates =visitMapper .selectByDate(dateBeforeStr);
		c.setTime(date); 
		Map<String,Integer> countMap = new TreeMap<String, Integer>();
		for(int i = 0;i<days;i++){
			c.add(Calendar.DATE, -1);
			String t1 = format.format(c.getTime());
			countMap.put(t1, 0);
		}
		List<CountByDate> counts = new ArrayList<CountByDate>();			//用于返回所有值的list
		for(CountByDate countByDate:countByDates){
			String key = countByDate.getDate();
			if(countMap.get(key)!=null){
				countMap.put(key, countByDate.getNum());
			}
			
		}
		Set<String> mapKeys = countMap.keySet();
		for(String key:mapKeys){
			counts.add(new CountByDate(key,countMap.get(key)));
		}
			
		return counts;
	}
	
	
}
