package com.test.jsp.dto;

public class DepartInfo {

	private Integer diNo;
	private String diName;
	private String diEtc;

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
		return "DepartInfo [diNo=" + diNo + ", diName=" + diName + ", diEtc=" + diEtc + "]";
	}

	/* Preference - keys - 단축키 설정 */
	/* 객체지향(java) methods, 객체지향기반(javascript) functions */

}
