package com.bmf.automation_commons;

import java.io.File;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.junit.Assert;
import org.junit.Assume;
import org.openqa.selenium.By;
import org.openqa.selenium.JavascriptExecutor;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.logging.LogEntries;
import org.openqa.selenium.logging.LogEntry;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.FluentWait;
import org.openqa.selenium.support.ui.Select;
import org.openqa.selenium.support.ui.Wait;
import org.openqa.selenium.support.ui.WebDriverWait;

import com.bmf.automation.buy_order.BuyOrderCurrency;
import com.bmf.automation.buy_order.ElementBuy;
import com.bmf.automation.buy_order.ElementMobileBuy;
import com.bmf.automation.home_login.ElementHome;
import com.bmf.automation.reload.CardReload;
import com.bmf.automation.reload.ElementReload;
import com.bmf.automation.remit_order.ElementRemit;
import com.bmf.automation.runner.TestRunner;
import com.bmf.automation.unload.ElementUnload;
import com.google.common.base.Joiner;

public class BmfTestCommon {
	private static WebDriver driver = WebDriverManager.getWebDriver();
	protected List<Map<String, String>> cucumberDataTable; // The data will be fetch from cucumber feature file only
	protected static String device;
	// home section
	protected static String page;
	protected static String reflink;
	protected static boolean loginBtnShown;
	public static String errorCode;
	public static String pageTitle;
	// Customer Section
	protected static String panNum;
	protected static WebElement custName;
	protected static String stringCustPhone;
	protected static String actualCustomerName;
	protected boolean isPhoneNumValid;
	protected static List<WebElement> listPanReplaceDialog; // pan replace modal dialog
	protected static List<WebElement> addProductList;
	// Eligibility section
	protected boolean ocrEnabled;
	protected WebElement webElementTravelStartSelect;
	protected String dbRequiredData;
	protected String firstCountry;
	protected String secondCountry;

	// sql values
	protected static String queryReturnvalueOne;
	protected static String queryReturnvalueTwo;

	protected static String expectedNostro;

	// new user
	protected static String phoneNo;
	protected static String email;
	protected static String psw;

	// Customer Section
	protected static List<WebElement> listDialog;
	public static String expectedtrip;
	protected boolean orderEdited;
	protected boolean guestLogin;
	protected boolean login;
	protected boolean tcsVersionThreeApplicable;
	protected boolean tcsVersionTwoApplicable;
	protected boolean tcsVersionOneApplicable;
	protected boolean paymentDone;
	protected static String errorMessage;
	protected static boolean pageloaded; // to check if the www page is loaded
	protected static String orderType; // to check order types
	protected static String product; // to Products
	protected static String actualHeaderName; // is used in respective section in order flow
	protected static String selectedPurpose; // to get purpose selected and to use in tcs
	protected static String requiredPayMode;
	protected static boolean isDiscrepancyModalShown;
	protected static boolean forexPageLoaded; // bookmyforex.com/forex/ screen is loaded or not check
	protected static boolean betterrateContinueWithCashBack; // is used to check promo code is applied or not
	protected static boolean cityShown;
	protected static boolean offlinePayment; // is used in razorpay operation for payments only
	protected static boolean simPayment; // is used in razorpay operation for Sim payments only
	protected static boolean fullpayment; // is used in razorpay operation for payments only
	protected static boolean offlinePayBtnOnly; // is used in razorpay operation for payments only
	protected static boolean panValidationFail;
	protected static boolean allDocUploaded;
	protected WebElement foreignTransfr = null; // used in remit beneficiary Details
	// tcs related
	protected static String tcsExemptionPurpose = "business visit"; // tcs should not be applied
	protected static Float tcsThresholdAmount = 700000.00f; // tcs version 1.0 threshold amount

	// will use to upload file in order flow
	protected static String filePath = System.getProperty("user.dir")
			+ Joiner.on(File.separatorChar).join("", "src", "test", "uploading_files", "");
	protected boolean isServiceChargeApplied;
	protected static Float expectedServCharge;
	protected static WebElement weforexAmount; // forex amount for all orders
	protected boolean orderRefGenerated; // used for assert if oc screen is not loaded
	protected boolean tcsVersionOne; // to check tcs for purpose & TCS v1 related checks
	protected boolean tcsVersionTwo; // to check tcs for purpose & TCS v2 related checks
	protected boolean tcsVersionThree; // to check tcs for purpose & TCS v3 related checks
	protected int roundOffDBTcsApplicable;
	protected static Float percentage;
	protected static Float previousAmt; // tcs 3
	protected boolean promoApplied;
	protected Float modalTcsFinalApplied;
	protected int travelBeforeAfterToday;
	protected int returnAfterToday;
	protected int finYer; // to get fin year
	protected boolean isPanMisMatch;
	protected HashMap<String, Float> charges;
	protected static List<WebElement> listSelectCity;
	protected static Float currentOrderTCSApplicable; // is used totcs calculation
	protected static int roundOffTcsApplicableCalculated;
	protected static float tcsCalculatation;
	protected boolean istcsAppliedUnderSummary; // to use in validate tcs is applicable or not
	protected boolean paymentRequiredForOrder; // when there is no payment required for order

	// converted total to int from string of order summary
	protected static Float payConvCharge;
	protected static Float simCharge; // if sim added to order to remove fom tcs applicable
	protected static Float totalAmount;
	protected Float tcsCharge;
	protected static Float grandTotal;
	protected static Float netPayable;
	protected static Float gst;
	protected static Float bankFee;
	protected static Float servCharge;
	protected static Float cardSpecific;
	protected static Float purposeSelectedCharge;
	protected static Float nostroChargeRemit;

	// some text related to product type used in base class
	protected static String multiCurrency = "multiple currency ( currency buy )";
	protected static String multiCurrencyCard = "multiple currency ( forex card buy )";
	protected static String textcombo = "combo Order ( forex card + currency notes )";
	// order summary keys & all should be in lower case always
	protected static String tcsKey = "tcs(tax collected at source)";
	protected static String serviceChargeKey = "service charge";
	protected static String addOnSimChargeKey = "int'l sim card(including gst)";
	protected static String totalKey = "total";
	protected static String addlpurposeChargekey = "additional charges for purpose selected";
	protected static String gstKey = "gst";
	protected static String bankFeeKey = "bank fee";
	protected static String cardSpecificChargeKey = "card specific charges";
	protected static String nostroKey = "intermediary bank/nostro charges";
	protected List<WebElement> listpayNowAdvBtn;
	// order summary keys & all should be in lower case always
	protected static String refNumber; // order reference number
	protected JavascriptExecutor jse = (JavascriptExecutor) getDriver();

	// this wait to be used in child class for explicit wait
	private WebDriverWait wait = new WebDriverWait(getDriver(), java.time.Duration.ofSeconds(30));

	// this wait to be used in child class for fluent wait
	protected static Wait<WebDriver> fwait = new FluentWait<WebDriver>(getDriver())
			.withTimeout(java.time.Duration.ofSeconds(50)).pollingEvery(java.time.Duration.ofSeconds(5))
			.ignoring(NoSuchElementException.class);

	public static WebDriver getDriver() {
		return driver;
	}

	public void scrolToElement(WebElement element) throws Throwable {

		JavascriptExecutor jse = (JavascriptExecutor) getDriver();
		jse.executeScript("arguments[0].scrollIntoView({block: 'center', inline: 'nearest'})", element);
	}

	public WebDriverWait getWait() {
		return wait;
	}

// to refresh documents list
	public List<WebElement> listRefreshedDocs() throws Throwable {
		List<WebElement> allDocs;
		Thread.sleep(500);
		allDocs = getDriver().findElements(ElementBuy.M_ALL_DOC_UPLOADER.get());
		if (!allDocs.get(0).isDisplayed())
			allDocs = getDriver().findElements(ElementBuy.ALL_DOC_UPLOADER.get());

		if (allDocs.size() == 0) {
			allDocs = getDriver().findElements(ElementReload.ALL_DOC_UPLOADER.get());
		}
		return allDocs;
	}

