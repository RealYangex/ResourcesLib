package com.fengyukeji.resourceslib.bean;

public class Subject {
    private Integer id;

    private String subjectContent;

    private Integer subjectType;

    private Integer subjectDoes;

    private Integer subjectSuccesses;

    private Integer subjectError;

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

    public Integer getSubjectType() {
        return subjectType;
    }

    public void setSubjectType(Integer subjectType) {
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
}