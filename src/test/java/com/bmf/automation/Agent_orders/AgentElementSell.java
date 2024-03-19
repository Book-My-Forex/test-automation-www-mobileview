package com.bmf.automation.Agent_orders;

import org.openqa.selenium.By;

public enum AgentElementSell {
	
	
	SELECT_CITY_LIST (By.xpath("//form[@name='SellForm']//select[@id='cityCode']")),
	FOREX_AMOUNT (By.xpath("//form[@name='SellForm']//input[@id='foreignAmount']")),
	CURRENCY_CODE (By.xpath("//form[@name='SellForm']//select[@name='currencyCode']")),
	PRODUCT_CODE (By.xpath("//form[@name='SellForm']//select[@name='productCode']")),
	LIVE_RATE(By.xpath("//form[@name='SellForm']//span[@class='flash']"));
	
	
	
	

	


	private By by;

	AgentElementSell(By by){
		this.by = by;
	}

	public By get() {
		return by;
	}
}



