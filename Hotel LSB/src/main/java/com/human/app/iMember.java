package com.human.app;

public interface iMember {
	void doSignin(String name, String loginid, String passcode);
	int doCheckUser(String userid, String passcode);
}
