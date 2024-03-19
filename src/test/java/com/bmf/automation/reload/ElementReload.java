package com.bmf.automation.reload;

import org.openqa.selenium.By;

public enum ElementReload {
	SWITCH_UNLOAD_RELOAD (By.xpath("//a[contains(@class,'unloadforexcard_btn')]")),
	M_SWITCH_RELOAD (By.xpath("//a[@class='cardReloadclickhref']")),
	M_RATE_RELOAD_UNLOAD (By.xpath("//span[contains(@class,'showrate')]")),
	M_UNLOAD_INPUT (By.xpath("//input[@type='radio'][@id='test2']")),
	M_SWITCH_TO_UNLOAD (By.xpath("//label[@for='test2']")),
	FULL_UNLOAD(By.xpath("//a[contains(@class,'unactive_button encash_entire_btn')]")),
	SELECT_CARD_TYPE (By.xpath("//select[@id='reloadunload-cardType']")),
	SELECT_CARD_KIT (By.xpath("//input[@id='reloadunload-packRefNo']")),
	CARD_INPUT (By.xpath("//input[@id='reloadunload-cardNumber']")),
	ADD_PRODUCT (By.xpath("//div[@class='reload_unload_box  allformdiv']//a[@class='add_product anchorbtn']")),
	//RATE (By.xpath("//div[@class='reloadforexcard']//span[@class='showrate flash']/span")),
	FOREX_AMOUNT (By.xpath("//input[@id='reloadunload-foreignAmount']")), 
	REALOD_UNLOAD_ORDER (By.xpath("//a[@id='lusellatag']")),
	PLEASE_WAIT_BTN (By.xpath("//a[@class='bto_btn pleasewait']")),
	TRIP_TYPE (By.xpath("//div[@class='col-xs-12 col-md-6 col-sm-6']//span//span")),
	ALL_DOC_UPLOADER (By.xpath("//div[@class='document__area--heading']")),	
	INPUT_ICONFIRM_CHECKBOX (By.xpath("//input[@id='is_declaration_confirmed']")),
	ICONFIRM_CHECK (By.xpath("//span[@class='remember_txt confirm_txt eligibility-confirmation-text ng-scope']")),

//	I_CONFIRM_CHECKED (By.xpath("//input[contains(@class, 'ng-touched ng-valid ng-valid-required')]")),
	TRAVEL_COUNTRY (By.xpath("//select[@id='countries']")),
	TRAVEL_START_INPUT (By.xpath("//input[@id='travel_date']")),
	RETURN_DATE (By.xpath("//input[@id='return_date']")),
	KIT_NO_TEXT_BOX (By.xpath("//input[@name='pack_ref_no']")),
	SELECT_CITY (By.xpath("//select[@id='reloadunload-cityCode']")),
	SELECT_CURRENCY (By.xpath("//select[@id='reloadunload-currencyCode']")),
	
	//DUPLICATE ORDER CHECK
	DUPLICATE_ORDER_DIALOG (By.xpath("//div[@class='modal fade ng-scope in']")),
	DUPLICATE_ORDER_CREATE (By.xpath("//button[text()='Yes I want to create a duplicate order']")),
	

	DISCREAPANCY_DIALOG (By.xpath("//div[@id='existingUserDetailsFound']")),
	DISCREPANCY_MODAL (By.xpath("//div[@class='modal fade discrepancy_detected in']//h4")),
	COUNTINUE_WITH (By.xpath("//a[@class='btn continueChanges']")),
	RESTART_ORDER (By.xpath("//div[contains(@class,'discrepancy_detected in')]//a[@class='btn btn-warning']"));
	


	
	private By by;
	
	ElementReload(By by){
		this.by = by;
	}
	
	public By get() {
		return by;
	}
}


