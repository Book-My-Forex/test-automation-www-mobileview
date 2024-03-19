package com.bmf.automation.Agent_orders;

import java.util.List;
import java.util.Map;

import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.Select;

import com.bmf.automation.buy_order.BuyOrderCurrency;
import com.bmf.automation.buy_order.ElementBuy;

import com.bmf.automation_commons.BmfTestCommon;

import io.cucumber.datatable.DataTable;
import io.cucumber.java.en.And;

public class AgentOrderReload extends BmfTestCommon {
	List<Map<String, String>> cucumberDataTable; // The data will be fetch from cucumber feature file

	@And("^User given all below details for Reload Orders for Agent$")
	public void fillReloadDetailsAgent(DataTable reloadDt) throws Throwable {
	
		cucumberDataTable = reloadDt.asMaps(String.class, String.class);
		String city = cucumberDataTable.get(0).get("city");
		String cardType = cucumberDataTable.get(0).get("cardtype");
		String currency = cucumberDataTable.get(0).get("currencytype");
		String fAmount = cucumberDataTable.get(0).get("forexamount");
		String kitNumber = cucumberDataTable.get(0).get("kitnumber");
		String cardNum = cucumberDataTable.get(0).get("cardNumber");
		orderType = cucumberDataTable.get(0).get("orderType").toLowerCase();
		if (orderType.contains("reload"))
			product = "forex card"; // to use in some test method

		try {
		

			fwait.until(ExpectedConditions.invisibilityOfElementLocated(ElementBuy.LOADER.get()));

			WebElement citySelect = getDriver().findElement(AgentElementReload.SELECT_CITY_LIST.get());
			Select selectCiy = new Select(citySelect);
			selectCiy.selectByVisibleText(city);

			WebElement cType = getDriver().findElement(AgentElementReload.CARD_TYPE.get());
			Select selectCardType = new Select(cType);
			selectCardType.selectByVisibleText(cardType);
			if (cardType.contains("BookMyForex")) {
				WebElement kitInput = getDriver().findElement(AgentElementReload.KIT_NO.get());
				kitInput.clear();
				kitInput.sendKeys(kitNumber);

			} else {
				WebElement cardNumber = getDriver().findElement(AgentElementReload.CARD_INPUT.get());
				cardNumber.clear();
				cardNumber.sendKeys(cardNum);
			}
			WebElement currencyCode = fwait
					.until(ExpectedConditions.elementToBeClickable(AgentElementReload.CURRENCY_CODE.get()));
			Select selectCurrency = new Select(currencyCode);
			selectCurrency.selectByVisibleText(currency);

			WebElement forexAmount = getDriver().findElement(AgentElementReload.FOREX_AMOUNT.get());
			forexAmount.clear();
			forexAmount.sendKeys(fAmount);

			WebElement livaRate = getDriver().findElement(AgentElementReload.LIVE_RATE.get());
			System.out.println(currency + " added @ " + livaRate.getText());

		} catch (Exception e) {

			System.out.println("Something went wrong,Retrying...");

		}

	}
}
