package com.session;

import java.util.ArrayList;
import java.util.List;

public class UserRepository {
	
	//DB가정
	private static List<User> userList = new ArrayList<>();

	

	public static void setUser(User user) {
		userList.add(user);
		
	}
	
//	2. 로그인을 시도하는 회원의 모든 정보를 얻어오세요. (getUser() 만들어 주세요.)
// 	getUser() -> 아이디를 전달받아 해당 아이디와 일치하는 객체가 있는지
// 	확인 후, 있다면 그 객체를 리턴. (UserRepository 클래스에 메서드를 선언하세요.)
// 	일치하는 객체가 없다면 null을 리턴.
	
	public static User getUser(String id) {
	
		for (int i = 0; i< userList.size();i++) {
			if(userList.get(i).getId().equals(id)) {
				return userList.get(i);
			}
		}
		return null;
	}
	/*
	 * 회원탈퇴는 deleteUser(???)라는 이름으로 메서드 선언.
	 * 
	 * 리스트에서 해당 아이디에 부합하는 User객체를 찾은 후 
	 * 리스트 문법으로 해당 객체의 주소값을 지워주시면 됩니다. 
	 * 그리고 세션 데이터도 삭제해 주세요.
	 */
	public static void deleteUser(String id) {
		for(int i = 0; i < userList.size();i++) {
			if(userList.get(i).getId().equals(id)) {
				userList.remove(i);
			}
		}
	}

	public static void delUser(String id) {
		userList.remove(getUser(id));
	}
	
	
}
