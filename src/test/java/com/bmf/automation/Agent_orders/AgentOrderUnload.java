package com.bmf.automation.Agent_orders;

import java.util.List;
import java.util.Map;

import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.Select;

import com.bmf.automation.buy_order.BuyOrderCurrency;
import com.bmf.automation.buy_order.ElementBuy;
import com.bmf.automation.home_login.LoginFunction;
import com.bmf.automation.unload.ElementUnload;
import com.bmf.automation_commons.BmfTestCommon;

import io.cucumber.datatable.DataTable;
import io.cucumber.java.en.And;

public class AgentOrderUnload extends BmfTestCommon {
	List<Map<String, String>> cucumberDataTable; // The data will be fetch from cucumber feature file

	@And("^User given all below details for Unload Orders for Agent$")
	public void fillReloadDetailsAgent(DataTable reloadDt) throws Throwable {

		cucumberDataTable = reloadDt.asMaps(String.class, String.class);
		String city = cucumberDataTable.get(0).get("city");
		String cardType = cucumberDataTable.get(0).get("cardtype");
		String currency = cucumberDataTable.get(0).get("currencytype");
		String fAmount = cucumberDataTable.get(0).get("forexamount");
		String kitNumber = cucumberDataTable.get(0).get("kitnumber");
		orderType = cucumberDataTable.get(0).get("orderType").toLowerCase();

		if (LoginFunction.pageloaded == true) {
			try {

				if (orderType.contains("unload")) {
					for (int i = 0; i <= 3; i++) {
						WebElement unload = getDriver().findElement(ElementUnload.SWITCH_TO_UNLOAD.get());
						if (unload.isDisplayed() && unload.getText().toLowerCase().contains("unload")) {
							unload.click();
							Thread.sleep(3000);
							break;

						} else if (i == 2) {
							System.err.println("Switching to Unload,Retrying..");
							Thread.sleep(1500);
						}

					}

				}
				fwait.until(ExpectedConditions.invisibilityOfElementLocated(ElementBuy.LOADER.get()));

				WebElement citySelect = getDriver().findElement(AgentElementUnload.SELECT_CITY_LIST.get());
				Select selectCiy = new Select(citySelect);
				selectCiy.selectByVisibleText(city);

				WebElement cType = getDriver().findElement(AgentElementUnload.CARD_TYPE.get());
				Select selectCardType = new Select(cType);
				selectCardType.selectByVisibleText(cardType);

				WebElement kitInput = getDriver().findElement(AgentElementUnload.KIT_NO.get());
				kitInput.clear();
				kitInput.sendKeys(kitNumber);

				WebElement currencyCode = fwait
						.until(ExpectedConditions.elementToBeClickable(AgentElementUnload.CURRENCY_CODE.get()));
				Select selectCurrency = new Select(currencyCode);
				selectCurrency.selectByVisibleText(currency);

				WebElement forexAmount = getDriver().findElement(AgentElementUnload.FOREX_AMOUNT.get());
				forexAmount.clear();
				forexAmount.sendKeys(fAmount);

				Thread.sleep(1000);
				WebElement livaRate = getDriver().findElement(AgentElementUnload.LIVE_RATE.get());
				System.out.println(currency + " added @ " + livaRate.getText());

			} catch (Exception e) {

				System.err.println("Something went wrong,Retrying...");

			}

		}
	}
}
