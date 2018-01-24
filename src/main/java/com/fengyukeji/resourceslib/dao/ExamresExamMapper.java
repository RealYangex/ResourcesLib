package com.fengyukeji.resourceslib.dao;

import com.fengyukeji.resourceslib.bean.ExamresExam;
import com.fengyukeji.resourceslib.bean.ExamresExamExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface ExamresExamMapper {
    long countByExample(ExamresExamExample example);

    int deleteByExample(ExamresExamExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(ExamresExam record);

    int insertSelective(ExamresExam record);

    List<ExamresExam> selectByExample(ExamresExamExample example);

    ExamresExam selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") ExamresExam record, @Param("example") ExamresExamExample example);

    int updateByExample(@Param("record") ExamresExam record, @Param("example") ExamresExamExample example);

    int updateByPrimaryKeySelective(ExamresExam record);

    int updateByPrimaryKey(ExamresExam record);
}