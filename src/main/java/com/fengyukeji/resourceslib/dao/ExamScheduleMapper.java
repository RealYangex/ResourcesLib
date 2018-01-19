package com.fengyukeji.resourceslib.dao;

import com.fengyukeji.resourceslib.bean.ExamSchedule;
import com.fengyukeji.resourceslib.bean.ExamScheduleExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface ExamScheduleMapper {
    long countByExample(ExamScheduleExample example);

    int deleteByExample(ExamScheduleExample example);

    int insert(ExamSchedule record);

    int insertSelective(ExamSchedule record);

    List<ExamSchedule> selectByExample(ExamScheduleExample example);

    int updateByExampleSelective(@Param("record") ExamSchedule record, @Param("example") ExamScheduleExample example);

    int updateByExample(@Param("record") ExamSchedule record, @Param("example") ExamScheduleExample example);
}