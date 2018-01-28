package com.fengyukeji.resourceslib.dao;

import com.fengyukeji.resourceslib.bean.Exam;
import com.fengyukeji.resourceslib.bean.ExamExample;
import com.fengyukeji.resourceslib.bean.ExamWithCustomerBean;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface ExamMapper {
    long countByExample(ExamExample example);

    int deleteByExample(ExamExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Exam record);

    int insertSelective(Exam record);

    List<Exam> selectByExample(ExamExample example);
    
    //自定义获取考试成绩的方法
    List<ExamWithCustomerBean> selectEaxmWithCustomer(Integer pageIndex,Integer pageNum);
    
    //自定义获取所有考试成绩的方法
    List<ExamWithCustomerBean> selectAllExamWithCustomer();
    
    //自定义获取所有考试成绩的方法 根据分数排序 顺序
    List<ExamWithCustomerBean> selectEaxmWithCustomerSortByScoreUp(Integer pageIndex,Integer pageNum);
    
    //自定义获取所有考试成绩的方法 根据分数排序 顺序
    List<ExamWithCustomerBean> selectEaxmWithCustomerSortByScoreDown(Integer pageIndex,Integer pageNum);
    
    Exam selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Exam record, @Param("example") ExamExample example);

    int updateByExample(@Param("record") Exam record, @Param("example") ExamExample example);

    int updateByPrimaryKeySelective(Exam record);

    int updateByPrimaryKey(Exam record);
}