	public void replacePanModalOpened() throws Throwable {
		isPanMisMatch = false;
		BuyOrderCurrency.landedForexScreen(10);

		try {
			for (int i = 0; i <= 3; i++) {

				if (actualHeaderName.contains("customer") || actualHeaderName.contains("sender")) {
					listPanReplaceDialog = getDriver().findElements(ElementBuy.PAN_REPLACE_DIALOG.get());
					fwait.until(ExpectedConditions.invisibilityOfElementLocated(ElementBuy.LOADER.get()));

					if (!panValidationFail && listPanReplaceDialog.get(0).isDisplayed()) {
						isPanMisMatch = true;
						WebElement replacePanNameBtn = fwait.until(
								ExpectedConditions.visibilityOfElementLocated(ElementBuy.MODAL_PAN_REPLACE.get()));
						String panName = getDriver().findElement(ElementBuy.PAN_NAME.get()).getText();
						Thread.sleep(1500);
						fwait.until(ExpectedConditions.visibilityOf(replacePanNameBtn));
						jse.executeScript("arguments[0].click()", replacePanNameBtn);
						fwait.until(ExpectedConditions.invisibilityOfElementLocated(ElementBuy.LOADER.get()));
						System.out.println(
								"Pan name Mismatch '" + isPanMisMatch + "' and replaced with " + "'" + panName + "'");
						// sometime panmodal not closing on first click
						listPanReplaceDialog = getDriver().findElements(ElementBuy.PAN_REPLACE_DIALOG.get());
						if (listPanReplaceDialog.size() > 0 && listPanReplaceDialog.get(0).isDisplayed())
							jse.executeScript("arguments[0].click()", replacePanNameBtn);
						fwait.until(ExpectedConditions.invisibilityOfAllElements(replacePanNameBtn));
						break;
					}

				} else if (i == 3) {
					System.out.println("Pan/order name might be matched. So is continued to next section");
				}
				Thread.sleep(2000);
			}

		} catch (Exception e) {

			System.err.println("seems something not right for pan modal/Pan service Down");
		}
	}

	// order Summary charges details method
	public HashMap<String, Float> orderSummary() {
		charges = null;
		// below List get all right side value of order summary and 0 index is the total
		// amount
		getDriver().manage().timeouts().implicitlyWait(java.time.Duration.ofSeconds(10));
		List<WebElement> listkey = getDriver().findElements(ElementBuy.OSUMARY_KEY.get());
		List<WebElement> listValue = getDriver().findElements(ElementBuy.OSUMARY_VALUE.get());
		List<WebElement> listkeyAddons = getDriver().findElements(ElementBuy.OSUMARY_KEY_ADDONS.get());
		List<WebElement> listValueAddons = getDriver().findElements(ElementBuy.OSUMARY_VALUE_ADONS.get());
		int sizeValues = listValue.size();
		int sizeAddOnsValues = listValueAddons.size();
		HashMap<String, Float> chargesApplied = new HashMap<String, Float>();

		for (int i = 0; i < sizeValues; i++) {
			String key = listkey.get(i).getText().toLowerCase();
			Float value = Float.parseFloat(listValue.get(i).getText().replaceAll("[^0-9\\.]", ""));
			chargesApplied.put(key, value);
		}

		for (int i = 0; i < sizeAddOnsValues; i++) {
			String addonkey = listkeyAddons.get(i).getText().toLowerCase();
			Float addonvalue = Float.parseFloat(listValueAddons.get(i).getText().replaceAll("[^0-9\\.]", ""));
			chargesApplied.put(addonkey, addonvalue);
		}
		return chargesApplied;
	}

	public void orderSummaryCharges() throws Throwable {
		for (int i = 0; i < 3; i++) {
			Thread.sleep(3000);
			WebElement grandTotalElement = getDriver().findElement(ElementBuy.GRAND_TOTAL_AMNT.get());
			scrolToElement(grandTotalElement);
			String grandAmountTextString = grandTotalElement.getText();
			if (grandAmountTextString != null) {
				charges = orderSummary();
				simCharge = charges.get(addOnSimChargeKey);
				bankFee = charges.get(bankFeeKey);
				nostroChargeRemit = charges.get(nostroKey);
				gst = charges.get(gstKey);
				cardSpecific = charges.get(cardSpecificChargeKey);
				grandTotal = Float.parseFloat(grandAmountTextString.replaceAll("[^0-9\\.]", ""));
				servCharge = charges.get(serviceChargeKey);
				totalAmount = charges.get(totalKey);
				tcsCharge = charges.get(tcsKey);
				purposeSelectedCharge = charges.get(addlpurposeChargekey);
				break;
			}
		}

	}

	// razorpay pay now button handle
	public void razorPayNow() throws Throwable {
		// sometime razorpay is opened late

		try {
			for (int i = 0; i < 3; i++) {
				Thread.sleep(1000);
				List<WebElement> listNewPayNowBtn = getDriver().findElements(ElementBuy.NEW_PAY_BTN.get());

				if (listNewPayNowBtn.size() > 0 && listNewPayNowBtn.get(0).isEnabled()) {

					WebElement newPaybtn = listNewPayNowBtn.get(0);
					scrolToElement(newPaybtn);
					Thread.sleep(1000);
					jse.executeScript("arguments[0].click()", newPaybtn); // new razorpay UI
					// for card details with out save
					Thread.sleep(1000);
					List<WebElement> listPayWithOut = getDriver().findElements(ElementBuy.PAY_WITH_OUT_SAVE.get());
					if (listPayWithOut.size() > 0 && listPayWithOut.get(0).isDisplayed()) {
						listPayWithOut.get(0).click();
					}
					break;
				}
			}

		} catch (Throwable e) {
			System.err.println("Something not right-" + e.getMessage());

		}
	}

	public void inputRemarks(String text) throws Throwable {
		Thread.sleep(1500);
		List<WebElement> listRemarksInstruction = getDriver().findElements(ElementBuy.SPECIAL_INSTRUCTION.get());
		for (WebElement secialInst : listRemarksInstruction) {
			if (secialInst.isDisplayed()) {
				secialInst.sendKeys(text);
			}
		}
	}

	public void confirmOrder() throws Throwable {
		Thread.sleep(1000);
		List<WebElement> listConfirmInput = getDriver().findElements(ElementBuy.I_DCLARATION_INPUT.get());
		List<WebElement> listAllDeclarations = getDriver().findElements(ElementBuy.I_DECLARATION.get());
		List<WebElement> listConfirmBtn = getDriver().findElements(ElementUnload.CONFIRM_ORDER.get());

		if (listAllDeclarations.size() > 0) {
			int i = 0;
			for (WebElement declaration : listAllDeclarations) {
				if (declaration.isDisplayed() && !(listConfirmInput.get(i).isSelected())) {
					scrolToElement(declaration);
					declaration.click();
					break;
				}
				i++;

			}

		}
		// in case there is no payment to be made in order will confirm order only
		if (listConfirmBtn.size() > 0 && !paymentRequiredForOrder) {
			for (WebElement confirmOrderNoPayment : listConfirmBtn) {
				scrolToElement(confirmOrderNoPayment);
				if (confirmOrderNoPayment.isDisplayed()) {
					paymentRequiredForOrder = false;
					fwait.until(ExpectedConditions.invisibilityOfElementLocated(ElementBuy.LOADER.get()));
					confirmOrderNoPayment.click();
					requiredPayMode = "No adv/fullpayment is done for this order";
					break;
				}
			}
		}
	}

