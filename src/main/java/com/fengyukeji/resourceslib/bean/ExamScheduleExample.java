package com.fengyukeji.resourceslib.bean;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class ExamScheduleExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public ExamScheduleExample() {
        oredCriteria = new ArrayList<Criteria>();
    }

    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    public String getOrderByClause() {
        return orderByClause;
    }

    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    public boolean isDistinct() {
        return distinct;
    }

    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

    protected abstract static class GeneratedCriteria {
        protected List<Criterion> criteria;

        protected GeneratedCriteria() {
            super();
            criteria = new ArrayList<Criterion>();
        }

        public boolean isValid() {
            return criteria.size() > 0;
        }

        public List<Criterion> getAllCriteria() {
            return criteria;
        }

        public List<Criterion> getCriteria() {
            return criteria;
        }

        protected void addCriterion(String condition) {
            if (condition == null) {
                throw new RuntimeException("Value for condition cannot be null");
            }
            criteria.add(new Criterion(condition));
        }

        protected void addCriterion(String condition, Object value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value));
        }

        protected void addCriterion(String condition, Object value1, Object value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value1, value2));
        }

        public Criteria andIdIsNull() {
            addCriterion("id is null");
            return (Criteria) this;
        }

        public Criteria andIdIsNotNull() {
            addCriterion("id is not null");
            return (Criteria) this;
        }

        public Criteria andIdEqualTo(Integer value) {
            addCriterion("id =", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotEqualTo(Integer value) {
            addCriterion("id <>", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdGreaterThan(Integer value) {
            addCriterion("id >", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("id >=", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdLessThan(Integer value) {
            addCriterion("id <", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdLessThanOrEqualTo(Integer value) {
            addCriterion("id <=", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdIn(List<Integer> values) {
            addCriterion("id in", values, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotIn(List<Integer> values) {
            addCriterion("id not in", values, "id");
            return (Criteria) this;
        }

        public Criteria andIdBetween(Integer value1, Integer value2) {
            addCriterion("id between", value1, value2, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotBetween(Integer value1, Integer value2) {
            addCriterion("id not between", value1, value2, "id");
            return (Criteria) this;
        }

        public Criteria andExamStartDateIsNull() {
            addCriterion("exam_start_date is null");
            return (Criteria) this;
        }

        public Criteria andExamStartDateIsNotNull() {
            addCriterion("exam_start_date is not null");
            return (Criteria) this;
        }

        public Criteria andExamStartDateEqualTo(Date value) {
            addCriterion("exam_start_date =", value, "examStartDate");
            return (Criteria) this;
        }

        public Criteria andExamStartDateNotEqualTo(Date value) {
            addCriterion("exam_start_date <>", value, "examStartDate");
            return (Criteria) this;
        }

        public Criteria andExamStartDateGreaterThan(Date value) {
            addCriterion("exam_start_date >", value, "examStartDate");
            return (Criteria) this;
        }

        public Criteria andExamStartDateGreaterThanOrEqualTo(Date value) {
            addCriterion("exam_start_date >=", value, "examStartDate");
            return (Criteria) this;
        }

        public Criteria andExamStartDateLessThan(Date value) {
            addCriterion("exam_start_date <", value, "examStartDate");
            return (Criteria) this;
        }

        public Criteria andExamStartDateLessThanOrEqualTo(Date value) {
            addCriterion("exam_start_date <=", value, "examStartDate");
            return (Criteria) this;
        }

        public Criteria andExamStartDateIn(List<Date> values) {
            addCriterion("exam_start_date in", values, "examStartDate");
            return (Criteria) this;
        }

        public Criteria andExamStartDateNotIn(List<Date> values) {
            addCriterion("exam_start_date not in", values, "examStartDate");
            return (Criteria) this;
        }

        public Criteria andExamStartDateBetween(Date value1, Date value2) {
            addCriterion("exam_start_date between", value1, value2, "examStartDate");
            return (Criteria) this;
        }

        public Criteria andExamStartDateNotBetween(Date value1, Date value2) {
            addCriterion("exam_start_date not between", value1, value2, "examStartDate");
            return (Criteria) this;
        }

        public Criteria andExamEndDateIsNull() {
            addCriterion("exam_end_date is null");
            return (Criteria) this;
        }

        public Criteria andExamEndDateIsNotNull() {
            addCriterion("exam_end_date is not null");
            return (Criteria) this;
        }

        public Criteria andExamEndDateEqualTo(Date value) {
            addCriterion("exam_end_date =", value, "examEndDate");
            return (Criteria) this;
        }

        public Criteria andExamEndDateNotEqualTo(Date value) {
            addCriterion("exam_end_date <>", value, "examEndDate");
            return (Criteria) this;
        }

        public Criteria andExamEndDateGreaterThan(Date value) {
            addCriterion("exam_end_date >", value, "examEndDate");
            return (Criteria) this;
        }

        public Criteria andExamEndDateGreaterThanOrEqualTo(Date value) {
            addCriterion("exam_end_date >=", value, "examEndDate");
            return (Criteria) this;
        }

        public Criteria andExamEndDateLessThan(Date value) {
            addCriterion("exam_end_date <", value, "examEndDate");
            return (Criteria) this;
        }

        public Criteria andExamEndDateLessThanOrEqualTo(Date value) {
            addCriterion("exam_end_date <=", value, "examEndDate");
            return (Criteria) this;
        }

        public Criteria andExamEndDateIn(List<Date> values) {
            addCriterion("exam_end_date in", values, "examEndDate");
            return (Criteria) this;
        }

        public Criteria andExamEndDateNotIn(List<Date> values) {
            addCriterion("exam_end_date not in", values, "examEndDate");
            return (Criteria) this;
        }

        public Criteria andExamEndDateBetween(Date value1, Date value2) {
            addCriterion("exam_end_date between", value1, value2, "examEndDate");
            return (Criteria) this;
        }

        public Criteria andExamEndDateNotBetween(Date value1, Date value2) {
            addCriterion("exam_end_date not between", value1, value2, "examEndDate");
            return (Criteria) this;
        }

        public Criteria andExamTimeIsNull() {
            addCriterion("exam_time is null");
            return (Criteria) this;
        }

        public Criteria andExamTimeIsNotNull() {
            addCriterion("exam_time is not null");
            return (Criteria) this;
        }

        public Criteria andExamTimeEqualTo(Integer value) {
            addCriterion("exam_time =", value, "examTime");
            return (Criteria) this;
        }

        public Criteria andExamTimeNotEqualTo(Integer value) {
            addCriterion("exam_time <>", value, "examTime");
            return (Criteria) this;
        }

        public Criteria andExamTimeGreaterThan(Integer value) {
            addCriterion("exam_time >", value, "examTime");
            return (Criteria) this;
        }

        public Criteria andExamTimeGreaterThanOrEqualTo(Integer value) {
            addCriterion("exam_time >=", value, "examTime");
            return (Criteria) this;
        }

        public Criteria andExamTimeLessThan(Integer value) {
            addCriterion("exam_time <", value, "examTime");
            return (Criteria) this;
        }

        public Criteria andExamTimeLessThanOrEqualTo(Integer value) {
            addCriterion("exam_time <=", value, "examTime");
            return (Criteria) this;
        }

        public Criteria andExamTimeIn(List<Integer> values) {
            addCriterion("exam_time in", values, "examTime");
            return (Criteria) this;
        }

        public Criteria andExamTimeNotIn(List<Integer> values) {
            addCriterion("exam_time not in", values, "examTime");
            return (Criteria) this;
        }

        public Criteria andExamTimeBetween(Integer value1, Integer value2) {
            addCriterion("exam_time between", value1, value2, "examTime");
            return (Criteria) this;
        }

        public Criteria andExamTimeNotBetween(Integer value1, Integer value2) {
            addCriterion("exam_time not between", value1, value2, "examTime");
            return (Criteria) this;
        }

        public Criteria andExamTypeIsNull() {
            addCriterion("exam_type is null");
            return (Criteria) this;
        }

        public Criteria andExamTypeIsNotNull() {
            addCriterion("exam_type is not null");
            return (Criteria) this;
        }

        public Criteria andExamTypeEqualTo(Integer value) {
            addCriterion("exam_type =", value, "examType");
            return (Criteria) this;
        }

        public Criteria andExamTypeNotEqualTo(Integer value) {
            addCriterion("exam_type <>", value, "examType");
            return (Criteria) this;
        }

        public Criteria andExamTypeGreaterThan(Integer value) {
            addCriterion("exam_type >", value, "examType");
            return (Criteria) this;
        }

        public Criteria andExamTypeGreaterThanOrEqualTo(Integer value) {
            addCriterion("exam_type >=", value, "examType");
            return (Criteria) this;
        }

        public Criteria andExamTypeLessThan(Integer value) {
            addCriterion("exam_type <", value, "examType");
            return (Criteria) this;
        }

        public Criteria andExamTypeLessThanOrEqualTo(Integer value) {
            addCriterion("exam_type <=", value, "examType");
            return (Criteria) this;
        }

        public Criteria andExamTypeIn(List<Integer> values) {
            addCriterion("exam_type in", values, "examType");
            return (Criteria) this;
        }

        public Criteria andExamTypeNotIn(List<Integer> values) {
            addCriterion("exam_type not in", values, "examType");
            return (Criteria) this;
        }

        public Criteria andExamTypeBetween(Integer value1, Integer value2) {
            addCriterion("exam_type between", value1, value2, "examType");
            return (Criteria) this;
        }

        public Criteria andExamTypeNotBetween(Integer value1, Integer value2) {
            addCriterion("exam_type not between", value1, value2, "examType");
            return (Criteria) this;
        }

        public Criteria andExamSubjectNumIsNull() {
            addCriterion("exam_subject_num is null");
            return (Criteria) this;
        }

        public Criteria andExamSubjectNumIsNotNull() {
            addCriterion("exam_subject_num is not null");
            return (Criteria) this;
        }

        public Criteria andExamSubjectNumEqualTo(Integer value) {
            addCriterion("exam_subject_num =", value, "examSubjectNum");
            return (Criteria) this;
        }

        public Criteria andExamSubjectNumNotEqualTo(Integer value) {
            addCriterion("exam_subject_num <>", value, "examSubjectNum");
            return (Criteria) this;
        }

        public Criteria andExamSubjectNumGreaterThan(Integer value) {
            addCriterion("exam_subject_num >", value, "examSubjectNum");
            return (Criteria) this;
        }

        public Criteria andExamSubjectNumGreaterThanOrEqualTo(Integer value) {
            addCriterion("exam_subject_num >=", value, "examSubjectNum");
            return (Criteria) this;
        }

        public Criteria andExamSubjectNumLessThan(Integer value) {
            addCriterion("exam_subject_num <", value, "examSubjectNum");
            return (Criteria) this;
        }

        public Criteria andExamSubjectNumLessThanOrEqualTo(Integer value) {
            addCriterion("exam_subject_num <=", value, "examSubjectNum");
            return (Criteria) this;
        }

        public Criteria andExamSubjectNumIn(List<Integer> values) {
            addCriterion("exam_subject_num in", values, "examSubjectNum");
            return (Criteria) this;
        }

        public Criteria andExamSubjectNumNotIn(List<Integer> values) {
            addCriterion("exam_subject_num not in", values, "examSubjectNum");
            return (Criteria) this;
        }

        public Criteria andExamSubjectNumBetween(Integer value1, Integer value2) {
            addCriterion("exam_subject_num between", value1, value2, "examSubjectNum");
            return (Criteria) this;
        }

        public Criteria andExamSubjectNumNotBetween(Integer value1, Integer value2) {
            addCriterion("exam_subject_num not between", value1, value2, "examSubjectNum");
            return (Criteria) this;
        }

        public Criteria andExamAllScoreIsNull() {
            addCriterion("exam_all_score is null");
            return (Criteria) this;
        }

        public Criteria andExamAllScoreIsNotNull() {
            addCriterion("exam_all_score is not null");
            return (Criteria) this;
        }

        public Criteria andExamAllScoreEqualTo(Float value) {
            addCriterion("exam_all_score =", value, "examAllScore");
            return (Criteria) this;
        }

        public Criteria andExamAllScoreNotEqualTo(Float value) {
            addCriterion("exam_all_score <>", value, "examAllScore");
            return (Criteria) this;
        }

        public Criteria andExamAllScoreGreaterThan(Float value) {
            addCriterion("exam_all_score >", value, "examAllScore");
            return (Criteria) this;
        }

        public Criteria andExamAllScoreGreaterThanOrEqualTo(Float value) {
            addCriterion("exam_all_score >=", value, "examAllScore");
            return (Criteria) this;
        }

        public Criteria andExamAllScoreLessThan(Float value) {
            addCriterion("exam_all_score <", value, "examAllScore");
            return (Criteria) this;
        }

        public Criteria andExamAllScoreLessThanOrEqualTo(Float value) {
            addCriterion("exam_all_score <=", value, "examAllScore");
            return (Criteria) this;
        }

        public Criteria andExamAllScoreIn(List<Float> values) {
            addCriterion("exam_all_score in", values, "examAllScore");
            return (Criteria) this;
        }

        public Criteria andExamAllScoreNotIn(List<Float> values) {
            addCriterion("exam_all_score not in", values, "examAllScore");
            return (Criteria) this;
        }

        public Criteria andExamAllScoreBetween(Float value1, Float value2) {
            addCriterion("exam_all_score between", value1, value2, "examAllScore");
            return (Criteria) this;
        }

        public Criteria andExamAllScoreNotBetween(Float value1, Float value2) {
            addCriterion("exam_all_score not between", value1, value2, "examAllScore");
            return (Criteria) this;
        }

        public Criteria andIsUseIsNull() {
            addCriterion("is_use is null");
            return (Criteria) this;
        }

        public Criteria andIsUseIsNotNull() {
            addCriterion("is_use is not null");
            return (Criteria) this;
        }

        public Criteria andIsUseEqualTo(Integer value) {
            addCriterion("is_use =", value, "isUse");
            return (Criteria) this;
        }

        public Criteria andIsUseNotEqualTo(Integer value) {
            addCriterion("is_use <>", value, "isUse");
            return (Criteria) this;
        }

        public Criteria andIsUseGreaterThan(Integer value) {
            addCriterion("is_use >", value, "isUse");
            return (Criteria) this;
        }

        public Criteria andIsUseGreaterThanOrEqualTo(Integer value) {
            addCriterion("is_use >=", value, "isUse");
            return (Criteria) this;
        }

        public Criteria andIsUseLessThan(Integer value) {
            addCriterion("is_use <", value, "isUse");
            return (Criteria) this;
        }

        public Criteria andIsUseLessThanOrEqualTo(Integer value) {
            addCriterion("is_use <=", value, "isUse");
            return (Criteria) this;
        }

        public Criteria andIsUseIn(List<Integer> values) {
            addCriterion("is_use in", values, "isUse");
            return (Criteria) this;
        }

        public Criteria andIsUseNotIn(List<Integer> values) {
            addCriterion("is_use not in", values, "isUse");
            return (Criteria) this;
        }

        public Criteria andIsUseBetween(Integer value1, Integer value2) {
            addCriterion("is_use between", value1, value2, "isUse");
            return (Criteria) this;
        }

        public Criteria andIsUseNotBetween(Integer value1, Integer value2) {
            addCriterion("is_use not between", value1, value2, "isUse");
            return (Criteria) this;
        }
    }

    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }
    }

    public static class Criterion {
        private String condition;

        private Object value;

        private Object secondValue;

        private boolean noValue;

        private boolean singleValue;

        private boolean betweenValue;

        private boolean listValue;

        private String typeHandler;

        public String getCondition() {
            return condition;
        }

        public Object getValue() {
            return value;
        }

        public Object getSecondValue() {
            return secondValue;
        }

        public boolean isNoValue() {
            return noValue;
        }

        public boolean isSingleValue() {
            return singleValue;
        }

        public boolean isBetweenValue() {
            return betweenValue;
        }

        public boolean isListValue() {
            return listValue;
        }

        public String getTypeHandler() {
            return typeHandler;
        }

        protected Criterion(String condition) {
            super();
            this.condition = condition;
            this.typeHandler = null;
            this.noValue = true;
        }

        protected Criterion(String condition, Object value, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.typeHandler = typeHandler;
            if (value instanceof List<?>) {
                this.listValue = true;
            } else {
                this.singleValue = true;
            }
        }

        protected Criterion(String condition, Object value) {
            this(condition, value, null);
        }

        protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.secondValue = secondValue;
            this.typeHandler = typeHandler;
            this.betweenValue = true;
        }

        protected Criterion(String condition, Object value, Object secondValue) {
            this(condition, value, secondValue, null);
        }
    }
}