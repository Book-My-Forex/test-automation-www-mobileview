package com.bmf.automation.betterRateRequest;

import org.openqa.selenium.By;

public enum ElementBetterRaterequest {
	BETTER_RATE_DIALOG (By.xpath("//div[@id='callBetterRateRequest']")),
	BETTER_REQUEST_HOME (By.xpath("//button[@class='gredient_bg_blue better_rate_request']")),
	ORDER_TYPE_RADIO(By.xpath("//div[@class='request_better_rate align_radio']/label/span")),
	CURRENCY_SELECT (By.xpath("//select[@id='rateRequest-currencyCode']")),
	PRODUCT_SELECT (By.xpath("//select[@id='rateRequest-productCode']")),
	CITY_SELECT (By.xpath("//select[@id='rateRequest-cityCode']")),
	FOREX_INPUT (By.xpath("//input[@id='rateRequest-foreign_amount']")),
	BETTER_RATE_REQUEST_BTN (By.xpath("//button[@id='callbetterratetag']")),
	BOOK_ORDER_BEST_RATE (By.xpath("//div[@class='bafobannerbtn']/a")),
	
	
	CONTINUE_WITH_CASHBACK (By.xpath("//a[@id='callbetterratetag']"));
	





	private By by;

	ElementBetterRaterequest(By by){
		this.by = by;
	}

	public By get() {
		return by;
	}
}
