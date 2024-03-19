package com.bmf.automation.remit_order;

import org.openqa.selenium.By;

public enum ElementRemit {
// Element to find Remit details
	SWITCH_REMIT (By.xpath("//a[@class='moneytransfer_btn moneyclickhref commonactive']")),
	M_SWITCH_REMIT (By.xpath("//a[@class='moneyclickhref']")),
	SELECT_CITY (By.xpath("//select[@id='moneytransfer-cityCode']")),
	SELECT_COUNTRY (By.xpath("//select[@id='moneytransfer-toCountry']")),
	SELECT_PRODUCT (By.xpath("//select[@id='moneytransfer-productCode']")),
	FOREX_AMOUNT (By.xpath("//input[@id='moneytransfer-foreignAmount']")),
	SELECT_CURRENCY (By.xpath("//select[@id='moneytransfer-currencyCode']")),

	M_LIVE_RATE (By.xpath("//a[@class='moneyclickhref']")),
	LIVE_RATE (By.xpath("//*[@id='moneytransferForm']//span[contains(@class,'ratedata')]")),
	SKIP_AADHAR (By.xpath("//a[@class='proceedbtn']")),

	BOOK_THIS_ORDER (By.xpath("//div//a[@id='moneytransfertag']")),
//	validation
	ERROR_MESSAGE (By.xpath("//span[@class='red-txt  by_mt_30 ng-binding ng-scope']")),

//	PromoCode
	PROMO_CODE (By.xpath("//input[@id='promoCode']")),
	APPLY_BTN (By.xpath("//*[@class='applyBnt']")),
	PROMO_CODE_APPLIED (By.xpath("//span[@class='promocode_app']")),
	
	
	//SENDER DETAILS
	PAN_EDIT(By.xpath("//div[@class='remitter_pan_aadhar ng-scope']//a[@class='panedit_class ng-scope']")),
	PAN_INPUT (By.xpath("//div[@class='remitter_pan_aadhar ng-scope']//input[@name='pan']")),
	DOB_SENDER (By.xpath("//input[@id='date_of_birth']")),
	DOB_YEAR (By.xpath("//select[@class='ui-datepicker-year']")),
	DOB_DATE (By.xpath("//td//a[@class='ui-state-default']")),
	STREET_ADD (By.xpath("//input[@name='Street_Address']")),
	PIN_CODE (By.xpath("//input[@name='Pin_Code']")),
	CITY (By.xpath("//select[@name='cityCode']")),
	STAE (By.xpath("//select[@name='stateCode']")),
	SENDER_CONTINUE (By.xpath("//button[contains(@class ,'sender_btn')]")),

	//beneficiary section
	ADD_NEW_BEN (By.xpath("//a[@class='circle_box']")),
	BENEFICIRY_NAME (By.id("beneficiaryName")),
	BENE_SELF_INPUT (By.xpath("//input[@id='notselftransf']")),
	BENEFICIARY_DECLARATION (By.xpath("//div[@class='col-xs-12 checkbox']//label")),
	BENEFICIARY_ADDRESS (By.id("beneficiaryAddress")),
	BENEFICIARY_ACC (By.id("beneficiaryBankAccountNumber")),
	BEN_RELATIONSHIP (By.xpath("//select[@id='beneRelationshipCode']")),
	
	
	BENEFICIARY_IBAN (By.id("iban")),
	BENEFICIARY_ROUTING (By.id("beneficiaryRoutingNumber")),
	BENEFICIARY_SWIFT (By.id("swiftBcCode")),
	BENEFICIARY_BSB_CODE (By.id("beneficiaryBSBCode")),
	BENEFICIARY_NOSTRO (By.xpath("//div[contains(@id,'my_tooltip')]//select")),
	

//	Purpose
	INPUT_SENDER_DEC (By.xpath("//input[@id='declarations_accept']")),
	SENDER_DECLARATION (By.xpath("//div[@class='checkbox sender_details']//span[2]")),
	INPUT_TRANSFERFOREIGN (By.xpath("//input[@id='declarations_no_tfr_to_foreign_citizen']")),
	TRANSFERFOREIGN (By.xpath("//div[@class='checkbox sender_details ng-scope']//span[2]")),
	CONTINUE (By.xpath("//div[contains(@class,'show-beneficiary-detail-continue')]/button")),
	CHANGE_PHONE_DIALOG (By.xpath("//div[@id='change_number_modal']")),
	PHONE_NUMBER_LINK (By.xpath("//a[@class='btn change_number']")),
	PHONE_NUMBER_CHANGE(By.xpath("//input[@id='phone']")),
	CHANGE_NUMBER_CONFIRM (By.xpath("//div[@class='col-xs-12 text-center mt-3']/a")),
	OTP_MDL_DIALOG (By.xpath("//div[@id='mi_modal']")),
	OTP_TEXT_BOX (By.xpath("//input[@id='otp_text']")),
	OTP_SUBMIT (By.id("otp_submit")),
	TIMER_SHOW (By.xpath("//div[@class='resend_otp hide show']"));



	
	private By by;
	
	ElementRemit(By by){
		this.by = by;
	}
	
	public By get() {
		return by;
	}
}
