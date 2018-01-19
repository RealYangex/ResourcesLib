package com.fengyukeji.resourceslib.bean;
/**
 * 题目答案实体 
 * @author xt
 *
 * 2018年1月18日
 */
public class SubjectAnwserBean {
	
	private Integer id;
	private String title;
	private Integer subjectType;
	private Integer does;
	private Integer successDoes;
	private Integer errorDoes;
	private String anwser;
	private Integer isTrue;
	public Integer getId() {
		return id;
	}
	public SubjectAnwserBean(Integer id, String title, Integer subjectType,
			Integer does, Integer successDoes, Integer errorDoes,
			String anwser, Integer isTrue) {
		super();
		this.id = id;
		this.title = title;
		this.subjectType = subjectType;
		this.does = does;
		this.successDoes = successDoes;
		this.errorDoes = errorDoes;
		this.anwser = anwser;
		this.isTrue = isTrue;
	}
	public SubjectAnwserBean() {
		super();
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Integer getSubjectType() {
		return subjectType;
	}
	public void setSubjectType(Integer subjectType) {
		this.subjectType = subjectType;
	}
	public Integer getDoes() {
		return does;
	}
	public void setDoes(Integer does) {
		this.does = does;
	}
	public Integer getSuccessDoes() {
		return successDoes;
	}
	public void setSuccessDoes(Integer successDoes) {
		this.successDoes = successDoes;
	}
	public Integer getErrorDoes() {
		return errorDoes;
	}
	public void setErrorDoes(Integer errorDoes) {
		this.errorDoes = errorDoes;
	}
	public String getAnwser() {
		return anwser;
	}
	public void setAnwser(String anwser) {
		this.anwser = anwser;
	}
	public Integer getIsTrue() {
		return isTrue;
	}
	public void setIsTrue(Integer isTrue) {
		this.isTrue = isTrue;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	@Override
	public String toString() {
		return "SubjectAnwserBean [id=" + id + ", title=" + title
				+ ", subjectType=" + subjectType + ", does=" + does
				+ ", successDoes=" + successDoes + ", errorDoes=" + errorDoes
				+ ", anwser=" + anwser + ", isTrue=" + isTrue + "]";
	}

}
