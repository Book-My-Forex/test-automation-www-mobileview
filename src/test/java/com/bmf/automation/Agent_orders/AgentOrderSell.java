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

public class AgentOrderSell extends BmfTestCommon {
	List<Map<String, String>> cucumberDataTable; // The data will be fetch from cucumber feature file

	@And("^User given all below details to sell currency for Agent$")
	public void fillSellDetailsAgent(DataTable sellDt) throws Throwable {

		cucumberDataTable = sellDt.asMaps(String.class, String.class);
		String city = cucumberDataTable.get(0).get("city");
		String currency = cucumberDataTable.get(0).get("currency");
		String fAmount = cucumberDataTable.get(0).get("forexamount");
		product = cucumberDataTable.get(0).get("product");
		orderType = cucumberDataTable.get(0).get("orderType").toLowerCase();

		try {

			fwait.until(ExpectedConditions.invisibilityOfElementLocated(ElementBuy.LOADER.get()));

			WebElement citySelect = getDriver().findElement(AgentElementSell.SELECT_CITY_LIST.get());
			Select selectCiy = new Select(citySelect);
			selectCiy.selectByVisibleText(city);

			WebElement currencyCode = fwait
					.until(ExpectedConditions.elementToBeClickable(AgentElementSell.CURRENCY_CODE.get()));
			Select selectCurrency = new Select(currencyCode);
			selectCurrency.selectByVisibleText(currency);

			WebElement productCode = fwait
					.until(ExpectedConditions.elementToBeClickable(AgentElementSell.PRODUCT_CODE.get()));
			Select selectproductCode = new Select(productCode);
			selectproductCode.selectByVisibleText(product);

			WebElement forexAmount = getDriver().findElement(AgentElementSell.FOREX_AMOUNT.get());
			forexAmount.clear();
			forexAmount.sendKeys(fAmount);

			WebElement livaRate = getDriver().findElement(AgentElementSell.LIVE_RATE.get());
			System.out.println(currency + " added @ " + livaRate.getText());

		} catch (Exception e) {

			System.out.println("Something went wrong,Retrying...");

		}

	}
}