	// this method will use in review screen only
	public void tcsModalClose() throws Throwable {
		roundOffDBTcsApplicable = 0;
		tcsVersionOne = false;
		tcsVersionTwo = false;
		tcsVersionThree = false;
		// tcs modal;
		List<WebElement> listTcsOne = null;
		List<WebElement> listTcsTwo = null;
		List<WebElement> listTcsThree = null;

		Float dbTcsApplicable = null; // it is used for tcsV1 total tcs applicable
		String totalAmtString = null;
		String percentageString = null;
		percentage = null;
		String tcsAppliedString = null;
		modalTcsFinalApplied = null;
		previousAmt = null;
		finYer = 0;
		int month = LocalDate.now().getMonthValue();
		if (month >= 1 && month <= 4) {
			finYer = LocalDate.now().getYear();
		} else if (month >= 5 && month <= 12) {
			finYer = LocalDate.now().plusYears(1).getYear();
		}

		for (int j = 0; j < 3; j++) {
			Thread.sleep(2000);
			listTcsThree = getDriver().findElements(ElementBuy.TCS_THREE_YES.get());
			listTcsOne = getDriver().findElements(ElementBuy.OLD_TCS_DIALOG.get());
			if (listTcsOne.size() == 0)
				listTcsTwo = getDriver().findElements(ElementBuy.NEW_TCS_DIALOG.get()); // tcs v2

			// common close button
			List<WebElement> ListTcsModalClose = getDriver().findElements(ElementBuy.TCS_CLOSE.get());

			if (listTcsOne != null && listTcsOne.size() > 0 && listTcsOne.get(0).isDisplayed()) {
				tcsVersionOne = true;
				// modal name print
				System.out.println("TCS verion 1.0 Modal Displayed");

				totalAmtString = fwait
						.until(ExpectedConditions.visibilityOfElementLocated(ElementBuy.TCS_TOTAL_AMOUNT.get()))
						.getText();
				dbTcsApplicable = Float.parseFloat(totalAmtString.replaceAll("[^0-9\\.]", ""));

				percentageString = getDriver().findElement(ElementBuy.TCS_PERCENTAGE.get()).getText();
				percentage = Float.parseFloat(percentageString.replaceAll("[^0-9\\.]", ""));
				tcsAppliedString = getDriver().findElement(ElementBuy.TCS_APPLIED.get()).getText();
				modalTcsFinalApplied = Float.parseFloat(tcsAppliedString.replaceAll("[^0-9\\.]", ""));
				Thread.sleep(500);
				List<WebElement> listViewtransactions = getDriver().findElements(ElementBuy.TCS_VIEW_TRN.get());
				if (listViewtransactions.size() > 0 && listViewtransactions.get(0).isDisplayed()) {
					WebElement viewTrnTcs = listViewtransactions.get(0);
					scrolToElement(viewTrnTcs);
					viewTrnTcs.click();

					System.out.println("-----------------Preveious transactions are below-----------------");
					List<WebElement> prevTrns = fwait
							.until(ExpectedConditions.visibilityOfAllElementsLocatedBy(ElementBuy.TCS_PREV_TRN.get()));
					System.out.println("-------------------------------------------------------------------");
					System.out.printf("%-10s %20s %20s %n", "Amount", "Order type", "Date");
					System.out.println("-------------------------------------------------------------------");
					int pts = prevTrns.size();
					for (int i = 0; i < pts; i += 3) {

						String amount = prevTrns.get(i).getText();
						String type = prevTrns.get(i + 1).getText();
						String date = prevTrns.get(i + 2).getText();
						System.out.printf("%-10s %20s %23s %n", amount, type, date);

					}

					System.out.println("-------------------------------------------------------------------");
				}
				System.out.println("TCS collected as per modal " + "'" + modalTcsFinalApplied + "'" + " at "
						+ percentageString + " on TCS applicable Amount " + "'" + dbTcsApplicable + "'" + "(more than "
						+ tcsThresholdAmount + " for the current FY-" + finYer + ")");
				WebElement okTcsclose = ListTcsModalClose.get(0);
				jse.executeScript("arguments[0].click()", okTcsclose);
				break;

			} else if (listTcsTwo != null && listTcsTwo.size() > 0 && listTcsTwo.get(0).isDisplayed()) {
				tcsVersionTwo = true;
				System.out.println("New TCS version 2.0 Modal Displayed");

				Thread.sleep(500);
				List<WebElement> listTcsDtls = getDriver().findElements(ElementBuy.NEW_TCS_DETAILS.get());
				totalAmtString = listTcsDtls.get(1).getText();
				percentageString = listTcsDtls.get(0).getText();
				percentage = Float.parseFloat(percentageString.replaceAll("[^0-9\\.]", ""));
				tcsAppliedString = listTcsDtls.get(2).getText();
				modalTcsFinalApplied = Float.parseFloat(tcsAppliedString.replaceAll("[^0-9\\.]", ""));
				System.out.println("TCS collected as per modal " + "'" + modalTcsFinalApplied + "'" + " at " + "'"
						+ percentageString + "'" + " on TCS applicable " + "'" + totalAmtString + "'");
				WebElement okTcsclose = ListTcsModalClose.get(1);
				jse.executeScript("arguments[0].click()", okTcsclose);

				break;
			} else if (listTcsThree != null && listTcsThree.size() > 0 && listTcsThree.get(0).isDisplayed()) {
				tcsVersionThree = true;
				System.out.println("New TCS version 3.0 Modal Displayed");
				checkTcsMandatory();
				tcsNoSelectedCheck();
				for (WebElement tcsConsent : listTcsThree) {
					if (tcsConsent.isDisplayed()) {
						scrolToElement(tcsConsent);
						tcsConsent.click();
						break;
					}
				}

				Thread.sleep(2000);
				List<WebElement> tcsDialogForTcsThreeAfterYes = getDriver()
						.findElements(ElementBuy.THREE_TCS_DIALOG.get());
				if (tcsDialogForTcsThreeAfterYes.size() > 0 && tcsDialogForTcsThreeAfterYes.get(0).isDisplayed()) {
					List<WebElement> inputPreviousAmount = getDriver().findElements(ElementBuy.TCS_THREE_INPUT.get());
					for (WebElement inputtext : inputPreviousAmount) {
						if (inputtext.isDisplayed()) {
							String prevAmount = inputtext.getAttribute("value");
							if (prevAmount.equalsIgnoreCase("0") || prevAmount == null) {
								inputtext.clear();
								inputtext.sendKeys(TestRunner.previousAmtString);
								break;
							} else {
								TestRunner.previousAmtString = inputtext.getAttribute("value");
							}

						}

					}
					previousAmt = Float.parseFloat(TestRunner.previousAmtString.replaceAll("[^0-9\\.]", ""));
					WebElement checkBoxIconfirm = getDriver().findElement(ElementBuy.TCS_2YRS_NOTFILLED_INPUT.get());
					if (!checkBoxIconfirm.isSelected()) {
						getDriver().findElement(ElementBuy.TCS_2YRS_CHECK.get()).click();
					}

					Thread.sleep(1000);
					boolean isEducationLoanShown = false;
					List<WebElement> listEducationText = getDriver().findElements(ElementBuy.IS_EDUCATION_TEXT.get());
					int i = 0;
					for (WebElement educationLoanCheck : listEducationText) {
						if (educationLoanCheck.isDisplayed()) {
							List<WebElement> listEduConfirm = getDriver()
									.findElements(ElementBuy.IS_EDUCATION_INPUT.get());
							if (!listEduConfirm.get(i).isSelected()) {
								scrolToElement(educationLoanCheck);
								educationLoanCheck.click();
								isEducationLoanShown = true;
								getDriver().findElement(ElementBuy.FILE_UPLOAD_EDU.get())
										.sendKeys(BuyOrderCurrency.filePath + "dummy" + ".pdf");
								fwait.until(ExpectedConditions
										.invisibilityOfElementLocated(ElementBuy.UPLOADER_ICON.get()));
								break;
							}
						}
						i++;
					}

					// currently we are checking for buy card only as we know BMF is accepting the
					// Edu loan
					if (orderType.contains("buy - forex card") && selectedPurpose != null
							&& selectedPurpose.contains("education")) {
						Assert.assertTrue("is Education check box not shown !!", isEducationLoanShown);
					}
					WebElement applyTcs = getDriver().findElement(ElementBuy.CAL_APPLY_TCS.get());
					scrolToElement(applyTcs);
					applyTcs.click();

					fwait.until(ExpectedConditions.invisibilityOfElementLocated(ElementBuy.LOADER.get()));
					for (int k = 0; k < 3; k++) {
						Thread.sleep(1000);
						List<WebElement> listTcsCalculated = getDriver()
								.findElements(ElementBuy.THREE_TCS_CALCULATED.get());
						if (listTcsCalculated.size() > 0 && listTcsCalculated.get(0).isDisplayed()) {
							totalAmtString = fwait.until(
									ExpectedConditions.visibilityOfElementLocated(ElementBuy.TCS_THREE_TCS_APP.get()))
									.getText();
							dbTcsApplicable = Float.parseFloat(totalAmtString.replaceAll("[^0-9\\.]", ""));

							percentageString = getDriver().findElement(ElementBuy.TCS_THREE_PER.get()).getText();
							percentage = Float.parseFloat(percentageString.replaceAll("[^0-9\\.]", ""));
							tcsAppliedString = getDriver().findElement(ElementBuy.TCS_THREE_APPLIED.get()).getText();
							modalTcsFinalApplied = Float.parseFloat(tcsAppliedString.replaceAll("[^0-9\\.]", ""));

							WebElement okClose = getDriver().findElement(ElementBuy.TCS_THREE_CLOSE.get());
							scrolToElement(okClose);
							okClose.click();

							fwait.until(ExpectedConditions.invisibilityOf(okClose));
							fwait.until(ExpectedConditions.invisibilityOfElementLocated(ElementBuy.LOADER.get()));
							break;
						}
					}
				}
				break;
			}

		}
		if (dbTcsApplicable != null)
			roundOffDBTcsApplicable = Math.round(dbTcsApplicable);
	}

