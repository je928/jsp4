package com.test.jsp.dto;

public class UserInfo {

	private Integer userNo;
	private String userId;
	private String userPwd;
	private String userName;
	private Integer userAge;
	private String userAddress;
	private Integer diNo;
	private String diName;
	private String diEtc;

	public Integer getUserNo() {
		return userNo;
	}

	public void setUserNo(Integer userNo) {
		this.userNo = userNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserPwd() {
		return userPwd;
	}

	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public Integer getUserAge() {
		return userAge;
	}

	public void setUserAge(Integer userAge) {
		this.userAge = userAge;
	}

	public String getUserAddress() {
		return userAddress;
	}

	public void setUserAddress(String userAddress) {
		this.userAddress = userAddress;
	}

	public Integer getDiNo() {
		return diNo;
	}

	public void setDiNo(Integer diNo) {
		this.diNo = diNo;
	}

	public String getDiName() {
		return diName;
	}

	public void setDiName(String diName) {
		this.diName = diName;
	}

	public String getDiEtc() {
		return diEtc;
	}

	public void setDiEtc(String diEtc) {
		this.diEtc = diEtc;
	}

	@Override
	public String toString() {
		return "UserInfo [userNo=" + userNo + ", userId=" + userId + ", userPwd=" + userPwd + ", userName=" + userName
				+ ", userAge=" + userAge + ", userAddress=" + userAddress + ", diNo=" + diNo + "]";
	}

	/* Preference - keys - 단축키 설정 */
	/* 객체지향(java) methods, 객체지향기반(javascript) functions */

}
