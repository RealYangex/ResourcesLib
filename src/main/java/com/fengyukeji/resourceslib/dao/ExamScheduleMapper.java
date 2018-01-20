package com.fengyukeji.resourceslib.dao;

import com.fengyukeji.resourceslib.bean.ExamSchedule;
import com.fengyukeji.resourceslib.bean.ExamScheduleExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface ExamScheduleMapper {
    long countByExample(ExamScheduleExample example);

    int deleteByExample(ExamScheduleExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(ExamSchedule record);

    int insertSelective(ExamSchedule record);

    List<ExamSchedule> selectByExample(ExamScheduleExample example);

    ExamSchedule selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") ExamSchedule record, @Param("example") ExamScheduleExample example);

    int updateByExample(@Param("record") ExamSchedule record, @Param("example") ExamScheduleExample example);

    int updateByPrimaryKeySelective(ExamSchedule record);

    int updateByPrimaryKey(ExamSchedule record);
}