	public void tcscalculate() throws Throwable {
		tcsCalculatation = 0.0f;
		orderSummaryCharges();
		if (istcsAppliedUnderSummary && roundOffTcsApplicableCalculated != 0 && percentage != null) {
			tcsCalculatation = (roundOffTcsApplicableCalculated * percentage) / 100;

			if (tcsVersionOne)
				Assert.assertEquals("TCS V1.0 calcuation is wrong ", tcsCalculatation, tcsCharge, 0.5);
			else if (tcsVersionTwo)
				Assert.assertEquals("TCS V2.0 calcuation is wrong ", tcsCalculatation, tcsCharge, 0.5);
			else if (tcsVersionThree)
				Assert.assertEquals("TCS V3.0 calcuation is wrong ", tcsCalculatation, tcsCharge, 0.5);

		}

	}

	public void addNewAddress() throws Throwable {

		Thread.sleep(1000);
		List<WebElement> addNewAddress = getDriver().findElements(ElementBuy.ADDRESS_PHONE_NO.get());
		for (int i = 0; i < 3; i++) {
			if (addNewAddress.size() > 0 && addNewAddress.get(0).isDisplayed()) {
				WebElement CoordinationPhone = addNewAddress.get(0);
				System.out.println("Since there is no address,So adding new address & Saved");
				if (CoordinationPhone.isDisplayed()) {
					CoordinationPhone.sendKeys("9853048678");
					getDriver().findElement(ElementBuy.ADDRESS_STREET_NAME.get()).sendKeys("State Highway 39");
					getDriver().findElement(ElementBuy.ADDRESS_PIN_NO.get()).sendKeys("110076");
					getDriver().findElement(ElementBuy.ADDRESS_LANDMARK.get()).sendKeys("NEAR TO BMF");

					WebElement citySelect = getDriver().findElement(ElementBuy.ADDRESS_CITY.get());
					WebElement stateSelect = getDriver().findElement(ElementBuy.ADDRESS_STATE.get());

					if (citySelect.isEnabled()) {
						Select selectCity = new Select(citySelect);
						selectCity.selectByVisibleText("Delhi");

					}
					if (stateSelect.isEnabled()) {
						Select selectState = new Select(citySelect);
						selectState.selectByVisibleText("Delhi");

					}

					break;
				} else {
					System.out.println("Add new section is not shown,Retyrying..");
				}
			}

		}
	}

	public void traveldateselect() throws Throwable {
		LocalDate traveldate = null;
		boolean dateSelected = false;
		String dateCloned = null;
		int datePickerMonth = 0; // to be select for date of return and departure
		WebElement nextMonth = null;
		WebElement prevMonth = null;
		LocalDate today = LocalDate.now();
		if (orderType.contains("reload")) {
			if (CardReload.expectedtrip.contains("new"))
				traveldate = today.plusDays(travelBeforeAfterToday);
			if (CardReload.expectedtrip.contains("current"))
				traveldate = today.minusDays(travelBeforeAfterToday);
		} else {
			traveldate = today.plusDays(travelBeforeAfterToday);
		}

		LocalDate returnDate = today.plusDays(returnAfterToday);

		fwait.until(ExpectedConditions.elementToBeClickable(ElementBuy.DATE_PICKER.get()));
		Thread.sleep(1000);
		List<WebElement> listOfDates = getDriver().findElements(ElementBuy.DATES.get());

		int currentMonth = LocalDate.now().getMonthValue();
		if (listOfDates.size() > 0) {
			for (int j = 0; j < 12; j++) {
				nextMonth = getDriver().findElement(ElementBuy.MONTH_NEXT.get());
				prevMonth = getDriver().findElement(ElementBuy.MONTH_PREV.get());

				datePickerMonth = Integer
						.parseInt(listOfDates.get(j).getAttribute("data-month").replaceAll("[^0-9\\.]", "")) + 1; // as
				if (traveldate.getMonthValue() == datePickerMonth)
					break; // January=0
				else if (orderType.contains("reload")) {

					if (nextMonth.isDisplayed()
							&& ((currentMonth == 12 || datePickerMonth == 12)
									&& traveldate.getMonthValue() < datePickerMonth)
							|| (traveldate.getMonthValue() > currentMonth
									|| traveldate.getMonthValue() > datePickerMonth)) {

						nextMonth.click();
					} else if (prevMonth.isDisplayed()
							&& (traveldate.getMonthValue() < currentMonth && currentMonth == datePickerMonth)
							|| (traveldate.getMonthValue() > datePickerMonth
									|| (traveldate.getMonthValue() < currentMonth && datePickerMonth == 1))) {
						prevMonth.click();
					}
				} else {
					if (nextMonth.isDisplayed() && traveldate.getMonthValue() > currentMonth
							|| (traveldate.getMonthValue() < currentMonth && datePickerMonth == 12)) {
						nextMonth.click();
					}
				}
				Thread.sleep(1000);
				listOfDates = getDriver().findElements(ElementBuy.DATES.get());

			}

			for (WebElement dates : listOfDates) {

				int datetoSelect = Integer.parseInt(dates.getText().replaceAll("[^0-9\\.]", ""));

				if (dates.isDisplayed() && traveldate.getDayOfMonth() == datetoSelect) {
					Assert.assertFalse("Travel date can't be selected after 60 days from today's date !!",
							traveldate.isAfter(today.plusDays(60)));
					dates.click();
					dateSelected = true;
					System.out.println("Current date (YYYY-MM-DD)- " + LocalDate.now());
					System.out.println("Departure date selected (YYYY-MM-DD )- " + traveldate);
					break;

				}

			}
			Assume.assumeTrue("Seems expected travel date is not shown/Disabled or is after 60 days", dateSelected);
		}

		// Return date is handled here for reload
		List<WebElement> listRturnSelect = getDriver().findElements(ElementReload.RETURN_DATE.get());
		if (listRturnSelect.size() == 0 || (listRturnSelect.size() > 0 && !listRturnSelect.get(0).isDisplayed()))
			// Return date is handled here for sim
			listRturnSelect = getDriver().findElements(ElementBuy.SIM_RETURN.get());
		else if (listRturnSelect.size() == 0 || (listRturnSelect.size() > 0 && !listRturnSelect.get(0).isDisplayed()))
			// Return date is handled here for buy
			listRturnSelect = getDriver().findElements(ElementBuy.RETURN_DATE.get());
		if (listRturnSelect.size() > 0 && listRturnSelect.get(0).isEnabled()) {
			listRturnSelect.get(0).click();
			dateCloned = listRturnSelect.get(0).getAttribute("value");
			// if( today < dateCloned)
			// Assert.assertFalse("Date should non editable !!",
			// webElementTravelStartSelect.isEnabled());

			fwait.until(ExpectedConditions.elementToBeClickable(ElementBuy.DATE_PICKER.get()));
			Thread.sleep(1000);
			listOfDates = getDriver().findElements(ElementBuy.DATES.get());
			if (listOfDates.size() > 0)
				for (int k = 0; k < 3; k++) {
					nextMonth = getDriver().findElement(ElementBuy.MONTH_NEXT.get());
					datePickerMonth = Integer
							.parseInt(listOfDates.get(k).getAttribute("data-month").replaceAll("[^0-9\\.]", "")) + 1;
					if (returnDate.getMonthValue() == datePickerMonth) {
						break;
					} else if (nextMonth.isDisplayed() && returnDate.getMonthValue() > datePickerMonth
							|| (returnDate.getMonthValue() < datePickerMonth && datePickerMonth == 12)) {
						nextMonth.click();
					}
					Thread.sleep(1000);
					listOfDates = getDriver().findElements(ElementBuy.DATES.get());
				}

			for (WebElement returnDt : listOfDates) {

				int returndatetoSelect = Integer.parseInt(returnDt.getText().replaceAll("[^0-9\\.]", ""));
				if (returnDate.getDayOfMonth() == returndatetoSelect) {
					returnDt.click();
					fwait.until(ExpectedConditions.invisibilityOfElementLocated(ElementBuy.DATE_PICKER.get()));
					System.out.println("Return date selected (YYYY-MM-DD)- " + returnDate);
					break;
				}

			}
		}

	}

