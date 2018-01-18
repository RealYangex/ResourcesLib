package com.fengyukeji.resourceslib.dao;

import com.fengyukeji.resourceslib.bean.Anwser;
import com.fengyukeji.resourceslib.bean.AnwserExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface AnwserMapper {
    long countByExample(AnwserExample example);

    int deleteByExample(AnwserExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Anwser record);

    int insertSelective(Anwser record);

    List<Anwser> selectByExample(AnwserExample example);

    Anwser selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Anwser record, @Param("example") AnwserExample example);

    int updateByExample(@Param("record") Anwser record, @Param("example") AnwserExample example);

    int updateByPrimaryKeySelective(Anwser record);

    int updateByPrimaryKey(Anwser record);
}