package com.bmf.automation.remit_order;

import io.cucumber.datatable.DataTable;
import io.cucumber.java.en.And;
import io.cucumber.java.en.Then;

import org.junit.Assert;
import org.openqa.selenium.By;

import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.Select;

import com.bmf.automation.buy_order.BuyOrderCurrency;
import com.bmf.automation.buy_order.ElementBuy;
import com.bmf.automation.buy_order.ElementMobileBuy;
import com.bmf.automation.reload.ElementReload;
import com.bmf.automation_commons.BmfTestCommon;

import java.util.*;

public class RemitOrder extends BmfTestCommon {
	List<Map<String, String>> cucumberDataTable; // The data will be fetch from cucumber feature file
	String mobNumber = "9853048678"; // this number will be change in remit order Confirm
	// sender's DOB
	String dobyear = "1991";
	int dobdate = 3;

	@And("^User enters Money Transfer/Remit Order details$")
	public void SubmitRemitDetails(DataTable remitDT) throws Throwable {
		weforexAmount = null;
		product = null;
		page = null;
		cucumberDataTable = remitDT.asMaps(String.class, String.class);
		page = cucumberDataTable.get(0).get("page");
		String cityName = cucumberDataTable.get(0).get("city");
		String countryName = cucumberDataTable.get(0).get("country");
		product = cucumberDataTable.get(0).get("productType");
		String forexAmount = cucumberDataTable.get(0).get("forexAmount");
		String currency = cucumberDataTable.get(0).get("currency");
		orderType = cucumberDataTable.get(0).get("orderType").toLowerCase();
		try {

			if (page == null)
				if (device.toLowerCase().contains("desktop"))
					getDriver().findElement(ElementRemit.SWITCH_REMIT.get()).click();
				else if (device.toLowerCase().contains("mobile"))
					getDriver().findElement(ElementRemit.M_SWITCH_REMIT.get()).click();
			super.Location(cityName);
//			if (device.contains("mobile")) {
//				WebElement locationBtn = getDriver().findElement(ElementMobileBuy.M_LOCATION_CLICK.get());
//				locationBtn.click();
//				fwait.until(ExpectedConditions.invisibilityOf(locationBtn));
//			}
//			for (int i = 0; i < 5; i++) {
//
//				if (device.contains("mobile")) {
//					listSelectCity = getDriver().findElements(ElementMobileBuy.M_LOCATION_SELECT.get());
//
//				} else {
//					listSelectCity = getDriver().findElements(ElementRemit.SELECT_CITY.get());
//				}
//				Thread.sleep(1500);
//				if (listSelectCity.size() > 0) {
//					Select city = new Select(listSelectCity.get(0));
//					city.selectByVisibleText(cityName);
//					break;
//				}
//			}

			// Live Remit Rates
//			String rate = fwait.until(ExpectedConditions.visibilityOfElementLocated(ElementRemit.LIVE_RATE.get()))
//					.getText();
			super.getRate();
			// Select Country to Money Transfer
			Select remitCountry = new Select(getDriver().findElement(ElementRemit.SELECT_COUNTRY.get()));
			remitCountry.selectByVisibleText(countryName);
			// Select product type for Remit
			Thread.sleep(2000);
			Select remitProduct = new Select(getDriver().findElement(ElementRemit.SELECT_PRODUCT.get()));
			remitProduct.selectByVisibleText(product);

			Select currencyYouWant = new Select(getDriver().findElement(ElementRemit.SELECT_CURRENCY.get()));
			currencyYouWant.selectByVisibleText(currency);

			// Select amount to transfer
			weforexAmount = getDriver().findElement(ElementRemit.FOREX_AMOUNT.get());
			weforexAmount.clear();
			weforexAmount.sendKeys(forexAmount);

//			System.out.println(product + " is added with " + "'" + rate + "'" + " for " + currency);

		} catch (Exception e) {

			System.err.println("Seems something went wrong,Retrying");

		}

	}

	@Then("^User able to create Remit order$")
	public void bookRemit() throws Throwable {
		super.bookOrderLogic(ElementRemit.BOOK_THIS_ORDER.get());
	}