	public void ocrCheck() throws Throwable {
		isDiscrepancyModalShown = false;
		List<String> listodErrorsInDoc = new ArrayList<String>();
		listodErrorsInDoc.add("mismatch between passenger name and name on pan");
		listodErrorsInDoc.add("no passport detected");
		listodErrorsInDoc.add("incorrect/Wrong passport type uploaded");
		listodErrorsInDoc.add("name mismatch on pan card and passport");
		listodErrorsInDoc.add("no data found on the air ticket");
		listodErrorsInDoc.add("no data found on pan card");

		String actualErrors = null;
		Thread.sleep(2000);
		List<WebElement> listDocDiscrepancyWarning = getDriver().findElements(ElementBuy.WARNING_DOC_DISCREPANCY.get());
		List<WebElement> listDiscDialoge = getDriver().findElements(ElementBuy.DOCUMENT_DISC_DIALOGE.get());
		if (listDocDiscrepancyWarning.size() > 0 && listDocDiscrepancyWarning.get(0).isDisplayed()
				&& listDiscDialoge.size() == 0 && BuyOrderCurrency.allDocUploaded) {
			listDocDiscrepancyWarning.get(0).click();
		}
		Thread.sleep(2000);
		listDiscDialoge = getDriver().findElements(ElementBuy.DOCUMENT_DISC_DIALOGE.get());
		List<WebElement> listErrorText = getDriver().findElements(ElementBuy.DOC_DISC_ERROR.get());
		if (listDocDiscrepancyWarning.size() > 0
				&& (listDiscDialoge.size() > 0 && listDiscDialoge.get(0).isDisplayed())) {
			isDiscrepancyModalShown = true;
			for (WebElement error : listErrorText) {

				scrolToElement(error);
				actualErrors = error.getText().toLowerCase().replaceAll("[^A-Za-z ]", "");
				if (listodErrorsInDoc.contains(actualErrors)) {
					System.err.println("Errors in Document for -" + actualErrors);
					Thread.sleep(1000);
					List<WebElement> listOk = getDriver().findElements(ElementBuy.DOC_DISC_OK.get());
					if (listOk.size() > 0 && listOk.get(0).isDisplayed()) {
						jse.executeScript("arguments[0].click()", listOk.get(0));
						fwait.until(ExpectedConditions.invisibilityOf(listOk.get(0)));
					}
				}

			}

		}

	}

	public void orderRef(int maxRetry) throws Throwable {

		List<WebElement> listOrdRef = null;
		orderRefGenerated = false;
		if (refNumber != null && !refNumber.toLowerCase().contains("sim"))
			refNumber = null;

		try {

			for (int i = 0; i <= maxRetry; i++) {
				getDriver().switchTo().defaultContent();
				listOrdRef = getDriver().findElements(ElementBuy.ORD_REF.get());

				if (listOrdRef.size() > 0 && listOrdRef.get(0).isDisplayed()
						&& !product.toLowerCase().contains("sim")) {

					refNumber = listOrdRef.get(0).getText().trim();
					if (refNumber.toLowerCase().contains("fx")) {
						orderRefGenerated = true;

					}

				} else if (product.toLowerCase().contains("sim") && refNumber != null
						&& refNumber.toLowerCase().contains("sim")) {
					orderRefGenerated = true;

				}

				// if teh order ref still not true
				if (!product.toLowerCase().contains("sim") && !orderRefGenerated && i == (maxRetry - 1)) {
					System.out.println("Waiting to be generate of ref no... ");
					getDriver().navigate().refresh();
					orderRefGenerated = fwait
							.until(ExpectedConditions.textToBePresentInElementLocated(ElementBuy.ORD_REF.get(), "FX"));

				}

				if (orderRefGenerated) {
					String pageTitle = getDriver().getTitle();
					System.out.println("Web title is " + pageTitle);
					System.out.println("REFERENCE NUMBER- " + "'" + refNumber + "'");
					List<WebElement> listThankYouAgent = getDriver().findElements(ElementBuy.THANK_YOU_AGENT.get());
					WebElement ThankYou = null;
					if (!product.toLowerCase().contains("sim")) {
						if (listThankYouAgent.size() > 0) {
							// for agent
							ThankYou = listThankYouAgent.get(0);

						} else {
							// for normal www orders
							ThankYou = fwait.until(
									ExpectedConditions.visibilityOfElementLocated(ElementBuy.THANK_YOU_BMF.get()));
						}
					} else {

						ThankYou = fwait
								.until(ExpectedConditions.visibilityOfElementLocated(ElementBuy.SIM_INFO.get()));
					}
					if (ThankYou != null) {
						System.out.println("MESSAGE- " + "'" + ThankYou.getText() + "'");

					}

					break;
				}
				Thread.sleep(5000);
			}
		} catch (Exception e) {
			System.out.println("Order ref number failed to generate-" + e.getMessage());

		}

	}

	public void switchToSection(String section) throws Throwable {
		List<WebElement> listEditHeader = getDriver().findElements(ElementBuy.ORDER_SECTION_EDIT.get());
		List<WebElement> listHeaderNames = getDriver().findElements(ElementBuy.HEADER_NAME.get());
		if (listEditHeader.size() > 0 && listHeaderNames.size() > 0) {
			int i = 0;
			for (WebElement headername : listHeaderNames) {

				if (headername.isDisplayed() && headername.getText().toLowerCase().contains(section.toLowerCase())) {
					listEditHeader.get(i).click();
					break;
				}
				i++;
			}
		}
	}

	public void upiAccount(String upiId, String accNumber, String ifscCd) throws Throwable {

		getDriver().findElement(ElementBuy.UPI_INPUT.get()).sendKeys(upiId);
		// -----------------BMFDEV-3810----------------
		boolean upiAccountShown = false;
		List<WebElement> listUpiAccount = getDriver().findElements(ElementBuy.UPI_ACCOUNT.get());
		if (listUpiAccount.size() > 0 && listUpiAccount.get(0).isDisplayed()) {
			upiAccountShown = true;
			listUpiAccount.get(0).sendKeys(accNumber);
			getDriver().findElement(ElementBuy.UPI_IFSC.get()).sendKeys(ifscCd);
		}

		Assert.assertTrue("UPI payment mode should be With account detail linked to Vpa ID !!", upiAccountShown);
		// -----------------BMFDEV-3810----------------
	}

	public void getBrowserConsoleLogs() throws Throwable {
		Thread.sleep(2000);
		boolean isUncaughtTypeError = false;

		LogEntries logEntries = getDriver().manage().logs().get("browser");
		for (LogEntry entry : logEntries) {
			String errorLogType = entry.getLevel().toString();
			String errorLog = entry.getMessage().toString();
			if (errorLog.toLowerCase().contains("uncaught typeerror")) {
				System.err.println(new Date(entry.getTimestamp()) + " ,Error LogType: " + errorLogType
						+ ", Error Console Log message: " + errorLog);
				isUncaughtTypeError = true;
				Thread.sleep(500);
			}
		}

		if (isUncaughtTypeError)
			System.out.println("There is a isUncaughtTypeError see above console logs ( In case Lead not Created !!)");

	}

	// this method is used for all order to check box click
	public void eligibilityIconfirm() throws Throwable {
		Thread.sleep(1000);
		WebElement iConfirm = null;
		WebElement iconfirmCheckBox = getDriver().findElement(ElementReload.INPUT_ICONFIRM_CHECKBOX.get());
		if (!iconfirmCheckBox.isSelected()) {
			if (orderType.contains("sell"))
				iConfirm = getDriver().findElement(ElementBuy.ELIGIBILTY_ICONFIRM_SELL.get());
			else
				iConfirm = getDriver().findElement(ElementBuy.ELIGIBILITY_I_CONFIRM.get());

			if (iConfirm != null) {
				scrolToElement(iConfirm);
				iConfirm.click();
			}
		}

	}

	public void upiLimit() throws Throwable {
		Thread.sleep(1000);
		Float upiMaxlimit = 100000.00f;
		List<WebElement> listUpiLimitExceedModal = getDriver().findElements(ElementBuy.UPI_LIMIT_EXCEED.get());
		for (WebElement upiLimit : listUpiLimitExceedModal) {
			if (upiLimit.isDisplayed()) {
				String upiLimitError = getDriver().findElement(ElementBuy.UPI_ERROR.get()).getText();
				if (!upiLimitError.contains("1 Lakh"))
					upiMaxlimit = Float.parseFloat(upiLimitError.replaceAll("[^0-9\\.]", ""));
				upiLimit.click();

				Assume.assumeTrue("this order has been Terminated as the Total amount (" + grandTotal + ") >"
						+ upiMaxlimit + "\n" + " ,which is more than bank's Maximum transaction Allowed For -"
						+ requiredPayMode.toUpperCase() + "- Test Skipped", grandTotal <= upiMaxlimit);
			}
		}
	}

