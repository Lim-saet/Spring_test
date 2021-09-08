package com.human.app;

import java.util.ArrayList;

public interface iBook {
	void doAddBooking(int person,String checkin,String checkout,String name,String mobile,int roomcode,int total);
	ArrayList<Bookinfo> getBookedList(String checkin,String checkout);
	ArrayList<Bookinfo> getBookList(String checkin,String checkout,int typecode);
	void doUpdateBook(int roomcode,String checkin,String checkout,String name,int mobile,int total);
}
