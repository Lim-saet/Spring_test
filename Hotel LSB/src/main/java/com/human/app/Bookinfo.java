package com.human.app;

public class Bookinfo {
	private String roomname;
	private int roomtype;
	private int max_howmany;
	private int total;
	private int bookcode;
	private int person;
	private String typename;
	private String checkin;
	private String checkout;
	private String name;
	private String mobile;
	private int roomcode;
	private int howmany;
	private int howmuch;
	private int typecode;
	public Bookinfo() {}
	public Bookinfo(String roomname, int roomtype, int max_howmany, int total, int bookcode, int person,
			String typename, String checkin, String checkout, String name, String mobile, int roomcode, int howmany,
			int howmuch, int typecode) {
		this.roomname = roomname;
		this.roomtype = roomtype;
		this.max_howmany = max_howmany;
		this.total = total;
		this.bookcode = bookcode;
		this.person = person;
		this.typename = typename;
		this.checkin = checkin;
		this.checkout = checkout;
		this.name = name;
		this.mobile = mobile;
		this.roomcode = roomcode;
		this.howmany = howmany;
		this.howmuch = howmuch;
		this.typecode = typecode;
	}
	public String getRoomname() {
		return roomname;
	}
	public void setRoomname(String roomname) {
		this.roomname = roomname;
	}
	public int getRoomtype() {
		return roomtype;
	}
	public void setRoomtype(int roomtype) {
		this.roomtype = roomtype;
	}
	public int getMax_howmany() {
		return max_howmany;
	}
	public void setMax_howmany(int max_howmany) {
		this.max_howmany = max_howmany;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
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
	public String getTypename() {
		return typename;
	}
	public void setTypename(String typename) {
		this.typename = typename;
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
	public int getHowmany() {
		return howmany;
	}
	public void setHowmany(int howmany) {
		this.howmany = howmany;
	}
	public int getHowmuch() {
		return howmuch;
	}
	public void setHowmuch(int howmuch) {
		this.howmuch = howmuch;
	}
	public int getTypecode() {
		return typecode;
	}
	public void setTypecode(int typecode) {
		this.typecode = typecode;
	}
	
	
}
	