package com.human.app;

import java.util.ArrayList;

public interface iRoom {
	ArrayList<Roominfo> getRoomList();
	//sql 호출하는 메소드
	ArrayList<Roomtype> getRoomType();
	void doDeleteRoom(int roomcode);
	void doAddRoom(String roomname,String roomtype,int howmany,int howmuch);
	void doUpdateRoom(int roomcode,String roomname,int roomtype, int howmany,int howmuch);
	
}
