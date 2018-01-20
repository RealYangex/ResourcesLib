package com.fengyukeji.resourceslib.bean;

import java.util.ArrayList;
import java.util.List;

public class AdminSetExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public AdminSetExample() {
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

        public Criteria andVisitAuthorityIsNull() {
            addCriterion("visit_authority is null");
            return (Criteria) this;
        }

        public Criteria andVisitAuthorityIsNotNull() {
            addCriterion("visit_authority is not null");
            return (Criteria) this;
        }

        public Criteria andVisitAuthorityEqualTo(Integer value) {
            addCriterion("visit_authority =", value, "visitAuthority");
            return (Criteria) this;
        }

        public Criteria andVisitAuthorityNotEqualTo(Integer value) {
            addCriterion("visit_authority <>", value, "visitAuthority");
            return (Criteria) this;
        }

        public Criteria andVisitAuthorityGreaterThan(Integer value) {
            addCriterion("visit_authority >", value, "visitAuthority");
            return (Criteria) this;
        }

        public Criteria andVisitAuthorityGreaterThanOrEqualTo(Integer value) {
            addCriterion("visit_authority >=", value, "visitAuthority");
            return (Criteria) this;
        }

        public Criteria andVisitAuthorityLessThan(Integer value) {
            addCriterion("visit_authority <", value, "visitAuthority");
            return (Criteria) this;
        }

        public Criteria andVisitAuthorityLessThanOrEqualTo(Integer value) {
            addCriterion("visit_authority <=", value, "visitAuthority");
            return (Criteria) this;
        }

        public Criteria andVisitAuthorityIn(List<Integer> values) {
            addCriterion("visit_authority in", values, "visitAuthority");
            return (Criteria) this;
        }

        public Criteria andVisitAuthorityNotIn(List<Integer> values) {
            addCriterion("visit_authority not in", values, "visitAuthority");
            return (Criteria) this;
        }

        public Criteria andVisitAuthorityBetween(Integer value1, Integer value2) {
            addCriterion("visit_authority between", value1, value2, "visitAuthority");
            return (Criteria) this;
        }

        public Criteria andVisitAuthorityNotBetween(Integer value1, Integer value2) {
            addCriterion("visit_authority not between", value1, value2, "visitAuthority");
            return (Criteria) this;
        }

        public Criteria andMessageRangeIsNull() {
            addCriterion("message_range is null");
            return (Criteria) this;
        }

        public Criteria andMessageRangeIsNotNull() {
            addCriterion("message_range is not null");
            return (Criteria) this;
        }

        public Criteria andMessageRangeEqualTo(Integer value) {
            addCriterion("message_range =", value, "messageRange");
            return (Criteria) this;
        }

        public Criteria andMessageRangeNotEqualTo(Integer value) {
            addCriterion("message_range <>", value, "messageRange");
            return (Criteria) this;
        }

        public Criteria andMessageRangeGreaterThan(Integer value) {
            addCriterion("message_range >", value, "messageRange");
            return (Criteria) this;
        }

        public Criteria andMessageRangeGreaterThanOrEqualTo(Integer value) {
            addCriterion("message_range >=", value, "messageRange");
            return (Criteria) this;
        }

        public Criteria andMessageRangeLessThan(Integer value) {
            addCriterion("message_range <", value, "messageRange");
            return (Criteria) this;
        }

        public Criteria andMessageRangeLessThanOrEqualTo(Integer value) {
            addCriterion("message_range <=", value, "messageRange");
            return (Criteria) this;
        }

        public Criteria andMessageRangeIn(List<Integer> values) {
            addCriterion("message_range in", values, "messageRange");
            return (Criteria) this;
        }

        public Criteria andMessageRangeNotIn(List<Integer> values) {
            addCriterion("message_range not in", values, "messageRange");
            return (Criteria) this;
        }

        public Criteria andMessageRangeBetween(Integer value1, Integer value2) {
            addCriterion("message_range between", value1, value2, "messageRange");
            return (Criteria) this;
        }

        public Criteria andMessageRangeNotBetween(Integer value1, Integer value2) {
            addCriterion("message_range not between", value1, value2, "messageRange");
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

        public Criteria andCanPracticeIsNull() {
            addCriterion("can_practice is null");
            return (Criteria) this;
        }

        public Criteria andCanPracticeIsNotNull() {
            addCriterion("can_practice is not null");
            return (Criteria) this;
        }

        public Criteria andCanPracticeEqualTo(Integer value) {
            addCriterion("can_practice =", value, "canPractice");
            return (Criteria) this;
        }

        public Criteria andCanPracticeNotEqualTo(Integer value) {
            addCriterion("can_practice <>", value, "canPractice");
            return (Criteria) this;
        }

        public Criteria andCanPracticeGreaterThan(Integer value) {
            addCriterion("can_practice >", value, "canPractice");
            return (Criteria) this;
        }

        public Criteria andCanPracticeGreaterThanOrEqualTo(Integer value) {
            addCriterion("can_practice >=", value, "canPractice");
            return (Criteria) this;
        }

        public Criteria andCanPracticeLessThan(Integer value) {
            addCriterion("can_practice <", value, "canPractice");
            return (Criteria) this;
        }

        public Criteria andCanPracticeLessThanOrEqualTo(Integer value) {
            addCriterion("can_practice <=", value, "canPractice");
            return (Criteria) this;
        }

        public Criteria andCanPracticeIn(List<Integer> values) {
            addCriterion("can_practice in", values, "canPractice");
            return (Criteria) this;
        }

        public Criteria andCanPracticeNotIn(List<Integer> values) {
            addCriterion("can_practice not in", values, "canPractice");
            return (Criteria) this;
        }

        public Criteria andCanPracticeBetween(Integer value1, Integer value2) {
            addCriterion("can_practice between", value1, value2, "canPractice");
            return (Criteria) this;
        }

        public Criteria andCanPracticeNotBetween(Integer value1, Integer value2) {
            addCriterion("can_practice not between", value1, value2, "canPractice");
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