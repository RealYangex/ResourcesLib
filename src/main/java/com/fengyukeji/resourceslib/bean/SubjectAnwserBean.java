package com.fengyukeji.resourceslib.bean;

import java.util.List;

/**
 * 题目答案实体 
 * @author xt
 *
 * 2018年1月18日
 */
public class SubjectAnwserBean {
	
	private Integer id;
	private String title;
	private String subjectType;
	private Integer does;
	private Integer successDoes;
	private Integer errorDoes;
	private List<String> anwser;
	private String isTrue;
	public Integer getId() {
		return id;
	}
	public SubjectAnwserBean(Integer id, String title, String subjectType,
			Integer does, Integer successDoes, Integer errorDoes,
			List<String> anwser, String isTrue) {
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
	public String getSubjectType() {
		return subjectType;
	}
	public void setSubjectType(String subjectType) {
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
	public List<String> getAnwser() {
		return anwser;
	}
	public void setAnwser(List<String> anwser) {
		this.anwser = anwser;
	}
	public String getIsTrue() {
		return isTrue;
	}
	public void setIsTrue(String isTrue) {
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
