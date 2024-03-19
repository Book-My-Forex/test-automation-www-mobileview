package com.bmf.automation.Agent_orders;

import java.util.List;
import java.util.Map;

import org.junit.Assert;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.Select;

import com.bmf.automation.buy_order.BuyOrderCurrency;

import com.bmf.automation.home_login.LoginFunction;
import com.bmf.automation_commons.BmfTestCommon;

import io.cucumber.datatable.DataTable;
import io.cucumber.java.en.And;
import io.cucumber.java.en.Then;

public class AgentBuyOrderCard extends BmfTestCommon {
	List<Map<String, String>> cucumberDataTable; // The data will be fetch from cucumber feature file

	@And("^User given all below details to buy currency/card for Agent$")
	public void fillBuyDetailsAgent(DataTable buydt) throws Throwable {
		product= null;
		orderType= null;
		cucumberDataTable = buydt.asMaps(String.class, String.class);
		String city = cucumberDataTable.get(0).get("city");
		String currency = cucumberDataTable.get(0).get("currency");
		product = cucumberDataTable.get(0).get("productType");
		String fAmount = cucumberDataTable.get(0).get("forexAmount");
		orderType = cucumberDataTable.get(0).get("orderType").toLowerCase();

		if (LoginFunction.pageloaded == true) {
			try {

				WebElement citySelect = getDriver().findElement(AgentElementBuy.SELECT_CITY_LIST.get());
				Select selectCiy = new Select(citySelect);
				selectCiy.selectByVisibleText(city);

				WebElement currencySelect = getDriver().findElement(AgentElementBuy.SELECT_CURRENCY_TYPE.get());
				Select selectCurrency = new Select(currencySelect);
				selectCurrency.selectByVisibleText(currency);

				Thread.sleep(500);
				WebElement productSelect = fwait
						.until(ExpectedConditions.elementToBeClickable(AgentElementBuy.PRODUCT_TYPE.get()));
				Select selectproduct = new Select(productSelect);
				selectproduct.selectByVisibleText(product);

				WebElement forexAmount = getDriver().findElement(AgentElementBuy.FOREX_AMOUNT.get());
				forexAmount.clear();
				forexAmount.sendKeys(fAmount);

				WebElement livaRate = getDriver().findElement(AgentElementBuy.LIVE_RATE.get());
				System.out.println(product + " added @ " + livaRate.getText());
				// to add product code below
				WebElement addProdcut = getDriver().findElement(AgentElementBuy.ADD_PRODUCT.get());
				addProdcut.click();

			} catch (Exception e) {

				System.out.println("Something went wrong,Retrying...");

			}
		}

	}

	@Then("^User able to Book after given all details for agent$")
	public void buyBookThisOrder() throws Throwable {
		try {

			for (int i = 0; i < 6; i++) {
				List<WebElement> bookthisOrderButton = getDriver().findElements(AgentElementBuy.BOOK_THIS_ORDER.get());

				if (bookthisOrderButton.size() > 0) {
					WebElement bookThisOrder = bookthisOrderButton.get(i);
					if (bookThisOrder.isDisplayed()) {
						super.scrolToElement(bookThisOrder);
						bookThisOrder.click();
						break;
					}
				}
			}

		} catch (Exception e) {

			System.out.println("seems something went wrong-" + e.getMessage());

		}

	}

	@And("^User Login with Agent Guest details$")
	public void guestLogin(DataTable guestDt) throws Throwable {
		cucumberDataTable = guestDt.asMaps(String.class, String.class);
		String fixedOtp = cucumberDataTable.get(0).get("fixedOtp");
		String phoneNo = cucumberDataTable.get(0).get("phoneNumber");
		String email = cucumberDataTable.get(0).get("email");
		String name = cucumberDataTable.get(0).get("name");

		
		for (int i = 0; i < 3; i++) {			
			List<WebElement> listGuestDialog = getDriver().findElements(AgentElementBuy.GUEST_DIALOG.get());
			if (listGuestDialog.size() > 0 && listGuestDialog.get(0).isDisplayed()) {

				getDriver().findElement(AgentElementBuy.GUEST_FNAME.get()).sendKeys(name);
				getDriver().findElement(AgentElementBuy.GUEST_EMAIL.get()).sendKeys(email);
				getDriver().findElement(AgentElementBuy.GUEST_PHONE.get()).sendKeys(phoneNo);
				WebElement submit = getDriver().findElement(AgentElementBuy.GUEST_SUBMIT.get());
				Thread.sleep(1500);
				jse.executeScript("arguments[0].click()", submit);

				fwait.until(ExpectedConditions.invisibilityOf(submit));

				fwait.until(ExpectedConditions.elementToBeClickable(AgentElementBuy.GUEST_OTP.get()))
						.sendKeys(fixedOtp);
				getDriver().findElement(AgentElementBuy.GUEST_OTP_SUBMIT.get()).click();
				super.getBrowserConsoleLogs();
				guestLogin= true;
				break;
			}
			Thread.sleep(2500);
		}
		Assert.assertTrue("Agent Guest Login Failed !!", guestLogin);
	}

}
