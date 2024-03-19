package com.bmf.automation.home_login;

import org.openqa.selenium.By;

public enum ElementHome {
	CLOSE_HOME_STIKCY (By.xpath("//a[@class='closeStikey']")),
	RESPONSE_LOGIN (By.xpath("//div[@class='responseFlag']")),
	LOGIN_BTN (By.xpath("//a[@id='loginBtn']")),
	COMMON_LOGINWINDO (By.xpath("//li[@class='loginwindow']")),
	MY_AC_NAV_MENU (By.xpath("//a[@class='nav-link nav-toggle']")),
	REFERRAL_BTN (By.xpath("//a[@href='#share-referral-code']")),
	REF_CODE (By.xpath("//div[@id='RefCode']")),
	REF_LINK (By.xpath("//div[@id='RefLink']")),
	MY_AC_IMG (By.xpath("//img[@class='img-responsive img_center']")),
	CMS_LOGIN (By.xpath("//li[@class='loginwindow'][1]/a")),
	CMS_LOGOUT (By.xpath("//li[@class='loginwindow'][2]/a")),
	REGISTER_BTN (By.xpath("//ul[contains(@class,'navbar-right custop_navbar')]/li[5]/a")),
	REG_MOBILE_OTP_INP (By.xpath("//input[@id='registerotpMobile']")),
	REG_OTP_PHONE (By.xpath("//label[@for='registerotpMobile']")),
	REG_OTP_EMAIL (By.xpath("//label[@for='registerotpEmail']")),
	REG_EMAIL_OTP_INP (By.xpath("//input[@id='registerotpEmail']")),
	LOGIN_DIALOG (By.id("loginsectiondetail")),
	LOGOUT_BTN (By.xpath("//li[@class='loginwindow'][2]/a")),
	EMAIL_PHONE(By.xpath("//input[@id='email_phone']")),
	REG_DIALOG (By.xpath("//div[@id='loginsectiondetail']")),
	REG_EMAIL (By.xpath("//input[@id='registeremail']")),
	REG_PHONE (By.xpath("//input[@id='registerphone']")),
	REG_PSWD (By.xpath("//input[@id='registerpassword']")),
	REG_Re_PSWD (By.xpath("//input[@id='registercpassword']")),
	REG_SUBMIT (By.xpath("//button[@id='registersubmittag']")),
	REG_OTP_INPUT (By.xpath("//input[@id='registerotptext']")),
	REG_OTP_SUBMIT (By.xpath("//button[@id='registesumitotp']")),
	REG_INTIMATION_DIALOG (By.xpath("//div[@id='intimationModal']")),
	INTIMATION_DIALOG (By.xpath("//div[@id='intimationModal']")),
	BTN_LOGIN_NOW (By.xpath("//button[@class='btn btn-primary']")),
	REG_NAME (By.xpath("//input[@id='registerfirst_name']")),
	PASSWORD (By.xpath("//input[@id='loginpassword']")),
	PHONE (By.id("phoneLogin")),
	SUBMIT_CREDENTILAS (By.id("loginsubmittag")),
	BAD_GATEWAY (By.xpath("//h1[@class='inline-block sm:block sm:mb-2 font-light text-60 lg:text-4xl text-black-dark leading-tight mr-2']")),
	SESSION_EXPIRED (By.xpath("//h1[@class='errorh1']"));
	

	private By by;
	
	ElementHome(By by){
		this.by = by;
	}
	
	public By get() {
		return by;
	}
}
