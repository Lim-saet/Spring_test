package com.human.app;

public class Bookinfo {
//	private String roomname;
//	private int type
	private int bookcode;
	private int person;
	private String checkin;
	private String checkout;
	private String name;
	private String mobile;
	private int roomcode;
	public Bookinfo() {}
	public Bookinfo(int bookcode, int person, String checkin, String checkout, String name, String mobile,
			int roomcode) {
		this.bookcode = bookcode;
		this.person = person;
		this.checkin = checkin;
		this.checkout = checkout;
		this.name = name;
		this.mobile = mobile;
		this.roomcode = roomcode;
	}
	public int getBookcode() {
		return bookcode;
	}
	public void setBookcode(int bookcode) {
		this.bookcode = bookcode;
	}
	public int getPerson() {
		return person;
	}
	public void setPerson(int person) {
		this.person = person;
	}
	public String getCheckin() {
		return checkin;
	}
	public void setCheckin(String checkin) {
		this.checkin = checkin;
	}
	public String getCheckout() {
		return checkout;
	}
	public void setCheckout(String checkout) {
		this.checkout = checkout;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public int getRoomcode() {
		return roomcode;
	}
	public void setRoomcode(int roomcode) {
		this.roomcode = roomcode;
	}
	
}
