package com.fengyukeji.resourceslib.dao;

import com.fengyukeji.resourceslib.bean.Subject;
import com.fengyukeji.resourceslib.bean.SubjectAnwserBean;
import com.fengyukeji.resourceslib.bean.SubjectExample;
import com.fengyukeji.resourceslib.bean.SubjectWithAnwserBean;
import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface SubjectMapper {
    long countByExample(SubjectExample example);

    int deleteByExample(SubjectExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Subject record);

    int insertSelective(Subject record);

    List<Subject> selectByExample(SubjectExample example);

    List<SubjectWithAnwserBean> selectSubjectWithAnwser(Integer page,Integer showNums);
    
    List<SubjectWithAnwserBean> selectSubjectWithAnwserByType(Integer page,Integer id,Integer showNums);
    
    Subject selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Subject record, @Param("example") SubjectExample example);

    int updateByExample(@Param("record") Subject record, @Param("example") SubjectExample example);

    int updateByPrimaryKeySelective(Subject record);

    int updateByPrimaryKey(Subject record);
}