	@And("^User enter sender details by skipping aadhaar$")

	public void SkipAadhar(DataTable senderDT) throws Throwable {
		custName = null;
		actualCustomerName = null;
		cucumberDataTable = senderDT.asMaps(String.class, String.class);
		String pan = cucumberDataTable.get(0).get("pan");
		String address = cucumberDataTable.get(0).get("address");
		String pin = cucumberDataTable.get(0).get("pinCode");
		String city = cucumberDataTable.get(0).get("city");
		String state = cucumberDataTable.get(0).get("state");

		try {
			for (int i = 0; i < 3; i++) {
				Thread.sleep(1000);
				landedForexScreen(10);
				if (BuyOrderCurrency.actualHeaderName.contains("sender")) {
					fwait.until(ExpectedConditions.invisibilityOfElementLocated(ElementBuy.LOADER.get()));
					WebElement skipAdhaar = fwait
							.until(ExpectedConditions.elementToBeClickable(ElementRemit.SKIP_AADHAR.get()));
					super.scrolToElement(skipAdhaar);
					jse.executeScript("arguments[0].click()", skipAdhaar);
					// skipAdhaar.click();

					getDriver().manage().timeouts().implicitlyWait(java.time.Duration.ofSeconds(5));
					List<WebElement> listPanedit = getDriver().findElements(ElementRemit.PAN_EDIT.get());
					if (listPanedit.size() > 0) {
						WebElement editpan = listPanedit.get(0);
						editpan.click();
					}
					getDriver().findElement(ElementRemit.PAN_INPUT.get()).sendKeys(pan);

					WebElement dob = getDriver().findElement(ElementRemit.DOB_SENDER.get());
					dob.click();
					WebElement dobYear = getDriver().findElement(ElementRemit.DOB_YEAR.get());
					Select selectYear = new Select(dobYear);
					selectYear.selectByVisibleText(dobyear); //
					Thread.sleep(500);
					List<WebElement> listDates = getDriver().findElements(ElementRemit.DOB_DATE.get());
					if (listDates.size() > 0 && listDates.get(0).isDisplayed()) {
						listDates.get(dobdate - 1).click();
					}

					WebElement addressInput = fwait
							.until(ExpectedConditions.elementToBeClickable(ElementRemit.STREET_ADD.get()));
					addressInput.clear();
					addressInput.sendKeys(address);

					custName = fwait.until(ExpectedConditions.elementToBeClickable(ElementBuy.CUSTOMER_NAME.get()));
					actualCustomerName = custName.getAttribute("value");
					System.out.println("Customer Name In Order besides Pan name-" + "'" + actualCustomerName + "'");
					// is checking valid phone
					super.isValidPhone();
					WebElement pinCode = getDriver().findElement(ElementRemit.PIN_CODE.get());
					pinCode.clear();
					pinCode.sendKeys(pin);

					Select cityCode = new Select(
							fwait.until(ExpectedConditions.elementToBeClickable(ElementRemit.CITY.get())));
					cityCode.selectByVisibleText(city);

					fwait.until(ExpectedConditions.invisibilityOfElementLocated(ElementBuy.LOADER.get()));

					Select stateCode = new Select(
							fwait.until(ExpectedConditions.elementToBeClickable(ElementRemit.STAE.get())));
					stateCode.selectByVisibleText(state);

					fwait.until(ExpectedConditions.invisibilityOfElementLocated(ElementBuy.LOADER.get()));

					WebElement contBTN = getDriver().findElement(ElementRemit.SENDER_CONTINUE.get());
					// contBTN.click();
					jse.executeScript("arguments[0].click()", contBTN);
					fwait.until(ExpectedConditions.invisibilityOfElementLocated(ElementBuy.LOADER.get()));
					super.replacePanModalOpened();

					break;
				}
			}
		} catch (Exception e) {

			System.out.println(e.getMessage());

		}

	}

