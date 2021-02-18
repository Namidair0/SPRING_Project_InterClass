package com.spring.board.domain;

import java.util.Date;

public class ReservationVO {
	
	private int rNum;
	private String mId;
	private int lectureNum;
	private int startDate;
	private Date orderDate;
	private LectureVO lectureVO;
	
	
	public int getrNum() {
		return rNum;
	}
	public void setrNum(int rNum) {
		this.rNum = rNum;
	}
	public int getLectureNum() {
		return lectureNum;
	}
	public void setLectureNum(int lectureNum) {
		this.lectureNum = lectureNum;
	}
	public String getmId() {
		return mId;
	}
	public void setmId(String mId) {
		this.mId = mId;
	}
	public Date getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}
	public int getStartDate() {
		return startDate;
	}
	public void setStartDate(int startDate) {
		this.startDate = startDate;
	}
	
	public LectureVO getLectureVO() {
		return lectureVO;
	}
	public void setLectureVO(LectureVO lectureVO) {
		this.lectureVO = lectureVO;
	}

	@Override
	public String toString() {
		return "ReservationVO [rNum=" + rNum + ", lectureNum=" + lectureNum + ", mId=" + mId + ", orderDate="
				+ orderDate + ", startDate=" + startDate +  "]";
	}
	
	
	
}
