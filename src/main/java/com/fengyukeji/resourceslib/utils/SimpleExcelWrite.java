package com.fengyukeji.resourceslib.utils;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;

import com.fengyukeji.resourceslib.bean.Anwser;
import com.fengyukeji.resourceslib.bean.SubjectAnwserBean;
import com.fengyukeji.resourceslib.bean.SubjectWithAnwserBean;

import jxl.Cell;
import jxl.CellType;
import jxl.Sheet;
import jxl.Workbook;
import jxl.write.Label;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;
import jxl.write.WriteException;

public class SimpleExcelWrite {
	public static  List<List<String>> ListListData = new ArrayList();
	public static String path;
	public void createExcel(OutputStream os) throws WriteException,IOException{
        //创建工作薄
        WritableWorkbook workbook = Workbook.createWorkbook(os);
        //创建新的一页
        WritableSheet sheet = workbook.createSheet("First Sheet",0);
        
        for(int i = 0;i<ListListData.size();i++){
        	for(int j = 0;j<ListListData.get(i).size();j++){
        		Label  label = new Label(j,i,ListListData.get(i).get(j));
        		sheet.addCell(label);
        	}
        }
        ListListData.clear();
        //创建要显示的内容,创建一个单元格，第一个参数为列坐标，第二个参数为行坐标，第三个参数为内容
        /*
        Label xuexiao = new Label(0,0,"学校");
        sheet.addCell(xuexiao);
        Label zhuanye = new Label(1,0,"专业");
        sheet.addCell(zhuanye);
        Label jingzhengli = new Label(2,0,"专业竞争力");
        sheet.addCell(jingzhengli);
        
        
        */
        //把创建的内容写入到输出流中，并关闭输出流
        workbook.write();
        workbook.close();
        os.close();
    }
	/**
	 * 创建空的表格
	 * @param os
	 * @throws WriteException
	 * @throws IOException
	 */
	public void createEmptyExcel(OutputStream os) throws WriteException,IOException{
        //创建工作薄
        WritableWorkbook workbook = Workbook.createWorkbook(os);
        //创建新的一页
        WritableSheet sheet = workbook.createSheet("First Sheet",0);
        
        for(int i = 0;i<ListListData.size();i++){
        	for(int j = 0;j<ListListData.get(i).size();j++){
        		Label  label = new Label(j,i,ListListData.get(i).get(j));
        		sheet.addCell(label);
        	}
        }
        //创建要显示的内容,创建一个单元格，第一个参数为列坐标，第二个参数为行坐标，第三个参数为内容
        
        Label subject = new Label(0,0,"题目内容");
        sheet.addCell(subject);
        Label trueItem = new Label(1,0,"正确选项");
        sheet.addCell(trueItem);
        Label item1 = new Label(2,0,"选项一");
        sheet.addCell(item1);
        Label item2 = new Label(3,0,"选项二");
        sheet.addCell(item2);
        Label item3 = new Label(4,0,"选项三");
        sheet.addCell(item3);
        //把创建的内容写入到输出流中，并关闭输出流
        workbook.write();
        workbook.close();
        os.close();
    }
	
	/**
	 * 读取excel
	 * @param path 文件路径
	 */
	public List<SubjectWithAnwserBean> readExcel(){
		jxl.Workbook readwb = null;   
		List<SubjectWithAnwserBean> list = null;
        try    
  
        {   
            //构建Workbook对象, 只读Workbook对象   
  
            //直接从本地文件创建Workbook   
  
            InputStream instream = new FileInputStream(path);   
  
            readwb = Workbook.getWorkbook(instream);   
  
            //Sheet的下标是从0开始   
  
            //获取第一张Sheet表   
  
            Sheet readsheet = readwb.getSheet(0);   
  
            //获取Sheet表中所包含的总列数   
  
            int rsColumns = readsheet.getColumns();  
            //获取Sheet表中所包含的总行数   
            
            if(rsColumns!=5){
            	return null;
            }
            
            int rsRows = readsheet.getRows();   
            
            //获取指定单元格的对象引用   
            list = new ArrayList(); 
            
            for (int i = 1; i < rsRows; i++)   
  
            {   
            	List<Anwser> anwserList = new ArrayList();
                for (int j = 0; j < rsColumns; j++)   
  
                {   	
                	
                    //Cell cell = readsheet.getCell(j, i);   
  
                   // System.out.print(cell.getContents() + " ");   
                } 
                if(readsheet.getCell(1,i).getContents()!=null){
                	
                	anwserList.add(new Anwser(null, readsheet.getCell(1,i).getContents(), null, true, null));
                }
				if(readsheet.getCell(2,i).getContents()!=null){
				                	
				    anwserList.add(new Anwser(null, readsheet.getCell(2,i).getContents(), null, false, null));
				}
				if(readsheet.getCell(3,i).getContents()!=null){
					
					anwserList.add(new Anwser(null, readsheet.getCell(3,i).getContents(), null, false, null));
				}
				if(readsheet.getCell(4,i).getContents()!=null){
					
					anwserList.add(new Anwser(null, readsheet.getCell(4,i).getContents(), null, false, null));
				}
                
                SubjectWithAnwserBean subjectList = new SubjectWithAnwserBean(null,readsheet.getCell(0, i).getContents(),null,null,null,null,anwserList);
            	list.add(subjectList);
            }   
            
               
            /*
            //利用已经创建的Excel工作薄,创建新的可写入的Excel工作薄   
  
            jxl.write.WritableWorkbook wwb = Workbook.createWorkbook(new File(   
  
                    "F:/红楼人物1.xls"), readwb);   
  
            //读取第一张工作表   
  
            jxl.write.WritableSheet ws = wwb.getSheet(0);   
  
            //获得第一个单元格对象   
  
            jxl.write.WritableCell wc = ws.getWritableCell(0, 0);   
  
            //判断单元格的类型, 做出相应的转化   
  
            if (wc.getType() == CellType.LABEL)    
  
            {   
  
                Label l = (Label) wc;   
  
                l.setString("新姓名");   
  
            }   
  			9763201
            //写入Excel对象   
  
            wwb.write();   
  
            wwb.close();   
             */
        } catch (Exception e) {   
  
            e.printStackTrace();   
  
        } finally {   
            readwb.close();   
        } 
        
        return list;
	}   
	
}
