package com.bmf.automation.betterRateRequest;

import java.util.List;
import java.util.Map;

import org.junit.Assert;
import org.junit.Assume;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.Select;

import com.bmf.automation.buy_order.BuyOrderCurrency;
import com.bmf.automation.buy_order.ElementBuy;
import com.bmf.automation_commons.BmfTestCommon;

import io.cucumber.datatable.DataTable;
import io.cucumber.java.en.And;
import io.cucumber.java.en.Then;

public class BetterRateRequestOrder extends BmfTestCommon {
	List<Map<String, String>> cucumberDataTable; // The data will be fetch from cucumber feature file only
	JavascriptExecutor jse = (JavascriptExecutor) getDriver();

	@And("^User given all below details to create Better rate request$")
	public void fillRequestDetails(DataTable dataorder) throws Throwable {

		cucumberDataTable = dataorder.asMaps(String.class, String.class);
		String cityName = cucumberDataTable.get(0).get("city");
		String orderFrom = cucumberDataTable.get(0).get("orderFrom").toLowerCase();
		String currencyType = cucumberDataTable.get(0).get("currency");
		product = cucumberDataTable.get(0).get("product");
		String betterOrderType = cucumberDataTable.get(0).get("orderType");
		String fAmount = cucumberDataTable.get(0).get("forexAmount");
		BuyOrderCurrency.orderType = betterOrderType.toLowerCase() + " -" + orderFrom;
		try {
			WebElement btnBtterRate = getDriver().findElement(ElementBetterRaterequest.BETTER_REQUEST_HOME.get());
			super.scrolToElement(btnBtterRate);
			btnBtterRate.click();
			fwait.until(
					ExpectedConditions.visibilityOfElementLocated(ElementBetterRaterequest.BETTER_RATE_DIALOG.get()));

			Thread.sleep(1000);
			List<WebElement> listOrderTypeRadio = getDriver()
					.findElements(ElementBetterRaterequest.ORDER_TYPE_RADIO.get());
			if (listOrderTypeRadio.size() > 0) {
				// fwait.until(ExpectedConditions.elementToBeClickable(listOrderTypeRadio.get(0)));
				for (WebElement orderSelect : listOrderTypeRadio) {

					String orderType = orderSelect.getText().toLowerCase().trim();

					if (orderType.contains(betterOrderType)) {
						orderSelect.click();
						break;
					}

				}

				WebElement selectCity = fwait
						.until(ExpectedConditions.elementToBeClickable(ElementBetterRaterequest.CITY_SELECT.get()));
				Select city = new Select(selectCity);
				city.selectByVisibleText(cityName);

				Select curencyType = new Select(
						getDriver().findElement(ElementBetterRaterequest.CURRENCY_SELECT.get()));
				curencyType.selectByVisibleText(currencyType);

				Select ProductType = new Select(getDriver().findElement(ElementBetterRaterequest.PRODUCT_SELECT.get()));
				ProductType.selectByVisibleText(product);

				WebElement fxAmount = fwait
						.until(ExpectedConditions.elementToBeClickable(ElementBetterRaterequest.FOREX_INPUT.get()));
				fxAmount.clear();
				fxAmount.sendKeys(fAmount);

				WebElement requestSubmit = getDriver()
						.findElement(ElementBetterRaterequest.BETTER_RATE_REQUEST_BTN.get());
				super.scrolToElement(requestSubmit);
				Thread.sleep(500);
				jse.executeScript("arguments[0].click()", requestSubmit);
				fwait.until(ExpectedConditions.invisibilityOf(fxAmount));
			}

		} catch (Exception e) {
			System.out.println("Seems something not right better rate fail-" + e.getMessage());
		}
	}

	@Then("^Need to select better rate cashback order to continue$")
	public void selectOrderToContinue(DataTable choice) throws Throwable {
		cucumberDataTable = choice.asMaps(String.class, String.class);
		String selectToContinue = cucumberDataTable.get(0).get("choice");

		try {
			Thread.sleep(500);
			List<WebElement> bookOrderBestrateAlready = getDriver()
					.findElements(ElementBetterRaterequest.BOOK_ORDER_BEST_RATE.get());

			if (bookOrderBestrateAlready.size() == 0 && selectToContinue.contains("continueWithCashBack")) {
				BuyOrderCurrency.betterrateContinueWithCashBack = true;
				fwait.until(
						ExpectedConditions.elementToBeClickable(ElementBetterRaterequest.CONTINUE_WITH_CASHBACK.get()))
						.click();
				fwait.until(ExpectedConditions.invisibilityOfElementLocated(ElementBuy.LOADER.get()));
			} 

		} catch (Exception e) {
			System.out.println("Seems something not right--" + e.getMessage());
		}
		Assume.assumeTrue("Better rate is same as live rate ,No promo code applicable/Unable to create better rate Order- " + product + "- skipped", betterrateContinueWithCashBack);
	}

}
