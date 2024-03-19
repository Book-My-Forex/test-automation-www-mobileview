package com.bmf.automation.unload;

import org.openqa.selenium.By;

public enum ElementUnload {

	SELL_UNLOAD_BANK_NAME(By.xpath("//input[@id='bankName']")),
	SELL_UNLOAD_ACCOUNT_NO(By.xpath("//input[@id='accountNumber']")),
	SELL_UNLOAD_BANK_IFSC(By.xpath("//input[@id='ifscCode']")),
	UNLOAD_ACCOUNT_NO(By.xpath("//input[@id='account_number']")),
	UNLOAD_BANK_IFSC(By.xpath("//input[@id='ifsc_code']")),
	SELL_UNLOAD_BANK_ADD(By.xpath("//input[@id='bankAddress']")),
	SELL_UNLOAD_BEN_NAME(By.xpath("//input[@id='beneficiaryName']")),
	SELL_UNLOAD_SAVE_BUTTON(By.xpath("//*[@id='rtgsForm']//button")),
	DUPLICATE_ORDER_DIALOG(By.xpath("//DIV[@CLASS='modal fade ng-scope in']")), // TO USE

	
	CONFIRM_ORDER(By.xpath("//span[text()='Confirm Order']")),
	SWITCH_TO_UNLOAD(By.xpath("//a[text()='Unload Forex Card']"));

	private By by;

	ElementUnload(By by) {
		this.by = by;
	}

	public By get() {
		return by;
	}

}
