package com.hotelsolution.fire.common.schedule.vo;

import lombok.Data;

@Data
public class ScheduleVo {
	private String content;
	private String no;
	private String userNo;
	private String title;
	private String startDate;
	private String endDate;
	private String scheduleTypeNo;
	//추가
	private String writerName;
	private String writerImage;
	private String typeName;
	
}
