package com.fengyukeji.resourceslib.bean;

import java.util.List;

public class SubjectWithAnwserBean {
    @Override
	public String toString() {
		return "Subject [id=" + id + ", subjectContent=" + subjectContent
				+ ", subjectType=" + subjectType + ", subjectDoes="
				+ subjectDoes + ", subjectSuccesses=" + subjectSuccesses
				+ ", subjectError=" + subjectError + ", anwserList="
				+ anwserList + "]";
	}

	private Integer id;

    private String subjectContent;

    private String subjectType;
    
    private Integer subjectDoes;

    private Integer subjectSuccesses;

    private Integer subjectError;
    
    private List<Anwser> anwserList = null; 
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getSubjectContent() {
        return subjectContent;
    }

    public void setSubjectContent(String subjectContent) {
        this.subjectContent = subjectContent == null ? null : subjectContent.trim();
    }

    public String getSubjectType() {
        return subjectType;
    }

    public void setSubjectType(String subjectType) {
        this.subjectType = subjectType;
    }

    public Integer getSubjectDoes() {
        return subjectDoes;
    }

    public void setSubjectDoes(Integer subjectDoes) {
        this.subjectDoes = subjectDoes;
    }

    public Integer getSubjectSuccesses() {
        return subjectSuccesses;
    }

    public void setSubjectSuccesses(Integer subjectSuccesses) {
        this.subjectSuccesses = subjectSuccesses;
    }

    public Integer getSubjectError() {
        return subjectError;
    }

    public void setSubjectError(Integer subjectError) {
        this.subjectError = subjectError;
    }

	public List<Anwser> getAnwserList() {
		return anwserList;
	}

	public void setAnwserList(List<Anwser> anwserList) {
		this.anwserList = anwserList;
	}

	public SubjectWithAnwserBean(Integer id, String subjectContent, String subjectType,
			Integer subjectDoes, Integer subjectSuccesses,
			Integer subjectError, List<Anwser> anwserList) {
		super();
		this.id = id;
		this.subjectContent = subjectContent;
		this.subjectType = subjectType;
		this.subjectDoes = subjectDoes;
		this.subjectSuccesses = subjectSuccesses;
		this.subjectError = subjectError;
		this.anwserList = anwserList;
	}

	public SubjectWithAnwserBean() {
	}
    
}