	@And("^SBM Account not found with logged user popup appears$")
	public void sbmModelOpen() throws Throwable {

		try {
			getDriver().manage().timeouts().implicitlyWait(java.time.Duration.ofSeconds(10));
			WebElement alertText = fwait.until(ExpectedConditions
					.visibilityOfElementLocated(By.xpath("//div[@id='digitalBankAccountok']/div/div/div/p")));
			System.out.println("Scenario passed : Reason -  " + alertText.getText());
			getDriver().findElement(By.xpath("//button[@class='btn btn-primary']")).click();
		} catch (Exception e) {
			sbmModelOpen();
			System.out.println(e.getMessage());
		}

	}

	@And("^Enter Beneficiary Details$")
	public void createBeneficiary(DataTable benfDT) throws Throwable {
		cucumberDataTable = benfDT.asMaps(String.class, String.class);
		String bsbCode = cucumberDataTable.get(0).get("BSBCode");
		String beneficiaryName = cucumberDataTable.get(0).get("BeneficiaryName");
		String swiftCode = cucumberDataTable.get(0).get("SwiftCode");
		String benAddresss = cucumberDataTable.get(0).get("BeneficiaryAddress");
		String ibanNo = cucumberDataTable.get(0).get("ibanNo");
		String routingNo = cucumberDataTable.get(0).get("RoutingNumber");
		String bankAccNo = cucumberDataTable.get(0).get("BankAccountNumber");
		expectedNostro = cucumberDataTable.get(0).get("nostroValue");

		try {
			fwait.until(ExpectedConditions.invisibilityOfElementLocated(ElementBuy.LOADER.get()));

			List<WebElement> listBsbNo = null;
			List<WebElement> listIBan = null;
			List<WebElement> listBankAccounNo = null;
			List<WebElement> listBenRelation = null;
			List<WebElement> listRoutingNo = null;
			for (int i = 0; i <= 3; i++) {
				Thread.sleep(1000);
				List<WebElement> listAdd = getDriver().findElements(ElementRemit.ADD_NEW_BEN.get());
				if (listAdd.size() > 0 && listAdd.get(0).isDisplayed()) {
					listAdd.get(0).click();
				}
				Thread.sleep(2000);
				listBsbNo = getDriver().findElements(ElementRemit.BENEFICIARY_BSB_CODE.get());
				listIBan = getDriver().findElements(ElementRemit.BENEFICIARY_IBAN.get());
				listBankAccounNo = getDriver().findElements(ElementRemit.BENEFICIARY_ACC.get());
				listBenRelation = getDriver().findElements(ElementRemit.BEN_RELATIONSHIP.get());
				listRoutingNo = getDriver().findElements(ElementRemit.BENEFICIARY_ROUTING.get());
				if (listBankAccounNo.size() > 0 && listBenRelation.size() > 0)
					break;
			}

			fwait.until(ExpectedConditions.elementToBeClickable(ElementRemit.BENEFICIRY_NAME.get()))
					.sendKeys(beneficiaryName);
			getDriver().findElement(ElementRemit.BENEFICIARY_ADDRESS.get()).sendKeys(benAddresss);
			getDriver().findElement(ElementRemit.BENEFICIARY_SWIFT.get()).sendKeys(swiftCode);

			if (listBsbNo.size() > 0 && listBsbNo.get(0).isDisplayed()) {
				listBsbNo.get(0).sendKeys(bsbCode);
			}

			if (listIBan.size() > 0 && listIBan.get(0).isDisplayed()) {
				listIBan.get(0).sendKeys(ibanNo);
			}

			if (listRoutingNo.size() > 0 && listRoutingNo.get(0).isDisplayed()) {
				listRoutingNo.get(0).sendKeys(routingNo);
			}

			if (listBankAccounNo.size() > 0 && listBankAccounNo.get(0).isDisplayed()) {
				listBankAccounNo.get(0).sendKeys(bankAccNo);
			}

			if (listBenRelation.size() > 0 && listBenRelation.get(0).isDisplayed()) {
				listBenRelation.get(0).sendKeys("Other");
			}

			Thread.sleep(1000);
			WebElement nostroSelect = getDriver().findElement(ElementRemit.BENEFICIARY_NOSTRO.get());
			Select nostrocharges = new Select(nostroSelect);
			nostrocharges.selectByValue(expectedNostro);
			fwait.until(ExpectedConditions.invisibilityOfElementLocated(ElementBuy.TOAST_MSG.get()));

			super.remitBenDecl();

			WebElement enterContinue = fwait
					.until(ExpectedConditions.elementToBeClickable(ElementRemit.CONTINUE.get()));
			super.scrolToElement(enterContinue);
			enterContinue.click();
			fwait.until(ExpectedConditions.invisibilityOfElementLocated(ElementBuy.LOADER.get()));
		} catch (Exception e) {
			System.out.println("exception due to-" + e.getMessage());
		}

	}

