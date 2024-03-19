package com.bmf.automation.reload;

import java.util.List;
import java.util.Map;

import org.junit.Assert;

import org.openqa.selenium.WebElement;
import org.openqa.selenium.logging.LogEntries;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.Select;

import com.bmf.automation.buy_order.BuyOrderCurrency;
import com.bmf.automation.buy_order.ElementBuy;
import com.bmf.automation.unload.ElementUnload;
import com.bmf.automation_commons.BmfTestCommon;

import io.cucumber.datatable.DataTable;
import io.cucumber.java.en.And;
import io.cucumber.java.en.Then;

public class CardReload extends BmfTestCommon {
	List<Map<String, String>> cucumberDataTable;
	List<WebElement> listHeaders;

	@And("^User given all below details to buy realod/Unload card$")
	public void fillReloadDtls(DataTable dtr) throws Throwable {
		weforexAmount = null;
		product = null;
		page = null;
		cucumberDataTable = dtr.asMaps(String.class, String.class);
		String cityNmae = cucumberDataTable.get(0).get("city");
		String card = cucumberDataTable.get(0).get("cardtype");
		String kit = cucumberDataTable.get(0).get("kitnumber");
		String currencyType = cucumberDataTable.get(0).get("currencytype");
		String amount = cucumberDataTable.get(0).get("forexamount");
		orderType = cucumberDataTable.get(0).get("orderType").toLowerCase();
		String cardNum = cucumberDataTable.get(0).get("cardNumber");
		String selectUnload = cucumberDataTable.get(0).get("select");
		page = cucumberDataTable.get(0).get("page");
		if (orderType.toLowerCase().contains("reload") || orderType.toLowerCase().contains("unload"))
			product = "forex card"; // to use in some test method
		BuyOrderCurrency.cityShown = false;
		try {

			if (page == null)
				if (orderType.contains("reload") || orderType.contains("unload")) {

					getDriver().findElement(ElementReload.SWITCH_UNLOAD_RELOAD.get()).click();
					Thread.sleep(5000);
				}

			if (orderType.contains("unload")) {
				for (int i = 0; i <= 3; i++) {
					List<WebElement> unloadSwitchList = getDriver().findElements(ElementUnload.SWITCH_TO_UNLOAD.get());
					if (unloadSwitchList.size() > 0 && unloadSwitchList.get(0).isDisplayed()
							&& unloadSwitchList.get(0).getText().toLowerCase().contains("unload")) {
						unloadSwitchList.get(0).click();
						break;
					}
					Thread.sleep(3000);
				}

			}

			WebElement cardType = fwait
					.until(ExpectedConditions.elementToBeClickable(ElementReload.SELECT_CARD_TYPE.get()));

			Select selectCardType = new Select(cardType);
			Thread.sleep(1000);
			selectCardType.selectByVisibleText(card);

			for (int i = 0; i <= 3; i++) {

				List<WebElement> listSelectCity = getDriver().findElements(ElementReload.SELECT_CITY.get());
				if (listSelectCity.size() > 0 && listSelectCity.get(0).isDisplayed()&& !BuyOrderCurrency.cityShown) {
					WebElement selectCity = fwait.until(ExpectedConditions.elementToBeClickable(listSelectCity.get(0)));
					// to select city from drop down as delhi
					Select city = new Select(selectCity);
					city.selectByVisibleText(cityNmae);
					BuyOrderCurrency.cityShown = true;

				} else if (i == 2) {
					System.out
							.println("checked 3 times..,city Dropdown Shown-" + "'" + BuyOrderCurrency.cityShown + "'");
				}
				if (i == 3) {

					if (card.toLowerCase().contains("bookmyforex")) {
						WebElement kitInput = getDriver().findElement(ElementReload.SELECT_CARD_KIT.get());
						kitInput.clear();
						kitInput.sendKeys(kit);
					} else {
						WebElement cardNumber = getDriver().findElement(ElementReload.CARD_INPUT.get());
						cardNumber.clear();
						cardNumber.sendKeys(cardNum);
					}

					if ((selectUnload != null && selectUnload.contains("partial")) || orderType.contains("reload")) {

						WebElement selectCurrency = fwait
								.until(ExpectedConditions.elementToBeClickable(ElementReload.SELECT_CURRENCY.get()));
						// to select currency from drop down
						Select currency = new Select(selectCurrency);
						currency.selectByVisibleText(currencyType);

						weforexAmount = getDriver().findElement(ElementReload.FOREX_AMOUNT.get());
						weforexAmount.clear();
						weforexAmount.sendKeys(amount);
						Thread.sleep(2000);
//						WebElement ratecard = fwait
//								.until(ExpectedConditions.visibilityOfElementLocated(ElementReload.RATE.get()));
						super.getRate();

						super.addPrdouct();
						break;
					} else {
						getDriver().findElement(ElementReload.FULL_UNLOAD.get()).click();
						break;
					}
				}

			}

		} catch (Exception e) {

			System.err.println("Something went wrong,due to.." + e.getMessage());

		}
		if (!page.contains("cms") && (orderType.contains("reload") || orderType.contains("unload")))
			Assert.assertTrue("City Shouldn't be shown for Reload/Unload", cityShown);

	}

