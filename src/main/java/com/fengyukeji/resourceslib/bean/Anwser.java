package com.fengyukeji.resourceslib.bean;

public class Anwser {
    private Integer id;

    private String anwserContent;

    private Integer anwserDoes;

    private Boolean isTrue;

    private Integer subjectId;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getAnwserContent() {
        return anwserContent;
    }

    public void setAnwserContent(String anwserContent) {
        this.anwserContent = anwserContent == null ? null : anwserContent.trim();
    }

    public Integer getAnwserDoes() {
        return anwserDoes;
    }

    public void setAnwserDoes(Integer anwserDoes) {
        this.anwserDoes = anwserDoes;
    }

    public Boolean getIsTrue() {
        return isTrue;
    }

    public void setIsTrue(Boolean isTrue) {
        this.isTrue = isTrue;
    }

    public Integer getSubjectId() {
        return subjectId;
    }

    public void setSubjectId(Integer subjectId) {
        this.subjectId = subjectId;
    }
}