package com.fengyukeji.resourceslib.bean;

import java.util.Date;

public class Resources {
    private Integer id;

    private String name;

    private Integer parentId;

    private String childrensId;

    private Integer resResourcesType;

    private String localtion;

    private Date createTime;

    private Integer adminId;
    
    

    public Resources(Integer id, String name, Integer parentId,
			String childrensId, Integer resResourcesType, String localtion,
			Date createTime, Integer adminId) {
		this.id = id;
		this.name = name;
		this.parentId = parentId;
		this.childrensId = childrensId;
		this.resResourcesType = resResourcesType;
		this.localtion = localtion;
		this.createTime = createTime;
		this.adminId = adminId;
	}
    
	@Override
	public String toString() {
		return "Resources [id=" + id + ", name=" + name + ", parentId="
				+ parentId + ", childrensId=" + childrensId
				+ ", resResourcesType=" + resResourcesType + ", localtion="
				+ localtion + ", createTime=" + createTime + ", adminId="
				+ adminId + "]";
	}

	public Resources() {
	}

	public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public Integer getParentId() {
        return parentId;
    }

    public void setParentId(Integer parentId) {
        this.parentId = parentId;
    }

    public String getChildrensId() {
        return childrensId;
    }

    public void setChildrensId(String childrensId) {
        this.childrensId = childrensId == null ? null : childrensId.trim();
    }

    public Integer getResResourcesType() {
        return resResourcesType;
    }

    public void setResResourcesType(Integer resResourcesType) {
        this.resResourcesType = resResourcesType;
    }

    public String getLocaltion() {
        return localtion;
    }

    public void setLocaltion(String localtion) {
        this.localtion = localtion == null ? null : localtion.trim();
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Integer getAdminId() {
        return adminId;
    }

    public void setAdminId(Integer adminId) {
        this.adminId = adminId;
    }
}