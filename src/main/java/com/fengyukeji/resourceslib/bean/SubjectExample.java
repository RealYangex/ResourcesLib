package com.fengyukeji.resourceslib.bean;

import java.util.ArrayList;
import java.util.List;

public class SubjectExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public SubjectExample() {
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

        public Criteria andSubjectContentIsNull() {
            addCriterion("subject_content is null");
            return (Criteria) this;
        }

        public Criteria andSubjectContentIsNotNull() {
            addCriterion("subject_content is not null");
            return (Criteria) this;
        }

        public Criteria andSubjectContentEqualTo(String value) {
            addCriterion("subject_content =", value, "subjectContent");
            return (Criteria) this;
        }

        public Criteria andSubjectContentNotEqualTo(String value) {
            addCriterion("subject_content <>", value, "subjectContent");
            return (Criteria) this;
        }

        public Criteria andSubjectContentGreaterThan(String value) {
            addCriterion("subject_content >", value, "subjectContent");
            return (Criteria) this;
        }

        public Criteria andSubjectContentGreaterThanOrEqualTo(String value) {
            addCriterion("subject_content >=", value, "subjectContent");
            return (Criteria) this;
        }

        public Criteria andSubjectContentLessThan(String value) {
            addCriterion("subject_content <", value, "subjectContent");
            return (Criteria) this;
        }

        public Criteria andSubjectContentLessThanOrEqualTo(String value) {
            addCriterion("subject_content <=", value, "subjectContent");
            return (Criteria) this;
        }

        public Criteria andSubjectContentLike(String value) {
            addCriterion("subject_content like", value, "subjectContent");
            return (Criteria) this;
        }

        public Criteria andSubjectContentNotLike(String value) {
            addCriterion("subject_content not like", value, "subjectContent");
            return (Criteria) this;
        }

        public Criteria andSubjectContentIn(List<String> values) {
            addCriterion("subject_content in", values, "subjectContent");
            return (Criteria) this;
        }

        public Criteria andSubjectContentNotIn(List<String> values) {
            addCriterion("subject_content not in", values, "subjectContent");
            return (Criteria) this;
        }

        public Criteria andSubjectContentBetween(String value1, String value2) {
            addCriterion("subject_content between", value1, value2, "subjectContent");
            return (Criteria) this;
        }

        public Criteria andSubjectContentNotBetween(String value1, String value2) {
            addCriterion("subject_content not between", value1, value2, "subjectContent");
            return (Criteria) this;
        }

        public Criteria andSubjectTypeIsNull() {
            addCriterion("subject_type is null");
            return (Criteria) this;
        }

        public Criteria andSubjectTypeIsNotNull() {
            addCriterion("subject_type is not null");
            return (Criteria) this;
        }

        public Criteria andSubjectTypeEqualTo(Integer value) {
            addCriterion("subject_type =", value, "subjectType");
            return (Criteria) this;
        }

        public Criteria andSubjectTypeNotEqualTo(Integer value) {
            addCriterion("subject_type <>", value, "subjectType");
            return (Criteria) this;
        }

        public Criteria andSubjectTypeGreaterThan(Integer value) {
            addCriterion("subject_type >", value, "subjectType");
            return (Criteria) this;
        }

        public Criteria andSubjectTypeGreaterThanOrEqualTo(Integer value) {
            addCriterion("subject_type >=", value, "subjectType");
            return (Criteria) this;
        }

        public Criteria andSubjectTypeLessThan(Integer value) {
            addCriterion("subject_type <", value, "subjectType");
            return (Criteria) this;
        }

        public Criteria andSubjectTypeLessThanOrEqualTo(Integer value) {
            addCriterion("subject_type <=", value, "subjectType");
            return (Criteria) this;
        }

        public Criteria andSubjectTypeIn(List<Integer> values) {
            addCriterion("subject_type in", values, "subjectType");
            return (Criteria) this;
        }

        public Criteria andSubjectTypeNotIn(List<Integer> values) {
            addCriterion("subject_type not in", values, "subjectType");
            return (Criteria) this;
        }

        public Criteria andSubjectTypeBetween(Integer value1, Integer value2) {
            addCriterion("subject_type between", value1, value2, "subjectType");
            return (Criteria) this;
        }

        public Criteria andSubjectTypeNotBetween(Integer value1, Integer value2) {
            addCriterion("subject_type not between", value1, value2, "subjectType");
            return (Criteria) this;
        }

        public Criteria andSubjectDoesIsNull() {
            addCriterion("subject_does is null");
            return (Criteria) this;
        }

        public Criteria andSubjectDoesIsNotNull() {
            addCriterion("subject_does is not null");
            return (Criteria) this;
        }

        public Criteria andSubjectDoesEqualTo(Integer value) {
            addCriterion("subject_does =", value, "subjectDoes");
            return (Criteria) this;
        }

        public Criteria andSubjectDoesNotEqualTo(Integer value) {
            addCriterion("subject_does <>", value, "subjectDoes");
            return (Criteria) this;
        }

        public Criteria andSubjectDoesGreaterThan(Integer value) {
            addCriterion("subject_does >", value, "subjectDoes");
            return (Criteria) this;
        }

