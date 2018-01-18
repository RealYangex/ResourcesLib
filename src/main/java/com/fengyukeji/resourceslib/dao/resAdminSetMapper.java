package com.fengyukeji.resourceslib.dao;

import com.fengyukeji.resourceslib.bean.resAdminSet;
import com.fengyukeji.resourceslib.bean.resAdminSetExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface resAdminSetMapper {
    long countByExample(resAdminSetExample example);

    int deleteByExample(resAdminSetExample example);

    int insert(resAdminSet record);

    int insertSelective(resAdminSet record);

    List<resAdminSet> selectByExample(resAdminSetExample example);

    int updateByExampleSelective(@Param("record") resAdminSet record, @Param("example") resAdminSetExample example);

    int updateByExample(@Param("record") resAdminSet record, @Param("example") resAdminSetExample example);
}