package com.bmf.automation.buy_order;

import org.openqa.selenium.By;

public enum ElementMobileBuy {
		
	M_LOCATION_CLICK (By.xpath("//span[@class='rate-city-description']")),
	M_LOCATION_SELECT (By.xpath("//select[@id='cityCodeDesk']")),
	M_LEFT_MENU(By.xpath("//a[@id='slideToggleleft']")),
	M_CLOSE_MENU (By.xpath("//a[@id='closebtnLeft']")),
	M_LOGIN_COMMON (By.xpath("//a[@class='loginwindow']")),

	
	THANK_YOU_AGENT(By.xpath("//*[@class='order_confir']//p"));

	private By by;

	ElementMobileBuy(By by) {
		this.by = by;
	}

	public By get() {
		return by;
	}
}