	@Then("^User able to create reload/unload order after given all details$")
	public void reoloadBookThisOrder() throws Throwable {
		super.bookOrderLogic(ElementReload.REALOD_UNLOAD_ORDER.get());

	}

	@And("^verify duplicate reload/unload orders$")
	public void duplicateCheck() throws Throwable {
		fwait.until(ExpectedConditions.urlContains(".com/forex/"));
		for (int i = 0; i <= 3; i++) {
			List<WebElement> listDuplicateDialog = getDriver().findElements(ElementReload.DUPLICATE_ORDER_DIALOG.get());
			if (listDuplicateDialog.size() > 0 && listDuplicateDialog.get(0).isDisplayed()) {
				WebElement createDuplicate = getDriver().findElement(ElementReload.DUPLICATE_ORDER_CREATE.get());
				jse.executeScript("arguments[0].click()", createDuplicate);
				System.out.println("Duplicate order is now To create");
				break;

			} else if (i == 3) {
				System.err.println(
						"Tried 4 times-Seems it's a unique order/not a duplicate order/Duplicate order modal Not Shown");

			}
			Thread.sleep(3000);
		}

	}

	@And("^Verify Secure user mapped kit not found or Invalid kit modal message")
	public void invalidKit() throws Throwable {
		fwait.until(ExpectedConditions.invisibilityOfElementLocated(ElementBuy.LOADER.get()));
		boolean invalidKitMsgIsModal = false;
		try {
			if (BuyOrderCurrency.actualHeaderName.contains("customer details")) {
				for (int i = 0; i <= 3; i++) {
					Thread.sleep(1000);
					List<WebElement> listtoastMsg = getDriver().findElements(ElementBuy.INVALID_KIT_MODAL.get());
					if (listtoastMsg.size() > 0 && listtoastMsg.get(0).isDisplayed()) {
						String msg = getDriver().findElement(ElementBuy.INVALID_KIT_MSG.get()).getText();
						System.out.println("Message Displayed-" + "'" + msg + "'");
						listtoastMsg.get(0).click();
						fwait.until(
								ExpectedConditions.invisibilityOfElementLocated(ElementBuy.INVALID_KIT_MODAL.get()));
						invalidKitMsgIsModal = true;
						break;

					} else {
						Thread.sleep(500);
						getDriver().findElement(ElementBuy.CONTINUE.get()).click();
					}
				}

			}

		} catch (Exception e) {

			System.err.println(e.getMessage());
		}
		Assert.assertTrue("Toast message/modal is not Displayed", invalidKitMsgIsModal);
	}