	public void tatInfo() throws Throwable {
		// tat info changes are not part of 1.2.0 so commented the asserts
		boolean tatInfoShown = false;
		boolean tatisRelevant = false;
		if (forexPageLoaded && actualHeaderName != null && !orderRefGenerated) {
			BuyOrderCurrency.landedForexScreen(10);
		}
		Thread.sleep(500);
		List<WebElement> listTatinfo = getDriver().findElements(ElementBuy.TAT_INFO.get());
		for (WebElement tataInfo : listTatinfo) {
			scrolToElement(tataInfo);
			if (tataInfo.isDisplayed()) {
				tatInfoShown = true;
				String tatMsg = tataInfo.getText().toLowerCase();
				System.out.println("Tat info Shown- " + tatMsg.toUpperCase());
				if (tatMsg.contains(orderType)
						|| (orderType.contains("buy") && tatMsg.contains("attempted on the next working"))
						|| (orderType.contains("sell") && tatMsg.contains("pick"))
						|| (orderType.contains("reload") && tatMsg.contains("reload"))
						|| (orderType.contains("unload") && tatMsg.contains("unload")
								|| (orderType.contains("remittance") && tatMsg.contains("remittance")))) {
					tatisRelevant = true;
				}
				Assert.assertTrue("Tat is Shown for Wrong order Type :" + orderType.toUpperCase(), tatisRelevant);
				break;
			}
		}

		if (actualHeaderName.contains("home screen") || actualHeaderName.contains("order processing")
				|| actualHeaderName.contains("review") || orderRefGenerated) {
			if ((orderType.contains("sell") || orderType.contains("buy"))
					&& (actualHeaderName.contains("review") || orderRefGenerated)) {
				Assert.assertFalse("Tat info Should Not shown under Section :" + actualHeaderName.toUpperCase()
						+ ", order type:" + orderType.toUpperCase(), tatInfoShown);
			} else {
//				Assert.assertTrue("Tat info Not shown under Section :" + actualHeaderName.toUpperCase()
//						+ ", order type:" + orderType.toUpperCase(), tatInfoShown);

				// BMFDEV-1672- above tat is to be released in 1.2.1 so commented
			}
		}

	}

	public void paynConfirm() throws Throwable {
		boolean cancellationPolicyShown = false;
		Thread.sleep(1000);
		List<WebElement> cancellationCheckBoxList = getDriver().findElements(ElementBuy.CANCELATION_POLICY.get());

		int i = 0;
		for (WebElement cPolicy : cancellationCheckBoxList) {
			List<WebElement> inputcancellationList = getDriver()
					.findElements(ElementBuy.INPUT_CANCELLATION_POLICY.get());
			if (cPolicy.isDisplayed() && inputcancellationList.size() > 0) {

				cancellationPolicyShown = true;
				if (!inputcancellationList.get(i).isSelected())
					cPolicy.click();
				break;
			}
			i++;
			Thread.sleep(500);
		}

		if (offlinePayment && !simPayment)
			Assert.assertTrue("cancellation policy not shown under offline payments", cancellationPolicyShown);

		Thread.sleep(1500);
		if (listpayNowAdvBtn == null)
			listpayNowAdvBtn = getDriver().findElements(ElementBuy.OFFLINE_PAY_NOW.get());
		List<WebElement> listPayConfirm = getDriver().findElements(ElementBuy.PAY_CONFIRM.get());
		if (listPayConfirm.size() == 0)
			listPayConfirm = getDriver().findElements(ElementBuy.SIM_PAY_NOW.get());
		for (WebElement payNconfirm : listPayConfirm) {
			if (payNconfirm.isDisplayed()) {
				scrolToElement(payNconfirm);
				jse.executeScript("arguments[0].click()", payNconfirm);
				break;
			}
		}

		for (WebElement advpay : listpayNowAdvBtn) {
			if (advpay.isDisplayed()) {
				scrolToElement(advpay);
				jse.executeScript("arguments[0].click()", advpay);
				break;
			}
		}

		fwait.until(ExpectedConditions.invisibilityOfElementLocated(ElementBuy.LOADER.get()));
	}

	// THis method is to check in case amount is 700000 and tcs previous amount
	// selected On No
	public void tcsNoSelectedCheck() throws Throwable {
		Thread.sleep(500);
		boolean tcsCalculationPendingShown = false;
		List<WebElement> listTcsThreeNo = getDriver().findElements(ElementBuy.TCS_THREE_NO.get());
		if (listTcsThreeNo.size() > 0 && listTcsThreeNo.get(0).isDisplayed()) {

			for (WebElement tcsNo : listTcsThreeNo) {
				if (tcsNo.isDisplayed()) {
					jse.executeScript("arguments[0].click()", tcsNo);
					Thread.sleep(2000);
					List<WebElement> tcsPendingShownList = getDriver().findElements(ElementBuy.TCS_CALU_PENDING.get());
					for (WebElement tcsPendingCal : tcsPendingShownList) {
						if (tcsPendingCal.isDisplayed()) {
							jse.executeScript("arguments[0].click()", tcsPendingCal);
							tcsCalculationPendingShown = true;
							break;
						}
					}
					break;
				}
			}

			if (grandTotal != null && grandTotal > tcsThresholdAmount)
				Assert.assertTrue("TCS calculation pending should Shown for this order Amount-" + grandTotal,
						tcsCalculationPendingShown);
		}

	}

	public void checkTcsMandatory() throws Throwable {
		boolean tcsCtaShown = false;
		boolean tcsMandatoryErrorShown = false;
		if (TestRunner.tcsThree && !(orderType.contains("unload") || orderType.contains("sell"))
				&& (selectedPurpose != null && !selectedPurpose.contains("business"))) {
			paynConfirm();
			Thread.sleep(3000);
			List<WebElement> listTcsThree = getDriver().findElements(ElementBuy.TCS_THREE_YES.get());
			List<WebElement> listFieldReqErrormsg = getDriver().findElements(ElementBuy.TCS_MANDATORY_FIELD.get());
			if (listTcsThree.size() > 0 && listTcsThree.get(0).isDisplayed())
				tcsCtaShown = true;
			if (listFieldReqErrormsg.size() > 0 && listFieldReqErrormsg.get(0).isDisplayed())
				tcsMandatoryErrorShown = true;

			Assert.assertTrue("TCS version 3 CTA not shown", tcsCtaShown);
			Assert.assertTrue("TCS version CTA not chekced- is mandatory To check", tcsMandatoryErrorShown);

		}
	}

	public void editOrder(String toEditproduct, String Amount) throws Throwable {
		orderEdited = false;
		List<WebElement> listProductname = null;
		try {

			if (actualHeaderName.contains("order")) {

				for (int j = 0; j < 3; j++) {
					Thread.sleep(3000);
					int i = 0;
					listProductname = getDriver().findElements(ElementBuy.PRODUCT_NAME.get());
					if (listProductname.size() > 0 && listProductname.get(0).isDisplayed()) {
						for (WebElement products : listProductname) {
							String editProduct = products.getText().toLowerCase();
							if (editProduct.contains(toEditproduct)) {
								scrolToElement(products);
								Thread.sleep(2000);
								List<WebElement> listEditOrder = getDriver()
										.findElements(ElementBuy.ACTION_EDIT_BUTTON.get());
								if (listEditOrder.size() > 0 && listEditOrder.get(i).isDisplayed()) {
									jse.executeScript("arguments[0].click()", listEditOrder.get(i));

									fwait.until(
											ExpectedConditions.invisibilityOfElementLocated(ElementBuy.LOADER.get()));
									Thread.sleep(2000);
									List<WebElement> listAmountTxtField = getDriver()
											.findElements(ElementBuy.ORDER_AMOUNT_INPUT.get());
									for (WebElement editAmount : listAmountTxtField) {
										if (editAmount.isDisplayed()) {
											scrolToElement(editAmount);
											editAmount.clear();
											editAmount.sendKeys(Amount);
											break;
										}
									}
									Thread.sleep(2000);
									List<WebElement> listSave = getDriver()
											.findElements(ElementBuy.SAVE_BTN_ORDER.get());
									for (WebElement save : listSave) {
										if (save.isDisplayed()) {

											jse.executeScript("arguments[0].click()", save);
											orderEdited = true;
											break;
										}

									}

									fwait.until(
											ExpectedConditions.invisibilityOfElementLocated(ElementBuy.LOADER.get()));

								}
								break;
							}
							i++;
						}
						WebElement editOrderContinue = getDriver().findElement(ElementBuy.ORDER_EDIT_SUBMIT.get());
						scrolToElement(editOrderContinue);
						jse.executeScript("arguments[0].click()", editOrderContinue);
						fwait.until(ExpectedConditions.invisibilityOf(editOrderContinue));
						break;
					}
				}
			}
		} catch (Exception e) {

			System.err.println("Unable to edit- " + e.getMessage());
		}
		Assert.assertTrue("Unable to edit currency order to 20000INR !!", orderEdited);
	}

