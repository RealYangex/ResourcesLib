package com.fengyukeji.resourceslib.dao;

import com.fengyukeji.resourceslib.bean.AdminSet;
import com.fengyukeji.resourceslib.bean.AdminSetExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface AdminSetMapper {
    long countByExample(AdminSetExample example);

    int deleteByExample(AdminSetExample example);

    int insert(AdminSet record);

    int insertSelective(AdminSet record);

    List<AdminSet> selectByExample(AdminSetExample example);

    int updateByExampleSelective(@Param("record") AdminSet record, @Param("example") AdminSetExample example);

    int updateByExample(@Param("record") AdminSet record, @Param("example") AdminSetExample example);
}