	@And("^Verify Modal if unmapped kit number used to reload for user details$")
	public void unmappedKit(DataTable dtDiscrepancy) throws Throwable {
		cucumberDataTable = dtDiscrepancy.asMaps(String.class, String.class);
		fwait.until(ExpectedConditions.invisibilityOfElementLocated(ElementBuy.LOADER.get()));
		boolean modalDisplayed = false;
		WebElement ignoreContinue = null;
		String expectedAction = cucumberDataTable.get(0).get("action");

		landedForexScreen(10);
		if (BuyOrderCurrency.actualHeaderName.contains("customer details")) {
			try {

				for (int i = 0; i < 3; i++) {
					Thread.sleep(3000);
					List<WebElement> listDisDialog = getDriver().findElements(ElementReload.DISCREAPANCY_DIALOG.get());
					if (listDisDialog.size() > 0 && listDisDialog.get(0).isDisplayed()) {
						// is checking valid phone
						super.isValidPhone();
						WebElement DisModal = fwait.until(
								ExpectedConditions.visibilityOfElementLocated(ElementReload.DISCREPANCY_MODAL.get()));

						modalDisplayed = true;
						System.out.println("Modal Displayed-" + DisModal.getText());
						if (BuyOrderCurrency.orderType.contains("reload")) {
							ignoreContinue = fwait.until(
									ExpectedConditions.visibilityOfElementLocated(ElementReload.COUNTINUE_WITH.get()));
						}
						if (ignoreContinue != null && expectedAction.contains("continue")) {
							ignoreContinue.click();

							System.out.println("order is now continueing with unmapped kit");
						} else if (expectedAction.contains("restart")) {
							WebElement restartOrder = getDriver().findElement(ElementReload.RESTART_ORDER.get());
							restartOrder.click();
							System.out.println("redirected to restart order-" + getDriver().getTitle());

						}
						break;

					} else {

						System.out.println("Secure user Discrepancy Modal not displayed,Retrying...");
						getDriver().findElement(ElementBuy.CONTINUE.get()).click();

					}

				}

			} catch (Exception e) {

				System.err.println(e.getMessage());

			}
			Assert.assertTrue("email/phone discrepancy Modal is not Displayed", modalDisplayed);
		} else {
			System.out.println("Customer details section is Passed with no Errors");
		}

	}

	@Then("^Verify under customer details pan not added then add '(.*)'$")
	public void custDetail(String pan) throws Throwable {
		boolean clickToEdit = false;
		actualCustomerName = null;
		for (int j = 0; j < 3; j++) {
			landedForexScreen(10);
			if (BuyOrderCurrency.actualHeaderName.contains("customer")) {
				WebElement countinue = getDriver().findElement(ElementBuy.CONTINUE.get());
				try {
					Thread.sleep(1000);
					for (int i = 0; i <= 3; i++) {
						List<WebElement> listPanEditbtns = getDriver().findElements(ElementBuy.PAN_EDIT.get());
						if (listPanEditbtns.size() > 0) {
							clickToEdit = true;
							WebElement editpan = listPanEditbtns.get(0);
							editpan.click();
						}
						fwait.until(ExpectedConditions.invisibilityOfElementLocated(ElementBuy.LOADER.get()));
						List<WebElement> listPanInput = getDriver().findElements(ElementBuy.PAN_INPUT.get());
						if (clickToEdit == true && listPanInput.size() > 0 && listPanInput.get(0).isEnabled()) {

							Thread.sleep(500);
							WebElement inputPan = fwait
									.until(ExpectedConditions.elementToBeClickable(listPanInput.get(0)));
							inputPan.sendKeys(pan);

							countinue.click();
							super.replacePanModalOpened();
							break;
						} else if (listPanEditbtns.size() == 0 && i == 3) {
							List<WebElement> custnamesList = getDriver().findElements(ElementBuy.CUSTOMER_NAME.get());
							for (WebElement customerName : custnamesList) {
								if (customerName.isDisplayed()) {
									actualCustomerName = customerName.getAttribute("value");
									System.out.println(
											"Card Holder Name as per secureUser-" + "'" + actualCustomerName + "'");
									break;
								}
							}
							// is checking valid phone
							super.isValidPhone();
							countinue.click();
							super.replacePanModalOpened();

						}
					}
					break;
				} catch (Exception e) {

					System.err.println("Seems something went wrong-" + e.getMessage());
				}
			} else {
				super.switchToSection("Customer Details");

			}
		}

	}

