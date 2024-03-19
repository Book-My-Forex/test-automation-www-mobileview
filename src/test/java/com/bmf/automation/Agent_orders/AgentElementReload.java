package com.bmf.automation.Agent_orders;

import org.openqa.selenium.By;

public enum AgentElementReload {
	
	
	SELECT_CITY_LIST (By.xpath("//form[@name='reloadForm']//select[@id='cityCode']")),
	CARD_TYPE (By.xpath("//form[@name='reloadForm']//select[@id='card_type_code']")),
	FOREX_AMOUNT (By.xpath("//form[@name='reloadForm']//*[@id='foreignAmount']")),
	CURRENCY_CODE (By.xpath("//form[@name='reloadForm']//select[@name='currencyCode']")),
	KIT_NO (By.xpath("//form[@name='reloadForm']//input[@id='pack_ref_no']")),
	CARD_INPUT  (By.xpath("//input[@id='cardNumber']")),
	LIVE_RATE(By.xpath("//form[@name='reloadForm']//span[@class='flash']"));
	
	
	
	

	


	private By by;

	AgentElementReload(By by){
		this.by = by;
	}

	public By get() {
		return by;
	}
}



