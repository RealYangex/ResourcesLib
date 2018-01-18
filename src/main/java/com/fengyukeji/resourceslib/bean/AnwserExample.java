package com.fengyukeji.resourceslib.bean;

import java.util.ArrayList;
import java.util.List;

public class AnwserExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public AnwserExample() {
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

        public Criteria andAnwserContentIsNull() {
            addCriterion("anwser_content is null");
            return (Criteria) this;
        }

        public Criteria andAnwserContentIsNotNull() {
            addCriterion("anwser_content is not null");
            return (Criteria) this;
        }

        public Criteria andAnwserContentEqualTo(String value) {
            addCriterion("anwser_content =", value, "anwserContent");
            return (Criteria) this;
        }

        public Criteria andAnwserContentNotEqualTo(String value) {
            addCriterion("anwser_content <>", value, "anwserContent");
            return (Criteria) this;
        }

        public Criteria andAnwserContentGreaterThan(String value) {
            addCriterion("anwser_content >", value, "anwserContent");
            return (Criteria) this;
        }

        public Criteria andAnwserContentGreaterThanOrEqualTo(String value) {
            addCriterion("anwser_content >=", value, "anwserContent");
            return (Criteria) this;
        }

        public Criteria andAnwserContentLessThan(String value) {
            addCriterion("anwser_content <", value, "anwserContent");
            return (Criteria) this;
        }

        public Criteria andAnwserContentLessThanOrEqualTo(String value) {
            addCriterion("anwser_content <=", value, "anwserContent");
            return (Criteria) this;
        }

        public Criteria andAnwserContentLike(String value) {
            addCriterion("anwser_content like", value, "anwserContent");
            return (Criteria) this;
        }

        public Criteria andAnwserContentNotLike(String value) {
            addCriterion("anwser_content not like", value, "anwserContent");
            return (Criteria) this;
        }

        public Criteria andAnwserContentIn(List<String> values) {
            addCriterion("anwser_content in", values, "anwserContent");
            return (Criteria) this;
        }

        public Criteria andAnwserContentNotIn(List<String> values) {
            addCriterion("anwser_content not in", values, "anwserContent");
            return (Criteria) this;
        }

        public Criteria andAnwserContentBetween(String value1, String value2) {
            addCriterion("anwser_content between", value1, value2, "anwserContent");
            return (Criteria) this;
        }

        public Criteria andAnwserContentNotBetween(String value1, String value2) {
            addCriterion("anwser_content not between", value1, value2, "anwserContent");
            return (Criteria) this;
        }

        public Criteria andAnwserDoesIsNull() {
            addCriterion("anwser_does is null");
            return (Criteria) this;
        }

        public Criteria andAnwserDoesIsNotNull() {
            addCriterion("anwser_does is not null");
            return (Criteria) this;
        }

        public Criteria andAnwserDoesEqualTo(Integer value) {
            addCriterion("anwser_does =", value, "anwserDoes");
            return (Criteria) this;
        }

        public Criteria andAnwserDoesNotEqualTo(Integer value) {
            addCriterion("anwser_does <>", value, "anwserDoes");
            return (Criteria) this;
        }

        public Criteria andAnwserDoesGreaterThan(Integer value) {
            addCriterion("anwser_does >", value, "anwserDoes");
            return (Criteria) this;
        }

        public Criteria andAnwserDoesGreaterThanOrEqualTo(Integer value) {
            addCriterion("anwser_does >=", value, "anwserDoes");
            return (Criteria) this;
        }

        public Criteria andAnwserDoesLessThan(Integer value) {
            addCriterion("anwser_does <", value, "anwserDoes");
            return (Criteria) this;
        }

        public Criteria andAnwserDoesLessThanOrEqualTo(Integer value) {
            addCriterion("anwser_does <=", value, "anwserDoes");
            return (Criteria) this;
        }

        public Criteria andAnwserDoesIn(List<Integer> values) {
            addCriterion("anwser_does in", values, "anwserDoes");
            return (Criteria) this;
        }

        public Criteria andAnwserDoesNotIn(List<Integer> values) {
            addCriterion("anwser_does not in", values, "anwserDoes");
            return (Criteria) this;
        }

