package com.hotelsolution.fire.hr.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.hotelsolution.fire.hr.vo.SurveyAnswerVo;
import com.hotelsolution.fire.hr.vo.SurveyDocVo;
import com.hotelsolution.fire.hr.vo.SurveyQuestionVo;
import com.hotelsolution.fire.common.page.vo.PageVo;

public interface SurveyDao {
	
	List<SurveyDocVo> titleList(SqlSessionTemplate sst, PageVo pv, String searchValue);

	int create(SqlSessionTemplate sst, Map<String, Object> map);

	SurveyDocVo getRecentSurveyQnAList(SqlSessionTemplate sst);

	int getSurveyCnt(SqlSessionTemplate sst, String searchValue);

	List<SurveyQuestionVo> geteQuestionList(SqlSessionTemplate sst, String no);

	List<SurveyAnswerVo> answerByOneQuestion(SqlSessionTemplate sst, String no, PageVo answerListPv);

	int getAnswerCnt(SqlSessionTemplate sst, Map<String, String> map2);

	List<SurveyAnswerVo> answerByOneQuestionByUser(SqlSessionTemplate sst, String no, String answerer);

	List<SurveyAnswerVo> getSurveySelectQnaTotalList(SqlSessionTemplate sst, String no);

	List<SurveyDocVo> newTitleList(SqlSessionTemplate sst, PageVo pv, String searchValue, String no);

	List<SurveyQuestionVo> getNewQuestionList(SqlSessionTemplate sst, String no, String no2);

	int write(SqlSessionTemplate sst, Map<String, Object> map);

	int getAnswerCnt2(SqlSessionTemplate sst, Map<String, String> map2);


}