        public Criteria andSubjectDoesGreaterThanOrEqualTo(Integer value) {
            addCriterion("subject_does >=", value, "subjectDoes");
            return (Criteria) this;
        }

        public Criteria andSubjectDoesLessThan(Integer value) {
            addCriterion("subject_does <", value, "subjectDoes");
            return (Criteria) this;
        }

        public Criteria andSubjectDoesLessThanOrEqualTo(Integer value) {
            addCriterion("subject_does <=", value, "subjectDoes");
            return (Criteria) this;
        }

        public Criteria andSubjectDoesIn(List<Integer> values) {
            addCriterion("subject_does in", values, "subjectDoes");
            return (Criteria) this;
        }

        public Criteria andSubjectDoesNotIn(List<Integer> values) {
            addCriterion("subject_does not in", values, "subjectDoes");
            return (Criteria) this;
        }

        public Criteria andSubjectDoesBetween(Integer value1, Integer value2) {
            addCriterion("subject_does between", value1, value2, "subjectDoes");
            return (Criteria) this;
        }

        public Criteria andSubjectDoesNotBetween(Integer value1, Integer value2) {
            addCriterion("subject_does not between", value1, value2, "subjectDoes");
            return (Criteria) this;
        }

        public Criteria andSubjectSuccessesIsNull() {
            addCriterion("subject_successes is null");
            return (Criteria) this;
        }

        public Criteria andSubjectSuccessesIsNotNull() {
            addCriterion("subject_successes is not null");
            return (Criteria) this;
        }

        public Criteria andSubjectSuccessesEqualTo(Integer value) {
            addCriterion("subject_successes =", value, "subjectSuccesses");
            return (Criteria) this;
        }

        public Criteria andSubjectSuccessesNotEqualTo(Integer value) {
            addCriterion("subject_successes <>", value, "subjectSuccesses");
            return (Criteria) this;
        }

        public Criteria andSubjectSuccessesGreaterThan(Integer value) {
            addCriterion("subject_successes >", value, "subjectSuccesses");
            return (Criteria) this;
        }

        public Criteria andSubjectSuccessesGreaterThanOrEqualTo(Integer value) {
            addCriterion("subject_successes >=", value, "subjectSuccesses");
            return (Criteria) this;
        }

        public Criteria andSubjectSuccessesLessThan(Integer value) {
            addCriterion("subject_successes <", value, "subjectSuccesses");
            return (Criteria) this;
        }

        public Criteria andSubjectSuccessesLessThanOrEqualTo(Integer value) {
            addCriterion("subject_successes <=", value, "subjectSuccesses");
            return (Criteria) this;
        }

        public Criteria andSubjectSuccessesIn(List<Integer> values) {
            addCriterion("subject_successes in", values, "subjectSuccesses");
            return (Criteria) this;
        }

        public Criteria andSubjectSuccessesNotIn(List<Integer> values) {
            addCriterion("subject_successes not in", values, "subjectSuccesses");
            return (Criteria) this;
        }

        public Criteria andSubjectSuccessesBetween(Integer value1, Integer value2) {
            addCriterion("subject_successes between", value1, value2, "subjectSuccesses");
            return (Criteria) this;
        }

        public Criteria andSubjectSuccessesNotBetween(Integer value1, Integer value2) {
            addCriterion("subject_successes not between", value1, value2, "subjectSuccesses");
            return (Criteria) this;
        }

        public Criteria andSubjectErrorIsNull() {
            addCriterion("subject_error is null");
            return (Criteria) this;
        }

        public Criteria andSubjectErrorIsNotNull() {
            addCriterion("subject_error is not null");
            return (Criteria) this;
        }

        public Criteria andSubjectErrorEqualTo(Integer value) {
            addCriterion("subject_error =", value, "subjectError");
            return (Criteria) this;
        }

        public Criteria andSubjectErrorNotEqualTo(Integer value) {
            addCriterion("subject_error <>", value, "subjectError");
            return (Criteria) this;
        }

        public Criteria andSubjectErrorGreaterThan(Integer value) {
            addCriterion("subject_error >", value, "subjectError");
            return (Criteria) this;
        }

        public Criteria andSubjectErrorGreaterThanOrEqualTo(Integer value) {
            addCriterion("subject_error >=", value, "subjectError");
            return (Criteria) this;
        }

        public Criteria andSubjectErrorLessThan(Integer value) {
            addCriterion("subject_error <", value, "subjectError");
            return (Criteria) this;
        }

        public Criteria andSubjectErrorLessThanOrEqualTo(Integer value) {
            addCriterion("subject_error <=", value, "subjectError");
            return (Criteria) this;
        }

        public Criteria andSubjectErrorIn(List<Integer> values) {
            addCriterion("subject_error in", values, "subjectError");
            return (Criteria) this;
        }

        public Criteria andSubjectErrorNotIn(List<Integer> values) {
            addCriterion("subject_error not in", values, "subjectError");
            return (Criteria) this;
        }

        public Criteria andSubjectErrorBetween(Integer value1, Integer value2) {
            addCriterion("subject_error between", value1, value2, "subjectError");
            return (Criteria) this;
        }

        public Criteria andSubjectErrorNotBetween(Integer value1, Integer value2) {
            addCriterion("subject_error not between", value1, value2, "subjectError");
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