	@And("^Transfer Details OTP verification$")
	public void fetchOTP(DataTable otp) throws Throwable {
		cucumberDataTable = otp.asMaps(String.class, String.class);
		String fixeOtp = cucumberDataTable.get(0).get("fixedOtp");
		landedForexScreen(10);

		try {
			if (BuyOrderCurrency.actualHeaderName.contains("transfer details")) {
				fwait.until(ExpectedConditions.invisibilityOfElementLocated(ElementBuy.LOADER.get()));

				if (BuyOrderCurrency.selectedPurpose.contains("non relative individual")) {
					WebElement inputtransferForeign = getDriver().findElement(ElementRemit.INPUT_TRANSFERFOREIGN.get());
					if (!(inputtransferForeign.isSelected())) {
						foreignTransfr = fwait.until(
								ExpectedConditions.visibilityOfElementLocated(ElementRemit.TRANSFERFOREIGN.get()));
						foreignTransfr.click();
						System.out.println(foreignTransfr.getText() + "-purpose based consent is checked  !!");
					}
				}
				WebElement acceptDeclaration = getDriver().findElement(ElementRemit.SENDER_DECLARATION.get());
				super.scrolToElement(acceptDeclaration);
				acceptDeclaration.click();

				fwait.until(ExpectedConditions.invisibilityOfElementLocated(ElementBuy.LOADER.get()));
				WebElement changeNumber = fwait
						.until(ExpectedConditions.elementToBeClickable(ElementRemit.PHONE_NUMBER_LINK.get()));
				changeNumber.click();
				WebElement newNumber = fwait
						.until(ExpectedConditions.elementToBeClickable(ElementRemit.PHONE_NUMBER_CHANGE.get()));
				newNumber.sendKeys(mobNumber);
				getDriver().findElement(ElementRemit.CHANGE_NUMBER_CONFIRM.get()).click();
				fwait.until(ExpectedConditions.invisibilityOfElementLocated(ElementRemit.CHANGE_PHONE_DIALOG.get()));

				for (int i = 0; i < 3; i++) {
					WebElement senderDecCheckBox = getDriver().findElement(ElementRemit.INPUT_SENDER_DEC.get());
					if (senderDecCheckBox.isEnabled()) {
						super.scrolToElement(acceptDeclaration);
						if (super.foreignTransfr != null)
							super.foreignTransfr.click();

						acceptDeclaration.click();
						fwait.until(ExpectedConditions.invisibilityOfElementLocated(ElementBuy.LOADER.get()));
						Thread.sleep(1000);
						List<WebElement> listOtpModal = getDriver().findElements(ElementRemit.OTP_MDL_DIALOG.get());
						if (listOtpModal.size() > 0 && listOtpModal.get(0).isDisplayed()) {

							fwait.until(ExpectedConditions.elementToBeClickable(ElementRemit.OTP_TEXT_BOX.get()))
									.sendKeys(fixeOtp);
							getDriver().findElement(ElementRemit.OTP_SUBMIT.get()).click();

							break;
						}
					} else {
						System.out.println("Seems otp modal not opened,Retrying after timer close  !!");
						fwait.until(ExpectedConditions.invisibilityOfElementLocated(ElementRemit.TIMER_SHOW.get()));

					}
				}
			} else {
				System.out.println("Transfer Details is skipped !!");
			}
		} catch (

		Exception e) {
			System.out.println(e.getMessage());
		}

	}

}