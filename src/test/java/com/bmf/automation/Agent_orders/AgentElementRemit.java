package com.bmf.automation.Agent_orders;

import org.openqa.selenium.By;

public enum AgentElementRemit {
	
	
	SELECT_CITY_LIST (By.xpath("//form[@name='moneytransferForm']//select[@id='cityCode']")),
	SENDING_COUNTRY (By.xpath("//form[@name='moneytransferForm']//select[@id='currencyCodeMoney']")),
	FOREX_AMOUNT (By.xpath("//form[@name='moneytransferForm']//*[@id='foreignAmount']")),
	PRODUCT_TYPE (By.xpath("//form[@name='moneytransferForm']//select[@name='productCode']")),
	SELECT_CURRENCY (By.xpath("//select[@id='receivingCurrency']")),
	LIVE_RATE(By.xpath("//form[@name='moneytransferForm']//span[@class='flash']"));
	
	
	
	

	


	private By by;

	AgentElementRemit(By by){
		this.by = by;
	}

	public By get() {
		return by;
	}
}