	public void remitBenDecl() throws Throwable {
		// https://jira.bookmyforex.com/browse/BMFDEV-4220
		for (int i = 0; i < 3; i++) {
			Thread.sleep(1500);
			List<WebElement> listOfDecl = getDriver().findElements(ElementRemit.BENEFICIARY_DECLARATION.get());
			if (listOfDecl.size() > 0 && listOfDecl.get(0).isDisplayed()) {
				List<WebElement> inputtransferSelf = getDriver().findElements(ElementRemit.BENE_SELF_INPUT.get());
				if (inputtransferSelf.size() > 0 && !inputtransferSelf.get(0).isSelected()) {
					listOfDecl.get(0).click();
				}
				List<WebElement> inputtransferForeign = getDriver()
						.findElements(ElementRemit.INPUT_TRANSFERFOREIGN.get());
				if (inputtransferForeign.size() > 0 && !inputtransferForeign.get(0).isSelected()) {
					listOfDecl.get(1).click();

				}
				break;
			}
		}
	}

	public void bookOrderLogic(By by) throws Throwable {
		boolean redirectToForex = false;
		boolean bookThisOrderBtnShown = false;
		List<WebElement> bookThisBTNList = null;
		try {
			for (int i = 0; i <= 5; i++) {
				bookThisBTNList = getDriver().findElements(by);
				if (bookThisBTNList.size() > 0 && login && !redirectToForex && bookThisBTNList.get(0).isDisplayed()) {
					bookThisOrderBtnShown = fwait
							.until(ExpectedConditions.textToBePresentInElementLocated(by, "BOOK THIS ORDER"));
					Thread.sleep(2500);
					if (bookThisOrderBtnShown) {
						scrolToElement(bookThisBTNList.get(0));
						jse.executeScript("arguments[0].click()", bookThisBTNList.get(0));
						try {

							redirectToForex = fwait
									.until(ExpectedConditions.invisibilityOfElementWithText(by, "Please wait...."));

						} catch (Exception e) {
							getBrowserConsoleLogs();
						}
						if (redirectToForex)
							break;

					}

				} else if (bookThisBTNList.get(i).isDisplayed()) {
					Thread.sleep(2500);
					scrolToElement(bookThisBTNList.get(i));
					// for guest login cases and for agents www
					jse.executeScript("arguments[0].click()", bookThisBTNList.get(i));
					getBrowserConsoleLogs();
					break;

				}

			}
		} catch (Exception e) {
			getBrowserConsoleLogs();
			System.err.println("Something went wrong to create order" + e.getMessage());

		}
	}

	public void isValidPhone() throws Throwable {
		stringCustPhone = null;
		isPhoneNumValid = false;

		try {
			stringCustPhone = getDriver().findElement(ElementBuy.PHONE_NUM.get()).getAttribute("value");

			// https://jira.bookmyforex.com/browse/BMFDEV-4355
			// To check below
			// 1) Begins with 1 - 9
			// 2) Then contains 9 digits
			Pattern digits = Pattern.compile("^[1-9]\\d{9}$");
			Pattern alphanumeric = Pattern.compile("^[x-xX-X0-9]{10}$");
			if (stringCustPhone != null) {
				// Pattern class contains matcher() method
				// to find matching between given number
				// and regular expression
				Matcher dM = digits.matcher(stringCustPhone);
				Matcher anM = alphanumeric.matcher(stringCustPhone);
				if ((stringCustPhone.matches("\\d+") && dM.matches())
						|| (stringCustPhone.contains("X") && anM.matches())) {
					isPhoneNumValid = true;
				}
			}
		} catch (Exception e) {

			System.out.println("Something went wring for Validating phone nUmber -" + e.getMessage());
		}
		if (stringCustPhone != null)
			Assert.assertTrue(
					"Customer Phone detected 11 digits and due to intial value !! ( " + stringCustPhone + " )",
					isPhoneNumValid);
	}

	public void fatfDeclaration(String section) throws Throwable {

		// ticket num- bmfdev-5043
		String text = "I acknowledge that the BookMyForex card will not be functional in countries such as Vietnam, "
				+ "Turkey, Croatia, the Philippines, and other nations identified by FATF (Financial Action Task Force) "
				+ "as high/ medium risk, with the exception of the United Arab Emirates and South Africa";
		boolean FATFDecShown = false;
		boolean correctextShown = false;
		WebElement checkbox = null;
		for (int i = 0; i < 3; i++) {
			if (actualHeaderName.contains(section) && (orderType.contains("buy") || orderType.contains("reload"))
					&& product.toLowerCase().contains("forex card")) {
				List<WebElement> listNonFuncConInput = getDriver().findElements(ElementBuy.NON_FUNC_COUNTRIES.get());
				if (listNonFuncConInput.size() > 0 && !listNonFuncConInput.get(0).isSelected()) {

					if (orderType.contains("buy"))
						checkbox = getDriver().findElement(ElementBuy.NON_FUNC_CONTRIES_TEXT.get());
					else if (orderType.contains("reload"))
						checkbox = getDriver().findElement(ElementBuy.NON_FUNC_COUNTRIES_ELIGI_TEXT.get());

					if (checkbox != null && checkbox.getText().equalsIgnoreCase(text)) {
						checkbox.click();
						FATFDecShown = true;
						correctextShown = true;
						break;
					}

//					Assert.assertTrue("FATF not shown for order Type-" + orderType + " & for Product- " + product,
//							FATFDecShown);
				}
				Thread.sleep(500);
			}

		}
		if (FATFDecShown && checkbox != null) {
			Assert.assertFalse("FATF should not shown order Type-" + orderType, FATFDecShown);
			// Assert.assertTrue("FATF checkbox text is Wrong/changed !!", correctextShown);
		}
	}

	public void pageLoadError() throws Throwable {
		errorCode = null;
		pageTitle = getDriver().getTitle().toLowerCase().trim();
		Thread.sleep(1000);
		List<WebElement> sessionExpList = getDriver().findElements(ElementHome.SESSION_EXPIRED.get());
		if (pageTitle.contains("502: bad gateway")) {
			WebElement errorMsg = fwait
					.until(ExpectedConditions.visibilityOfElementLocated(ElementHome.BAD_GATEWAY.get()));
			errorCode = errorMsg.getText().toUpperCase().trim();

		} else if (sessionExpList.size() > 0 && sessionExpList.get(0).isDisplayed()
				&& sessionExpList.get(0).getText().toLowerCase().contains("oops...")) {

			errorCode = sessionExpList.get(0).getText().toUpperCase();

		}
	}

	public void serviceChargeCheck() throws Throwable {
		expectedServCharge = null;

		// service charge is checking here as per slab
		if (isServiceChargeApplied
				&& (orderType.contains("remittance") || orderType.contains("unload") || orderType.contains("reload"))) {
			Assert.assertFalse("Service Charge is Not Applicable due to -" + "'" + grandTotal + "'" + "/" + "'"
					+ orderType.toUpperCase() + "'", isServiceChargeApplied);

		} else if (orderType.contains("buy") || orderType.contains("sell")) {
			System.out.println("Service charge Applied- " + "'" + servCharge + "'");
			Assert.assertTrue("Service charge applicable but is not applied !!", isServiceChargeApplied);
			if (totalAmount < 15000.0) {
				expectedServCharge = 300.0f;

				Assert.assertEquals("Service charge Slab for order amount Rs 0-15000 wrong-", expectedServCharge,
						servCharge);
			} else if (totalAmount >= 15000.0 && totalAmount < 50000.0) {
				expectedServCharge = 200.0f;

				Assert.assertEquals("Service charge Slab for order amount Rs 15001-50000 wrong-", expectedServCharge,
						servCharge);

			} else if (totalAmount >= 50001.0 && totalAmount < 100000.0) {
				expectedServCharge = 150.0f;

				Assert.assertEquals("Service charge Slab for order amount Rs 50001-100000 wrong-", expectedServCharge,
						servCharge);

			} else if (totalAmount >= 100001.0) {
				expectedServCharge = 100.0f;

				Assert.assertEquals("Service charge Slab for order amount Rs 100001 or more wrong-", expectedServCharge,
						servCharge);
			}
		}
	}

