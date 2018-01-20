package com.fengyukeji.resourceslib.bean;

import java.util.Date;

public class ExamSchedule {
    private Integer id;

    private Date examStartDate;

    private Date examEndDate;

    private Integer examTime;

    private Integer examType;

    private Integer examSubjectNum;

    private Float examAllScore;

    private Integer isUse;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Date getExamStartDate() {
        return examStartDate;
    }

    public void setExamStartDate(Date examStartDate) {
        this.examStartDate = examStartDate;
    }

    public Date getExamEndDate() {
        return examEndDate;
    }

    public void setExamEndDate(Date examEndDate) {
        this.examEndDate = examEndDate;
    }

    public Integer getExamTime() {
        return examTime;
    }

    public void setExamTime(Integer examTime) {
        this.examTime = examTime;
    }

    public Integer getExamType() {
        return examType;
    }

    public void setExamType(Integer examType) {
        this.examType = examType;
    }

    public Integer getExamSubjectNum() {
        return examSubjectNum;
    }

    public void setExamSubjectNum(Integer examSubjectNum) {
        this.examSubjectNum = examSubjectNum;
    }

    public Float getExamAllScore() {
        return examAllScore;
    }

    public void setExamAllScore(Float examAllScore) {
        this.examAllScore = examAllScore;
    }

    public Integer getIsUse() {
        return isUse;
    }

    public void setIsUse(Integer isUse) {
        this.isUse = isUse;
    }
}