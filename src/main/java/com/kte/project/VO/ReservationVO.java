package com.kte.project.VO;

public class ReservationVO {
	/*
	 * ���� vo
	 * */
	private int reservation_code = 0;		//���� ���̺� �⺻Ű
	private String reservation_date = null;	//��������
	/*
	 * ���� vo
	 * */
	/*
	 * ������� vo
	 * */
	private int reser_code = 0;				//������� �⺻Ű
	private String reser_title = null;		//������� ��(ex) ���� ���, ����Ϸ�, ������, �����Ϸ�, ��� ���)
	private String reser_date=null;			
	/*
	 * ������� vo
	 * */
	
	public int getReservation_code() {
		return reservation_code;
	}
	public void setReservation_code(int reservation_code) {
		this.reservation_code = reservation_code;
	}
	public String getReservation_date() {
		return reservation_date;
	}
	public void setReservation_date(String reservation_date) {
		this.reservation_date = reservation_date;
	}
	public int getReser_code() {
		return reser_code;
	}
	public void setReser_code(int reser_code) {
		this.reser_code = reser_code;
	}
	public String getReser_title() {
		return reser_title;
	}
	public void setReser_title(String reser_title) {
		this.reser_title = reser_title;
	}
	public String getReser_date() {
		return reser_date;
	}
	public void setReser_date(String reser_date) {
		this.reser_date = reser_date;
	}
	

	
	
}	
