package com.bmf.automation.Guest_login;

import org.openqa.selenium.By;

public enum ElementGuestLogin {
	GUEST_LOGIN_DIALOG (By.xpath("//div[@class='modal fade in']")),
	GUEST_NAME (By.xpath("//input[@id='singlecallnonregisterfirst_name']")),
	GUEST_EMAIL_EDIT (By.xpath("//a[@class='bookthisorderemial']")),
	GUEST_EMAIL (By.xpath("//input[@id='singlecallemail']")),	
	GUEST_PHONE (By.xpath("//input[@id='singlecallphone']")),
	MOBILE_OTP_RADIO (By.xpath("//label[@for='singlecallmobilenonregisterradio']")),
	OTP_TIMER (By.xpath("//div[@class='form-group resedtxt']/span")),
	GUEST_OTP_TEXT (By.xpath("//input[@id='singlecallnonregisterotptext']")),
	SUBMIT_BTN (By.xpath("//button[@id='callsinglephonesubmittag']")),
	CONFIRM_OTP (By.xpath("//button[@id='callsinglepwassbuttonconfirmnonregister']"));
	private By by;

	ElementGuestLogin(By by){
		this.by = by;
	}

	public By get() {
		return by;
	}

}
