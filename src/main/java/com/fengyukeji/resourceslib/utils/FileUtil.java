package com.fengyukeji.resourceslib.utils;

import java.io.File;

/**
 * 文件工具类
 * @author xt
 *
 * 2018年1月12日
 */
public class FileUtil {
	private static  final  int FILE_ADUIO = 1;
	private static  final  int FILE_VEDIO = 2;
	private static  final  int FILE_DOCUMENT = 3;
	private static  final  int FILE_IMAGE = 4;
	private static  final  int FILE_OTHER = 5;
	public static int FileTypeReadBySuffix(String suffix){
		
		if(suffix.equalsIgnoreCase("mp3")){
			return FILE_ADUIO;
		}else if(suffix.equalsIgnoreCase("cd")){
			return FILE_ADUIO;
		}else if(suffix.equalsIgnoreCase("ogg")){
			return FILE_ADUIO;
		}else if(suffix.equalsIgnoreCase("asf")){
			return FILE_ADUIO;
		}else if(suffix.equalsIgnoreCase("wma")){
			return FILE_ADUIO;
		}else if(suffix.equalsIgnoreCase("wav")){
			return FILE_ADUIO;
		}else if(suffix.equalsIgnoreCase("ape")){
			return FILE_ADUIO;
		}else if(suffix.equalsIgnoreCase("midi")){
			return FILE_ADUIO;
		}else if(suffix.equalsIgnoreCase("aac")){
			return FILE_ADUIO;
		}else if(suffix.equalsIgnoreCase("flac")){
			return FILE_ADUIO;
		}else if(suffix.equalsIgnoreCase("aiff")){
			return FILE_ADUIO;
		}else if(suffix.equalsIgnoreCase("vqf")){
			return FILE_ADUIO;
		}else if(suffix.equalsIgnoreCase("wmv")){
			return FILE_VEDIO;
		}else if(suffix.equalsIgnoreCase("asf")){
			return FILE_VEDIO;
		}else if(suffix.equalsIgnoreCase("asx")){
			return FILE_VEDIO;
		}else if(suffix.equalsIgnoreCase("rm")){
			return FILE_VEDIO;
		}else if(suffix.equalsIgnoreCase("rmvb")){
			return FILE_VEDIO;
		}else if(suffix.equalsIgnoreCase("mpg")){
			return FILE_VEDIO;
		}else if(suffix.equalsIgnoreCase("mpeg")){
			return FILE_VEDIO;
		}else if(suffix.equalsIgnoreCase("mpe")){
			return FILE_VEDIO;
		}else if(suffix.equalsIgnoreCase("3gp")){
			return FILE_VEDIO;
		}else if(suffix.equalsIgnoreCase("mov")){
			return FILE_VEDIO;
		}else if(suffix.equalsIgnoreCase("mp4")){
			return FILE_VEDIO;
		}else if(suffix.equalsIgnoreCase("m4v")){
			return FILE_VEDIO;
		}else if(suffix.equalsIgnoreCase("avi")){
			return FILE_VEDIO;
		}else if(suffix.equalsIgnoreCase("dat")){
			return FILE_VEDIO;
		}else if(suffix.equalsIgnoreCase("mkv")){
			return FILE_VEDIO;
		}else if(suffix.equalsIgnoreCase("flv")){
			return FILE_VEDIO;
		}else if(suffix.equalsIgnoreCase("vob")){
			return FILE_VEDIO;
		}else if(suffix.equalsIgnoreCase("qsv")){
			return FILE_VEDIO;
		}else if(suffix.equalsIgnoreCase("qlv")){
			return FILE_VEDIO;
		}else if(suffix.equalsIgnoreCase("kux")){
			return FILE_VEDIO;
		}else if(suffix.equalsIgnoreCase("mts")){
			return FILE_VEDIO;
		}else if(suffix.equalsIgnoreCase("rtf")){
			return FILE_DOCUMENT;
		}else if(suffix.equalsIgnoreCase("doc")){
			return FILE_DOCUMENT;
		}else if(suffix.equalsIgnoreCase("docx")){
			return FILE_DOCUMENT;
		}else if(suffix.equalsIgnoreCase("pdf")){
			return FILE_DOCUMENT;
		}else if(suffix.equalsIgnoreCase("xls")){
			return FILE_DOCUMENT;
		}else if(suffix.equalsIgnoreCase("xlsx")){
			return FILE_DOCUMENT;
		}else if(suffix.equalsIgnoreCase("ppt")){
			return FILE_DOCUMENT;
		}else if(suffix.equalsIgnoreCase("pptx")){
			return FILE_DOCUMENT;
		}else if(suffix.equalsIgnoreCase("xps")){
			return FILE_DOCUMENT;
		}else if(suffix.equalsIgnoreCase("txt")){
			return FILE_DOCUMENT;
		}else if(suffix.equalsIgnoreCase("bmp")){
			return FILE_IMAGE;
		}else if(suffix.equalsIgnoreCase("pcx")){
			return FILE_IMAGE;
		}else if(suffix.equalsIgnoreCase("tiff")){
			return FILE_IMAGE;
		}else if(suffix.equalsIgnoreCase("gif")){
			return FILE_IMAGE;
		}else if(suffix.equalsIgnoreCase("jpeg")){
			return FILE_IMAGE;
		}else if(suffix.equalsIgnoreCase("jpg")){
			return FILE_IMAGE;
		}else if(suffix.equalsIgnoreCase("tga")){
			return FILE_IMAGE;
		}else if(suffix.equalsIgnoreCase("exif")){
			return FILE_IMAGE;
		}else if(suffix.equalsIgnoreCase("fpx")){
			return FILE_IMAGE;
		}else if(suffix.equalsIgnoreCase("svg")){
			return FILE_IMAGE;
		}else if(suffix.equalsIgnoreCase("png")){
			return FILE_IMAGE;
		}else if(suffix.equalsIgnoreCase("raw")){
			return FILE_IMAGE;
		}else if(suffix.equalsIgnoreCase("lic")){
			return FILE_IMAGE;
		}else if(suffix.equalsIgnoreCase("emf")){
			return FILE_IMAGE;
		}else if(suffix.equalsIgnoreCase("wmf")){
			return FILE_IMAGE;
		}else if(suffix.equalsIgnoreCase("psd")){
			return FILE_IMAGE;
		}else if(suffix.equalsIgnoreCase("webp")){
			return FILE_IMAGE;
		}else if(suffix.equalsIgnoreCase("pcd")){

			return FILE_IMAGE;
		}
		return FILE_OTHER;
	}
	
