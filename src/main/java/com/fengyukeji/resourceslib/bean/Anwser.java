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

	@Override
	public String toString() {
		return "Anwser [id=" + id + ", anwserContent=" + anwserContent
				+ ", anwserDoes=" + anwserDoes + ", isTrue=" + isTrue
				+ ", subjectId=" + subjectId + "]";
	}

	public Anwser(Integer id, String anwserContent, Integer anwserDoes,
			Boolean isTrue, Integer subjectId) {
		super();
		this.id = id;
		this.anwserContent = anwserContent;
		this.anwserDoes = anwserDoes;
		this.isTrue = isTrue;
		this.subjectId = subjectId;
	}

	public Anwser() {
	}
    
}