package com.bmf.automation.sell;

import org.openqa.selenium.By;

public enum ElementSell {

	MODAL_TEXT(By.xpath("//ol[@class='cunfirmprossession']/li")),
	NO_CDF (By.xpath("//button[@class='btn btn-secondary mobile_mr_t20 modelclosebtn']")),
	CDF_DIALOG (By.xpath("//div[@class='modal fade ng-scope in']")),
	HAVE_CDF_MODAL(By.xpath("//button[@class='btn btn-primary requestmodelbtn mobile_mr_t20']")),
	CURRENCY_TYPE(By.xpath("//select[contains(@id,'buysell-currencyCode-new')]")),
	CMS_CURRENCY_TYPE(By.xpath("//select[@id='buysell-currencyCode']")),
	CUST_CONTINUE(By.xpath("//button[@class='confirm_box confirm_po01 sender_btn pull-right customerContinue']")),
	M_SELL_INPUT (By.xpath("//input[@type='radio'][@id='text02']")),
	
	M_SWITCH_TO_SELL (By.xpath("//label[@for='text02']")),
	SWITCH_TO_SELL(By.xpath("//a[@class='sellclickhref']"));
	

	private By by;

	ElementSell(By by) {
		this.by = by;
	}

	public By get() {
		return by;
	}

}
