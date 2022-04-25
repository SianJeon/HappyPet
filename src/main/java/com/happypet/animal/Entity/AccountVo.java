package com.happypet.animal.Entity;

import org.springframework.web.multipart.MultipartFile;

public class AccountVo {
	String  email, zipcode, address, profile, auth, admin;
	MultipartFile attach;
	
	String userId, userPass, userName;
	
	public String getUserPass() {
		return userPass;
	}
	public void setUserPass(String userPass) {
		this.userPass = userPass;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getProfile() {
		return profile;
	}
	public void setProfile(String profile) {
		this.profile = profile;
	}
	public String getAuth() {
		return auth;
	}
	public void setAuth(String auth) {
		this.auth = auth;
	}
	public String getAdmin() {
		return admin;
	}
	public void setAdmin(String admin) {
		this.admin = admin;
	}
	public MultipartFile getAttach() {
		return attach;
	}
	public void setAttach(MultipartFile attach) {
		this.attach = attach;
	}
	@Override
	public String toString() {
		return "AccountVo [email=" + email + ", zipcode=" + zipcode + ", address=" + address + ", profile=" + profile
				+ ", auth=" + auth + ", admin=" + admin + ", attach=" + attach + ", userId=" + userId + ", userPass="
				+ userPass + ", userName=" + userName + "]";
	}
	
}