	@Then("^select trip current or new trip and travel details$")
	public void selectTrip(DataTable dttrip) throws Throwable {
		cucumberDataTable = dttrip.asMaps(String.class, String.class);
		expectedtrip = cucumberDataTable.get(0).get("triptype").toLowerCase();

		for (int i = 0; i < 4; i++) {

			landedForexScreen(10);
			// do not remove sometime in case other card reload is shown
			if (BuyOrderCurrency.actualHeaderName.contains("order")
					|| BuyOrderCurrency.actualHeaderName.contains("customer")) {
				WebElement orderContinue = getDriver().findElement(ElementBuy.CONTINUE.get());
				super.scrolToElement(orderContinue);
				orderContinue.click();
			}
			landedForexScreen(10);
			if (BuyOrderCurrency.actualHeaderName.contains("eligibility check")) {
				fwait.until(ExpectedConditions.invisibilityOfElementLocated(ElementBuy.LOADER.get()));

				Thread.sleep(1500);
				List<WebElement> listtrips = getDriver().findElements(ElementReload.TRIP_TYPE.get());
				if (listtrips.size() > 0 && listtrips.get(0).isDisplayed()) {
					for (WebElement trip : listtrips) {
						String actualtrip = trip.getText().toLowerCase();
						if (actualtrip.equalsIgnoreCase(expectedtrip)) {
							trip.click();
							// some time if is not run click- please don't remove the below line
							fwait.until(ExpectedConditions.invisibilityOfElementLocated(ElementBuy.LOADER.get()));
							Thread.sleep(1000);
							break;
						}

					}
					break;
				}

			} else if (actualHeaderName.contains("review")) {
				// in case reload order purpose is not selected in case current trip
				if (orderType.contains("reload"))
					System.err.println("The trip is not changed in this order , Seems the user is already on trip");
				break;
			}
		}

	}

	@And("^select Country travel details$")
	public void selectTravelDetails(DataTable dttravel) throws Throwable {

		cucumberDataTable = dttravel.asMaps(String.class, String.class);
		String travleCountryOne = cucumberDataTable.get(0).get("tcountryOne");
		String travleCountryTwo = cucumberDataTable.get(0).get("tcountryTwo");
		super.travelBeforeAfterToday = Integer.parseInt(cucumberDataTable.get(0).get("departBeforeAfterToday"));
		super.returnAfterToday = Integer.parseInt(cucumberDataTable.get(0).get("returnAfterToday"));

		landedForexScreen(10);

		if (BuyOrderCurrency.actualHeaderName.contains("eligibility check")) {

			try {

				Thread.sleep(1000); // pick next months date only /previous month date
				webElementTravelStartSelect = getDriver().findElement(ElementReload.TRAVEL_START_INPUT.get());

				if (webElementTravelStartSelect.isEnabled()) {
					super.scrolToElement(webElementTravelStartSelect);
					webElementTravelStartSelect.click();
					super.traveldateselect();
				} else {

					System.err.println(
							"Travel Countries DropDown Disabled !! Seems for the user there is Deal completed/ returnDate > currentDate");

				}

				Thread.sleep(1000);
				List<WebElement> listTravelCountries = getDriver().findElements(ElementReload.TRAVEL_COUNTRY.get());
				if (listTravelCountries.size() > 0 && listTravelCountries.get(0).isEnabled()) {

					WebElement travelCountry = fwait
							.until(ExpectedConditions.elementToBeClickable(listTravelCountries.get(0)));
					Select reloadTrvlCountry = new Select(travelCountry);
					if (travleCountryOne != null)
						reloadTrvlCountry.selectByVisibleText(travleCountryOne);
					if (travleCountryTwo != null)
						reloadTrvlCountry.selectByVisibleText(travleCountryTwo);

				}
				super.eligibilityIconfirm();
				super.fatfDeclaration("eligibility check");

				WebElement eligibilityContinue = getDriver().findElement(ElementBuy.CONTINUE.get());
				super.scrolToElement(eligibilityContinue);
				eligibilityContinue.click();
			} catch (Exception e) {

				System.err.println("Failed to Select-" + e.getMessage());

			}

		} else {
			System.out.println("Eligibilty Section skipped !!( current trip)");
		}
	}
}