	/**
     * 删除单个文件
     *
     * @param fileName
     *            要删除的文件的文件名
     * @return 单个文件删除成功返回true，否则返回false
     */
    public static boolean deleteFile(String fileName) {
        File file = new File(fileName);
        // 如果文件路径所对应的文件存在，并且是一个文件，则直接删除
        if (file.exists() && file.isFile()) {
            if (file.delete()) {
//                System.out.println("删除单个文件" + fileName + "成功！");
                return true;
            } else {
//                System.out.println("删除单个文件" + fileName + "失败！");
                return false;
            }
        } else {
//            System.out.println("删除单个文件失败：" + fileName + "不存在！");
            return false;
        }
    }
    
    /**
     * 删除文件，可以是文件或文件夹
     *
     * @param fileName
     *            要删除的文件名
     * @return 删除成功返回true，否则返回false
     */
    public static boolean delete(String fileName) {
        File file = new File(fileName);
        if (!file.exists()) {
            System.out.println("删除文件失败:" + fileName + "不存在！");
            return false;
        } else {
            if (file.isFile())
                return deleteFile(fileName);
            else
                return file.delete();
        }
    }
    
    /**文件重命名 
     * @param path 文件目录 
     * @param oldname  原来的文件名 
     * @param newname 新文件名 
     */ 
     public static void renameFile(String path,String oldname,String newname){ 
         if(!oldname.equals(newname)){//新的文件名和以前文件名不同时,才有必要进行重命名 
             File oldfile=new File(path+"/"+oldname); 
             File newfile=new File(path+"/"+newname); 
             if(!oldfile.exists()){
                 return;//重命名文件不存在
             }
             if(newfile.exists())//若在该目录下已经有一个文件和新文件名相同，则不允许重命名 
                 System.out.println(newname+"已经存在！"); 
             else{ 
                 oldfile.renameTo(newfile); 
             } 
         }else{
             System.out.println("新文件名和旧文件名相同...");
         }
     }
}