	public void simOrderContinue() throws Throwable {
		fwait.until(ExpectedConditions.invisibilityOfElementLocated(ElementBuy.LOADER.get()));
		Thread.sleep(1000);
		List<WebElement> listContinue = getDriver().findElements(ElementBuy.SIM_BUY_COUNTINUE.get());
		for (WebElement cont : listContinue) {
			if (cont.isDisplayed()) {
				scrolToElement(cont);
				cont.click();
			}
		}
	}

	public void connectDb(String querry, String returnV1, String returnV2) throws Throwable {

		// returnV1 /returnV2 to be set if any required value is needed in case DNML
		// query
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			System.out.println(e.getMessage());
		}
		try (Connection connection = DriverManager.getConnection("jdbc:mysql://172.18.0.31:1984/bmf_mar17", "root",
				"N1tr0@123");

				PreparedStatement ps = connection.prepareStatement(querry.toLowerCase())) {

			if (querry.toLowerCase().contains("update") || querry.toLowerCase().contains("delete")) {
				int rowsAffected = ps.executeUpdate();

				if (rowsAffected > 0) {
					System.out.println("Query executed successfully. Rows affected: " + rowsAffected);
				} else {
					System.out.println("No rows affected for query- " + querry);
				}
			} else if (querry.toLowerCase().contains("select")) {
				ResultSet resultSet = ps.executeQuery();
				while (resultSet.next()) {
					// Retrieve data from the result set
					if (returnV1 != null)
						queryReturnvalueOne = resultSet.getString(returnV1);
					if (returnV2 != null)
						queryReturnvalueTwo = resultSet.getString(returnV2);

//					// Print or process the retrieved data
//					System.out.println("Column1: " + col1Value + ", Column2: " + col1Value);
				}

			}

		} catch (SQLException e) {
			System.out.println("An SQL exception occurred: " + e.getMessage());
		} catch (Exception e) {
			System.out.println("An exception occurred: " + e.getMessage());
		}

	}

	public void getRate() throws Throwable {

		String rate = null;

		for (int i = 0; i < 3; i++) {
			Thread.sleep(1500);
			List<WebElement> listRate = getDriver().findElements(ElementBuy.RATE_CARD_BUY_SELL.get());
			if (device.toLowerCase().contains("mobile")) {
				if (listRate.size() == 0
						&& (orderType.toLowerCase().contains("buy") || orderType.toLowerCase().contains("sell")))
					listRate = getDriver().findElements(ElementBuy.M_RATE_CARD_BUY_SELL.get());

				if (listRate.size() == 0
						&& (orderType.toLowerCase().contains("reload") || orderType.toLowerCase().contains("unload")))
					listRate = getDriver().findElements(ElementReload.M_RATE_RELOAD_UNLOAD.get());
				if (orderType.toLowerCase().contains("remittance"))
					listRate = getDriver().findElements(ElementRemit.M_LIVE_RATE.get());
			}

			for (WebElement liveRate : listRate) {
				if (liveRate.isDisplayed()) {
					rate = liveRate.getText();
					break;
				}

			}
			if (rate != null) {
				System.out.println("Product is added with rate " + "'" + rate + "'" + " for " + "'" + product + "'");
				break;
			}
			Thread.sleep(2000);
		}
	}

	public static void landedForexScreen(int timesToretry) throws Throwable {
		List<WebElement> listHeaders = null; // expanded section on /forex screen
		try {
			fwait.until(ExpectedConditions.invisibilityOfElementLocated(ElementBuy.LOADER.get()));

			for (int i = 0; i <= timesToretry; i++) {
				Thread.sleep(3000);
				listHeaders = getDriver().findElements(ElementBuy.HEADER_EXPANDED_SECTION.get());
				if (listHeaders.size() == 0)
					listHeaders = getDriver().findElements(ElementBuy.CUSTOMER_EXPANDED_SECTION.get());

				if (i == (timesToretry - 1) && listHeaders.size() == 0) {

					listHeaders = fwait.until(ExpectedConditions
							.visibilityOfAllElementsLocatedBy(ElementBuy.HEADER_EXPANDED_SECTION.get()));
				}
				if (listHeaders.size() > 0) {
					break;
				}

			}
			for (WebElement headers : listHeaders) {
				if (headers.isDisplayed()) {
					forexPageLoaded = true;
					actualHeaderName = headers.getText().toLowerCase().trim();

					if (actualHeaderName.contains("order")) {
						System.out.println("Section is -" + "'" + actualHeaderName.toUpperCase() + "'");
						break;
					} else {
						System.out.println("Section is -" + "'" + actualHeaderName.toUpperCase() + "'"
								+ " by continue/skip from previous section");
						break;
					}

				}

			}

		} catch (Exception e) {
			System.err.println("Forex page not loaded due to -" + e.getMessage());

		}

		Assert.assertTrue("'~/forex/' is not loaded,Discuss with Developer once..(Lead not Created !!)",
				forexPageLoaded);

	}

	public void payDisclaimTipVerify() throws Throwable {
		boolean payDisclaimTipShown = false;
		List<WebElement> paymentPDisclTipList = getDriver().findElements(ElementBuy.PAYMENT_PRO_TIP.get());
		for (WebElement paymentProTip : paymentPDisclTipList) {
			if (paymentProTip.isDisplayed()) {
				payDisclaimTipShown = true;
				System.out.println("Payment disclaimer shown -" + paymentProTip.getText());
				break;
			}

		}
		if (orderType.toLowerCase().contains("unload") || !paymentRequiredForOrder)
			Assert.assertFalse("Pro Tip shouldn't be shownn for unload orders !!", payDisclaimTipShown);
		else
			Assert.assertTrue("Pro Tip should be shownn for order-" + orderType.toUpperCase(), payDisclaimTipShown);
	}
	
	public void addPrdouct() throws Throwable {
		addProductList = getDriver().findElements(ElementBuy.ADD_PRODUCT.get());
		if (addProductList.size() == 0 && orderType.contains("reload"))
			addProductList = getDriver().findElements(ElementReload.ADD_PRODUCT.get());

		if (addProductList.size() == 0 && device.contains("mobile")) {
			addProductList = getDriver().findElements(ElementBuy.M_ADD_PRODUCT.get());
		}

		if (addProductList.size() == 0)
			addProductList = getDriver().findElements(ElementBuy.CMS_ADD_PRODUCT.get());

		for (WebElement add : addProductList) {
			if (add.isDisplayed()) {
				add.click();
				break;
			}
		}
	}
	public static void Location(String cityName) throws Throwable {
		if (device.contains("mobile")) {
			WebElement locationBtn = getDriver().findElement(ElementMobileBuy.M_LOCATION_CLICK.get());
			locationBtn.click();
			fwait.until(ExpectedConditions.invisibilityOf(locationBtn));
		}

		for (int i = 0; i < 3; i++) {
			Thread.sleep(3000);

			if (device.contains("mobile")) {
				listSelectCity = getDriver().findElements(ElementMobileBuy.M_LOCATION_SELECT.get());
		
			} else if (device.contains("desktop")) {

				if (orderType.toLowerCase().contains("buy") || orderType.toLowerCase().contains("sell")) {
					listSelectCity = getDriver().findElements(ElementBuy.CITY_SELECT.get());
				} else if (device.contains("desktop") && orderType.toLowerCase().contains("remittance")) {
					listSelectCity = getDriver().findElements(ElementRemit.SELECT_CITY.get());
				}

			}
			if ((!orderType.contains("reload") || device.contains("mobile")) && listSelectCity.size() > 0
					&& listSelectCity.get(0).isDisplayed()) {
				cityShown = true;
				Select city = new Select(listSelectCity.get(0));
				city.selectByVisibleText(cityName);
				break;
			} else if (i == 2) {
				System.out.println("checked 3 times..,City Dropdown Shown-" + cityShown);
			}

		}
	}
}
