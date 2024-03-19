package com.bmf.automation.Agent_orders;

import java.util.List;
import java.util.Map;

import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.Select;

import com.bmf.automation.buy_order.BuyOrderCurrency;
import com.bmf.automation.buy_order.ElementBuy;
import com.bmf.automation.remit_order.ElementRemit;
import com.bmf.automation_commons.BmfTestCommon;

import io.cucumber.datatable.DataTable;
import io.cucumber.java.en.And;


public class AgentOrderRemit extends BmfTestCommon {
	List<Map<String, String>> cucumberDataTable; // The data will be fetch from cucumber feature file

	@And("^User given all below details for remit Orders for Agent$")
	public void fillRemitDetailsAgent(DataTable remitDt) throws Throwable {
		cucumberDataTable = remitDt.asMaps(String.class, String.class);
		String city = cucumberDataTable.get(0).get("city");
		String sendingCountry = cucumberDataTable.get(0).get("sendingCountry");
		product = cucumberDataTable.get(0).get("productType");;
		String fAmount = cucumberDataTable.get(0).get("forexAmount");
		String currency = cucumberDataTable.get(0).get("currency");
		orderType = cucumberDataTable.get(0).get("orderType").toLowerCase();

		try {

			WebElement citySelect = getDriver().findElement(AgentElementRemit.SELECT_CITY_LIST.get());
			Select selectCiy = new Select(citySelect);
			selectCiy.selectByVisibleText(city);

			WebElement currencySelect = getDriver().findElement(AgentElementRemit.SENDING_COUNTRY.get());
			Select selectCurrency = new Select(currencySelect);
			selectCurrency.selectByVisibleText(sendingCountry);
			Thread.sleep(2000);
			WebElement productSelect = fwait
					.until(ExpectedConditions.elementToBeClickable(AgentElementRemit.PRODUCT_TYPE.get()));
			Select selectproduct = new Select(productSelect);
			selectproduct.selectByVisibleText(product);
			
			Select currencyYouWant = new Select(getDriver().findElement(AgentElementRemit.SELECT_CURRENCY.get()));
			currencyYouWant.selectByVisibleText(currency);


			WebElement forexAmount = getDriver().findElement(AgentElementRemit.FOREX_AMOUNT.get());
			forexAmount.sendKeys(fAmount);

			
			WebElement livaRate = getDriver().findElement(AgentElementRemit.LIVE_RATE.get());
			System.out.println(product +" for "+currency+ " added @ " + livaRate.getText());

		} catch (Exception e) {

			System.err.println(e.getMessage());

		}

	}
}