        public Criteria andAnwserDoesBetween(Integer value1, Integer value2) {
            addCriterion("anwser_does between", value1, value2, "anwserDoes");
            return (Criteria) this;
        }

        public Criteria andAnwserDoesNotBetween(Integer value1, Integer value2) {
            addCriterion("anwser_does not between", value1, value2, "anwserDoes");
            return (Criteria) this;
        }

        public Criteria andIsTrueIsNull() {
            addCriterion("is_true is null");
            return (Criteria) this;
        }

        public Criteria andIsTrueIsNotNull() {
            addCriterion("is_true is not null");
            return (Criteria) this;
        }

        public Criteria andIsTrueEqualTo(Boolean value) {
            addCriterion("is_true =", value, "isTrue");
            return (Criteria) this;
        }

        public Criteria andIsTrueNotEqualTo(Boolean value) {
            addCriterion("is_true <>", value, "isTrue");
            return (Criteria) this;
        }

        public Criteria andIsTrueGreaterThan(Boolean value) {
            addCriterion("is_true >", value, "isTrue");
            return (Criteria) this;
        }

        public Criteria andIsTrueGreaterThanOrEqualTo(Boolean value) {
            addCriterion("is_true >=", value, "isTrue");
            return (Criteria) this;
        }

        public Criteria andIsTrueLessThan(Boolean value) {
            addCriterion("is_true <", value, "isTrue");
            return (Criteria) this;
        }

        public Criteria andIsTrueLessThanOrEqualTo(Boolean value) {
            addCriterion("is_true <=", value, "isTrue");
            return (Criteria) this;
        }

        public Criteria andIsTrueIn(List<Boolean> values) {
            addCriterion("is_true in", values, "isTrue");
            return (Criteria) this;
        }

        public Criteria andIsTrueNotIn(List<Boolean> values) {
            addCriterion("is_true not in", values, "isTrue");
            return (Criteria) this;
        }

        public Criteria andIsTrueBetween(Boolean value1, Boolean value2) {
            addCriterion("is_true between", value1, value2, "isTrue");
            return (Criteria) this;
        }

        public Criteria andIsTrueNotBetween(Boolean value1, Boolean value2) {
            addCriterion("is_true not between", value1, value2, "isTrue");
            return (Criteria) this;
        }

        public Criteria andSubjectIdIsNull() {
            addCriterion("subject_id is null");
            return (Criteria) this;
        }

        public Criteria andSubjectIdIsNotNull() {
            addCriterion("subject_id is not null");
            return (Criteria) this;
        }

        public Criteria andSubjectIdEqualTo(Integer value) {
            addCriterion("subject_id =", value, "subjectId");
            return (Criteria) this;
        }

        public Criteria andSubjectIdNotEqualTo(Integer value) {
            addCriterion("subject_id <>", value, "subjectId");
            return (Criteria) this;
        }

        public Criteria andSubjectIdGreaterThan(Integer value) {
            addCriterion("subject_id >", value, "subjectId");
            return (Criteria) this;
        }

        public Criteria andSubjectIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("subject_id >=", value, "subjectId");
            return (Criteria) this;
        }

        public Criteria andSubjectIdLessThan(Integer value) {
            addCriterion("subject_id <", value, "subjectId");
            return (Criteria) this;
        }

        public Criteria andSubjectIdLessThanOrEqualTo(Integer value) {
            addCriterion("subject_id <=", value, "subjectId");
            return (Criteria) this;
        }

        public Criteria andSubjectIdIn(List<Integer> values) {
            addCriterion("subject_id in", values, "subjectId");
            return (Criteria) this;
        }

        public Criteria andSubjectIdNotIn(List<Integer> values) {
            addCriterion("subject_id not in", values, "subjectId");
            return (Criteria) this;
        }

        public Criteria andSubjectIdBetween(Integer value1, Integer value2) {
            addCriterion("subject_id between", value1, value2, "subjectId");
            return (Criteria) this;
        }

        public Criteria andSubjectIdNotBetween(Integer value1, Integer value2) {
            addCriterion("subject_id not between", value1, value2, "subjectId");
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