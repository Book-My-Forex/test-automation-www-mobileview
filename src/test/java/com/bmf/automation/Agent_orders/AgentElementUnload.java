package com.bmf.automation.Agent_orders;

import org.openqa.selenium.By;

public enum AgentElementUnload {
	
	
	SELECT_CITY_LIST (By.xpath("//form[@name='unloadForm']//select[@id='cityCode']")),
	CARD_TYPE (By.xpath("//form[@name='unloadForm']//select[@id='card_type_code_un']")),
	FOREX_AMOUNT (By.xpath("//form[@name='unloadForm']//*[@id='foreignAmount']")),
	CURRENCY_CODE (By.xpath("//form[@name='unloadForm']//select[@name='currencyCode']")),
	KIT_NO (By.xpath("//form[@name='unloadForm']//input[@id='pack_ref_no']")),
	LIVE_RATE(By.xpath("//form[@name='unloadForm']//span[@class='flash']"));
	
	
	
	

	


	private By by;

	AgentElementUnload(By by){
		this.by = by;
	}

	public By get() {
		return by;
	}
}



