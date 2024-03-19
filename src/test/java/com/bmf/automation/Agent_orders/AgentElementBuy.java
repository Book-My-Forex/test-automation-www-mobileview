package com.bmf.automation.Agent_orders;

import org.openqa.selenium.By;

public enum AgentElementBuy {
	
	
	SELECT_CITY_LIST (By.xpath("//form[@name='buySellForm']//select[@id='cityCode']")),
	SELECT_CURRENCY_TYPE (By.xpath("//form[@name='buySellForm']//select[@name='currencyCode']")),
	FOREX_AMOUNT (By.xpath("//form[@name='buySellForm']//*[@id='foreignAmount']")),
	PRODUCT_TYPE (By.xpath("//form[@name='buySellForm']//select[@name='productCode']")),
	ADD_PRODUCT (By.xpath("//a[text()='Add Product']")),
	LIVE_RATE(By.xpath("//*[@id='buySellForm']//span[@class='flash']")),
	
	//guest login modal
	GUEST_DIALOG( By.xpath("//div[contains(@class,'modal-lg ml0_rate')]")),
	GUEST_FNAME(By.xpath("//div[@class='guest_register_details']//input[@id='first_name']")),
	GUEST_PHONE (By.xpath("//div[@class='guest_register_details']//input[@id='phone']")),
	GUEST_EMAIL (By.xpath("//div[@class='guest_register_details']//input[@id='email']")),
	GUEST_SUBMIT(By.xpath("//button[@class='confirm_box guest_margin_0px']/span")),
	GUEST_OTP (By.xpath("//*[@id='otpForm']/div[1]/div/input")),
	GUEST_OTP_SUBMIT (By.xpath("//*[@id='otpForm']/div[2]/a[1]/span")),
	

	
	BOOK_THIS_ORDER (By.xpath("//a[@class='bto_btn']"));

	private By by;

	AgentElementBuy(By by){
		this.by = by;
	}

	public By get() {
		return by;
	}
}



