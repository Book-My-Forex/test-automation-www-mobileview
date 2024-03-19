package com.bmf.automation.buy_order;

import io.cucumber.datatable.DataTable;

import io.cucumber.java.en.And;

import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;

import java.util.ArrayList;

import java.util.Iterator;
import java.util.List;

import java.util.Set;

import org.apache.commons.lang3.StringUtils;
import org.junit.Assert;
import org.junit.Assume;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.ui.ExpectedConditions;

import org.openqa.selenium.support.ui.Select;

import com.bmf.automation.remit_order.ElementRemit;
import com.bmf.automation.runner.TestRunner;
import com.bmf.automation.sell.ElementSell;
import com.bmf.automation.unload.ElementUnload;
import com.bmf.automation_commons.BmfTestCommon;

public class BuyOrderCurrency extends BmfTestCommon {

	List<WebElement> listToastMessage;
	List<WebElement> listOpionalLockInrate; // some time adv and full payment is not allowed

	@And("^User given all below details to buy/sell currency/card$")
	public void fillBuyDetails(DataTable buydt) throws Throwable {
		weforexAmount = null;
		product = null;
		orderType = null;
		String page = null;

		cucumberDataTable = buydt.asMaps(String.class, String.class);
		String cityName = cucumberDataTable.get(0).get("city");
		page = cucumberDataTable.get(0).get("page");
		String currencyType = cucumberDataTable.get(0).get("currency");
		product = cucumberDataTable.get(0).get("productType");
		String fAmount = cucumberDataTable.get(0).get("forexAmount");
		orderType = cucumberDataTable.get(0).get("orderType").toLowerCase();
		cityShown = false;
		listSelectCity = null;
		try {
			Thread.sleep(1000);
			if (orderType.contains("sell")) {
				if (device.toLowerCase().contains("mobile") && page == null) {
					WebElement inputSellRadio = getDriver().findElement(ElementSell.M_SELL_INPUT.get());
					if (!inputSellRadio.isSelected()) {
						getDriver().findElement(ElementSell.M_SWITCH_TO_SELL.get()).click();
					}

				} else {

					fwait.until(ExpectedConditions.elementToBeClickable(ElementSell.SWITCH_TO_SELL.get())).click();
				}
			}
			super.Location(cityName);

			// City should be shown for buy/remit Check
			if (orderType.contains("buy") || orderType.contains("remittance"))
				Assert.assertTrue("City Should be shown for Buy/Remit", cityShown);

			if (page != null && page.toLowerCase().contains("cms")) {
				Select curencyType = new Select(getDriver().findElement(ElementSell.CMS_CURRENCY_TYPE.get()));
				curencyType.selectByVisibleText(currencyType);
			} else if (orderType.contains("sell") && page == null) {

				Select curencyType = new Select(getDriver().findElement(ElementSell.CURRENCY_TYPE.get()));
				curencyType.selectByVisibleText(currencyType);
			} else {
				// to select currency type from drop down
				Select curencyType = new Select(getDriver().findElement(ElementBuy.CURRENCY_TYPE.get()));
				curencyType.selectByVisibleText(currencyType);

				// to select Product type from drop down as Currency Notes
				Select ProductType = new Select(getDriver().findElement(ElementBuy.PRODUCT_TYPE.get()));
				ProductType.selectByVisibleText(product);
			}

			weforexAmount = fwait.until(ExpectedConditions.elementToBeClickable(ElementBuy.FOREX_CURRENCY.get()));
			weforexAmount.clear();
			weforexAmount.sendKeys(fAmount);

			super.getRate();
			super.addPrdouct();

			// to check producttype
			List<WebElement> listProductAdded = getDriver().findElements(ElementBuy.ADDED_PRODUCTS.get());
			List<String> addedProucts = new ArrayList<String>();
			for (WebElement p : listProductAdded) {
				addedProucts.add(p.getText().toLowerCase());
			}
			if (addedProucts.contains("forex card") && addedProucts.contains("currency notes"))
				product = textcombo;

		} catch (

		Exception e) {

			System.err.println("Something went wrong,due to-" + e.getMessage());

		}

	}

	@Then("^User able to buy after given all details$")
	public void buyBookThisOrder() throws Throwable {
		super.bookOrderLogic(ElementBuy.BUY_SELL_BUTTON.get());

	}

	// currently is not working need to work on it
	@And("^Validate promo '(.*)' codes$")
	public void checkPromoCodes(String code) throws Throwable {

		try {

			for (int j = 0; j < 3; j++) {
				BuyOrderCurrency.landedForexScreen(10);
				if (actualHeaderName.contains("order")) {
					List<WebElement> lisstEditOrderContinue = getDriver()
							.findElements(ElementBuy.ORDER_EDIT_SUBMIT.get());
					if (lisstEditOrderContinue.size() == 0)
						lisstEditOrderContinue = getDriver().findElements(ElementBuy.CONTINUE.get());
					fwait.until(ExpectedConditions.invisibilityOfElementLocated(ElementBuy.LOADER.get()));
					WebElement promoCode = fwait
							.until(ExpectedConditions.elementToBeClickable(ElementRemit.PROMO_CODE.get()));
					promoCode.sendKeys(code);
					WebElement button = getDriver().findElement(ElementRemit.APPLY_BTN.get());
					button.click();
					fwait.until(ExpectedConditions.invisibilityOfElementLocated(ElementBuy.LOADER.get()));
					WebElement promoCodeApplied = fwait.until(
							ExpectedConditions.visibilityOfElementLocated(ElementRemit.PROMO_CODE_APPLIED.get()));
					if (promoCodeApplied.getText().toLowerCase().contains("promo code applied")) {
						super.promoApplied = true;
						System.out.println("Promo Code " + "'" + code + "'" + " Applied Successfully !!");
					} else {

						System.err.println("Promo Code not Applied/ Not eligibile/Is previously applied !!");
					}
					fwait.until(ExpectedConditions.invisibilityOfElementLocated(ElementBuy.LOADER.get()));

					lisstEditOrderContinue.get(0).click();
					break;
				} else {

					super.switchToSection("order");
				}

			}

		} catch (Exception e) {

			System.err.println(e.getMessage());
		}
	}

	@And("^User proceed from home screen with order Details$")
	public static void homeToforex() throws Throwable {

		landedForexScreen(10);
	}

	@Then("^To verify maximum allowed prouct should be added$")
	public void addProduct(DataTable buydt) throws Throwable {
		boolean maxProductErrorModalShown = false;
		product = null;
		listDialog = null;
		cucumberDataTable = buydt.asMaps(String.class, String.class);
		String currencyType = cucumberDataTable.get(0).get("currency");
		product = cucumberDataTable.get(0).get("productType");
		String fAmount = cucumberDataTable.get(0).get("forexAmount");

		Select curencyType = new Select(getDriver().findElement(ElementBuy.ORDER_DTL_CURRECY_TYPE.get()));
		curencyType.selectByVisibleText(currencyType);
		Thread.sleep(1000);
		// 1st currency to select above
		// to select Product type from drop down as Currency Notes
		Select ProductType = new Select(getDriver().findElement(ElementBuy.ORDER_DTL_PRODUCT_SELECT.get()));
		ProductType.selectByVisibleText(product);
		weforexAmount = fwait.until(ExpectedConditions.elementToBeClickable(ElementBuy.ORDER_DTL_FOREX_AMOUNT.get()));
		weforexAmount.clear();
		weforexAmount.sendKeys(fAmount);

		getDriver().findElement(ElementBuy.ORDER_DTL_ADD.get()).click();
		int j = 0;
		for (int i = 0; i < 4; i++) {
			Thread.sleep(1000);
			listDialog = getDriver().findElements(ElementBuy.DIALOG_COMMON.get());
			if (listDialog.size() > 0) {
				if (listDialog.get(j).isDisplayed()) {
					maxProductErrorModalShown = true;
					WebElement modalClose = getDriver().findElement(ElementBuy.ORDER_DTL_MAX_PRODUCT_MODAL_CLOSE.get());
					modalClose.click();
					weforexAmount.clear();
					break;
				}
				j++;
			}

		}

		Assert.assertTrue("Maximum product exceed modal not shown  !!", maxProductErrorModalShown);
	}

	// Order details edited to Maximum Allowed in one order a customer
	@Then("^edit forex amount to '(.*)' USD or equivalent to 20000 INR in other currency & proceed$")
	public void orderDetails(String Amount) throws Throwable {
		listToastMessage = null;

		try {
			boolean orderEditReq = false;

			if (actualHeaderName.contains("order")) {
				// to edit order minimum and maximum amount allowed for currency buy
				WebElement editOrderContinue = getDriver().findElement(ElementBuy.ORDER_EDIT_SUBMIT.get());
				for (int j = 0; j <= 3; j++) {
					List<WebElement> listToastMessage = getDriver().findElements(ElementBuy.TOAST_MSG.get());
					if (listToastMessage.size() > 0) {
						String toastmsg = listToastMessage.get(0).getText();
						System.out.println("Toast Message Displayed-" + "'" + toastmsg + "'");
						fwait.until(ExpectedConditions.invisibilityOf(listToastMessage.get(0)));
						orderEditReq = true;

						break;

					} else {
						Thread.sleep(500);
						jse.executeScript("arguments[0].click()", editOrderContinue);
					}
				}

				// to edit order minimum and maximum amount allowed for currency buy
				if (orderEditReq)
					super.editOrder("currency notes", Amount);

			}

		} catch (Exception e) {

			System.err.println("Unable to edit currency order to 20000INR- " + e.getMessage());
		}

	}

	@Then("^Verify pan customer details if not then add below details$")
	public void custDetail(DataTable dtTravel) throws Throwable {
		panValidationFail = false;
		listPanReplaceDialog = null;
		custName = null;
		actualCustomerName = null;
		listToastMessage = null;
		cucumberDataTable = dtTravel.asMaps(String.class, String.class);
		panNum = cucumberDataTable.get(0).get("pan");
		super.firstCountry = cucumberDataTable.get(0).get("tcountryOne");
		super.secondCountry = cucumberDataTable.get(0).get("tcountryTwo");
		super.travelBeforeAfterToday = Integer.parseInt(cucumberDataTable.get(0).get("departAfterToday"));
		super.returnAfterToday = Integer.parseInt(cucumberDataTable.get(0).get("returnAfterToday"));

		fwait.until(ExpectedConditions.invisibilityOfElementLocated(ElementBuy.LOADER.get()));

		try {

			for (int i = 0; i < 3; i++) {
				landedForexScreen(10);
				Thread.sleep(1000);
				if (actualHeaderName.contains("customer")) {
					Thread.sleep(500);
					List<WebElement> listPanedit = getDriver().findElements(ElementBuy.PAN_EDIT.get());
					if (listPanedit.size() > 0) {
						WebElement editpan = listPanedit.get(0);
						editpan.click();
					}

					getDriver().findElement(ElementBuy.PAN_INPUT.get()).sendKeys(panNum);

					Select travelCountry = new Select(getDriver().findElement(ElementBuy.TRAVEL_COUNTRY.get()));
					if (firstCountry != null)
						travelCountry.selectByVisibleText(firstCountry);
					if (secondCountry != null)
						travelCountry.selectByVisibleText(secondCountry);

					webElementTravelStartSelect = getDriver().findElement(ElementBuy.TRAVEL_START_INPUT.get());
					webElementTravelStartSelect.click();

					super.traveldateselect();
					custName = getDriver().findElement(ElementBuy.CUSTOMER_NAME.get());
					actualCustomerName = custName.getAttribute("value");
					System.out.println("Customer Name In Order besides Pan name-" + "'" + actualCustomerName + "'");
					// is checking valid phone
					super.isValidPhone();
					super.fatfDeclaration("customer");
					WebElement sectionCountinue = getDriver().findElement(ElementBuy.CONTINUE.get());

					// to check pan validation failure ------------
					super.scrolToElement(sectionCountinue);
					if (isPhoneNumValid) {
						for (int j = 0; j < 3; j++) {
							jse.executeScript("arguments[0].click()", sectionCountinue);
							List<WebElement> countryNotAllowedList = getDriver()
									.findElements(ElementBuy.ERROR_TRV_COUNTRY.get());

							fwait.until(ExpectedConditions.invisibilityOfElementLocated(ElementBuy.LOADER.get()));
							listToastMessage = getDriver().findElements(ElementBuy.TOAST_MSG.get());

							if (listToastMessage.size() > 0) {
								String panFailureMessage = listToastMessage.get(0).getText().toLowerCase();
								if (panFailureMessage.contains("failure")
										|| listToastMessage.get(0).getText().toLowerCase()
												.contains("max pan validation")
										|| listToastMessage.get(0).getText().toLowerCase().contains("pan")) {
									panValidationFail = true;
									break;
								} else if (secondCountry.toLowerCase().contains("netherlands")
										&& countryNotAllowedList.size() > 0) {
									Assert.assertTrue("Country Not allowed for this order modal not shown !!",
											countryNotAllowedList.size() > 0
													&& countryNotAllowedList.get(0).isDisplayed());
								}
								Assert.assertFalse(panFailureMessage, panValidationFail);
							}

						}

						super.replacePanModalOpened();
					}

					break;
				} else if (i == 2) {
					System.out.println("seems customer Details Section not expanded, retryig..!! ");
					super.switchToSection("customer");

				}

			}

		} catch (Exception e) {

			System.err.println("Customer section failed  due to-" + e.getMessage());
		}

	}

	@When("^Select purpose as '(.*)'$")
	public void eligibiltyCheck(String purposeCode, DataTable dtSubPurposes) throws Throwable {
		selectedPurpose = null;
		boolean ociDisplayed = false;
		cucumberDataTable = dtSubPurposes.asMaps(String.class, String.class);
		String indian = cucumberDataTable.get(0).get("indian").toLowerCase();
		String oci = cucumberDataTable.get(0).get("oci").toLowerCase();
		String businessname = cucumberDataTable.get(0).get("businessName");
		String reasonofTravel = cucumberDataTable.get(0).get("reasonForTravel");
		String businessType = cucumberDataTable.get(0).get("businessType");
		fwait.until(ExpectedConditions.invisibilityOfElementLocated(ElementBuy.LOADER.get()));

		try {

			Thread.sleep(500);
			// do not remove sometime is shown
			if (actualHeaderName.contains("order")) {
				WebElement orderContinue = getDriver().findElement(ElementBuy.CONTINUE.get());
				super.scrolToElement(orderContinue);
				orderContinue.click();
			}
			landedForexScreen(10);
			if (actualHeaderName.contains("eligibility check")) {

				WebElement purposeDrpDown = fwait
						.until(ExpectedConditions.elementToBeClickable(ElementBuy.PURPOSE_SELECT.get()));
				// Thread.sleep(1000);

				if (purposeDrpDown.isEnabled()) {

					Select selectPurpose = new Select(purposeDrpDown);
					selectPurpose.selectByVisibleText(purposeCode);

					fwait.until(ExpectedConditions.invisibilityOfElementLocated(ElementBuy.LOADER.get()));

					selectedPurpose = selectPurpose.getFirstSelectedOption().getText().toLowerCase();

					if (selectedPurpose.contains("non relative")) {
						fwait.until(ExpectedConditions.invisibilityOfElementLocated(ElementBuy.LOADER.get()));
						WebElement transferReason = fwait
								.until(ExpectedConditions.elementToBeClickable(ElementBuy.REASON_TRANSFER.get()));
						transferReason.sendKeys("Reason is automated ");

					}

					if (selectedPurpose.contains("business")) {
						System.out.println(
								"Purpose Selected -" + selectedPurpose + " so Different Option to be selected");

						WebElement drpRsnTrvl = fwait
								.until(ExpectedConditions.elementToBeClickable(ElementBuy.REASON_TRAVEL.get()));

						getDriver().manage().timeouts().implicitlyWait(java.time.Duration.ofSeconds(10));

						Select rsnForTravel = new Select(drpRsnTrvl);
						rsnForTravel.selectByVisibleText(reasonofTravel);

						fwait.until(ExpectedConditions.invisibilityOfElementLocated(ElementBuy.LOADER.get()));

						WebElement txtBusiName = fwait
								.until(ExpectedConditions.elementToBeClickable(ElementBuy.BUSINESS_NAME.get()));
						txtBusiName.clear();
						txtBusiName.sendKeys(businessname);

						// fwait.until(ExpectedConditions.visibilityOfElementLocated(ElementBuy.LOADER.get()));
						WebElement drpBusType = fwait
								.until(ExpectedConditions.elementToBeClickable(ElementBuy.BUSINESS_TYPE.get()));
						Select busType = new Select(drpBusType);
						busType.selectByVisibleText(businessType);
						fwait.until(ExpectedConditions.invisibilityOfElementLocated(ElementBuy.LOADER.get()));

					} else {

						fwait.until(ExpectedConditions.invisibilityOfElementLocated(ElementBuy.LOADER.get()));
						// Select Indian Resident as yes

						for (int j = 0; j < 3; j++) {
							Thread.sleep(1000);
							List<WebElement> listIndianRes = null;
							listIndianRes = getDriver().findElements(ElementBuy.R_U_INDIAN_RES_YES.get());
							if (listIndianRes.size() == 0
									|| (listIndianRes.size() > 0 && !listIndianRes.get(0).isDisplayed()))
								listIndianRes = getDriver().findElements(ElementBuy.STUDENT_INDIAN.get());

							if (listIndianRes.size() > 0 && listIndianRes.get(0).isDisplayed()
									&& !(listIndianRes.get(0).isSelected()) && indian.contains("yes")) {
								WebElement areYouIndian = listIndianRes.get(0);
								super.scrolToElement(areYouIndian);
								jse.executeScript("arguments[0].click()", areYouIndian);
								break;
							} else if (indian.contains("no") && !(orderType.contains("reload"))) {
								getDriver().findElement(ElementBuy.R_U_INDIAN_RES_NO.get()).click();
								Thread.sleep(500);
								List<WebElement> listtotalAreU = getDriver()
										.findElements(ElementBuy.TOTAL_ARE_YOU.get());
								if (listtotalAreU.size() == 3 && listtotalAreU.get(0).isDisplayed()) {

									if (oci.contains("yes") && selectedPurpose.contains("leisure")) {

										fwait.until(ExpectedConditions
												.elementToBeClickable(ElementBuy.OVERSEAS_INDIA.get())).click();

										ociDisplayed = true;
										Assert.assertTrue("OCI not shown ", ociDisplayed);
										break;
									}

								}

							}
						}

					}
				}

			} else if (actualHeaderName.contains("review")) {

				// in case reload order purpose is not selected in case current trip
				if (orderType.contains("reload")) {
					selectedPurpose = "reload-purpose selected from last deal completed";

				}
			}

		} catch (Exception e) {

			System.err.println("Failed Eligibiity Section operation-" + e.getMessage());
		}

	}

	@And("^Verify Documents upload & Limit for Each$")
	public void uploadDoc() throws Throwable {
		listToastMessage = null;
		String toastError = null;
		boolean docUploadfail = false;
		boolean onlyPdfImgErrorShown = false;
		ocrEnabled = false;
		allDocUploaded = false;
		try {
			for (int i = 0; i <= 3; i++) {

				landedForexScreen(10);
				if (actualHeaderName.contains("eligibility check") && selectedPurpose != null) {
					Thread.sleep(3000);
					super.eligibilityIconfirm();
					List<WebElement> listFileUploaded = getDriver()
							.findElements(ElementBuy.DOC_UPLOADED_VIEW_BTN.get());
					int uploadedDocsSize = listFileUploaded.size();

					while (uploadedDocsSize != 0) {
						if (listFileUploaded.get(0).isDisplayed()) {
							fwait.until(ExpectedConditions.elementToBeClickable(listFileUploaded.get(0)));
							super.scrolToElement(listFileUploaded.get(0));
							jse.executeScript("arguments[0].click()", listFileUploaded.get(0));
							fwait.until(ExpectedConditions.visibilityOfElementLocated(ElementBuy.UPLOAD_DIALOG.get()));

							WebElement delete = fwait
									.until(ExpectedConditions.elementToBeClickable(ElementBuy.DOC_DELETE_BTN.get()));
							jse.executeScript("arguments[0].click()", delete);
							WebElement confirm = fwait.until(
									ExpectedConditions.visibilityOfElementLocated(ElementBuy.DOC_DELETE_CONFIRM.get()));
							jse.executeScript("arguments[0].click()", confirm);
							fwait.until(ExpectedConditions.invisibilityOf(confirm));
							fwait.until(ExpectedConditions.invisibilityOfElementLocated(ElementBuy.LOADER.get()));
							Thread.sleep(1500);
							listFileUploaded = getDriver().findElements(ElementBuy.DOC_UPLOADED_VIEW_BTN.get());
							uploadedDocsSize = listFileUploaded.size();
						}
					}

					Thread.sleep(1000);
					List<WebElement> listUploaders = getDriver().findElements(ElementBuy.DOC_UPLOAD_INPUT.get());
					int uploadersSize = listUploaders.size();
					if (uploadedDocsSize == 0 && uploadersSize > 0) {
						int j = 0;
						while (uploadersSize != 0) {
							String docName = listUploaders.get(0).getAttribute("ng-title");

							if (!onlyPdfImgErrorShown)
								listUploaders.get(0).sendKeys(filePath + "doc_file" + ".docx");
							else {

								if (docName.equalsIgnoreCase("passFP") || docName.equalsIgnoreCase("patPassFP")) {
									listUploaders.get(0).sendKeys(filePath + docName + ".pdf");
								} else if (docName.equalsIgnoreCase("passLP")
										|| docName.equalsIgnoreCase("patPassLP")) {
									listUploaders.get(0).sendKeys(filePath + docName + ".pdf");
								} else if (docName.equalsIgnoreCase("ticket")) {
									listUploaders.get(0).sendKeys(filePath + docName + ".pdf");
								} else if (docName.equalsIgnoreCase("panCard")
										|| docName.equalsIgnoreCase("panCardFir")) {
									listUploaders.get(0).sendKeys(filePath + docName + ".pdf");
								} else {
									listUploaders.get(0).sendKeys(filePath + "dummy" + ".pdf");
								}
								j++;
							}

							// some time documents upload fails
							listToastMessage = getDriver().findElements(ElementBuy.TOAST_MSG.get());
							if (listToastMessage.size() > 0)
								toastError = listToastMessage.get(0).getText().toLowerCase();
							if (toastError != null)
								if (toastError.contains("failure")) {
									docUploadfail = true;
									Assert.assertFalse(toastError, docUploadfail);
								} else if (!onlyPdfImgErrorShown && toastError.contains("only pdf and image")) {
									onlyPdfImgErrorShown = true;
									System.out.println("Only pdf/img error shown-" + toastError);
								}
							if (onlyPdfImgErrorShown && j == 0)
								System.out.println("file not uploaded- error shown");
							else
								System.out.println("uploading files count-" + j);
							// below line commented due to ocr is disabled
							// TODO to check if ocr is enabled or not from db
							super.connectDb("Select * from Order_Doc_Settings;", "is_pan_ocr_enabled",
									"is_passport_ocr_enabled");
							if (queryReturnvalueOne.contains("1") || queryReturnvalueTwo.contains("1")) {
								super.ocrCheck();
								ocrEnabled = true;
							}
							fwait.until(ExpectedConditions
									.invisibilityOfElementLocated(ElementBuy.DOC_LOADER_ANALYSER.get()));
							Thread.sleep(1000);
							listUploaders = getDriver().findElements(ElementBuy.DOC_UPLOAD_INPUT.get());
							uploadersSize = listUploaders.size();

						}

					}

					if (uploadedDocsSize == 0 && uploadersSize == 0) {

						allDocUploaded = true;
						super.ocrCheck();
						System.out.println("=================================================================");
						System.out.println("All docs are deleted and Reuploaded fresh ... !!");
						System.out.println("=================================================================");
						WebElement conBtn = getDriver().findElement(ElementBuy.CONTINUE.get());

						super.scrolToElement(conBtn);
						jse.executeScript("arguments[0].click()", conBtn);
						// below line is to check OCR currently disabled
						if (ocrEnabled)
							Assert.assertTrue(
									"The document Discrepancy modal Not shown !! ask dev to check if is enabled or not ?",
									isDiscrepancyModalShown);
						Assert.assertTrue("Only pdf & image error not shown while docx file upload  !!",
								onlyPdfImgErrorShown);
						break;
					}

				} else {

					super.switchToSection("eligibility check");
				}
			}
		} catch (Exception e) {
			System.err.println("Upload/delete documents Failed due to- " + e.getMessage());
		}

	}

	@Then("^Verify Documents with the Purpose Selected Docs and continue$")
	public void verifiyDocs(DataTable dtDocList) throws Throwable {
		boolean isRestrictedPurposeWithcard = false;
		listDialog = null;
		WebElement continueButton = null;
		fwait.until(ExpectedConditions.invisibilityOfElementLocated(ElementBuy.LOADER.get()));
		boolean remitNotPossible = false;
		boolean documentCountMisMatch = false;
		boolean isVisaShownStill = false;
		boolean visaHideBtnshown = true;
		boolean documentMiss = false;
		String actualDocname = null;
		List<String> listExpectedDocs = dtDocList.asList();
		List<WebElement> listActualDocuments = null;
		int expectedTotaldocsSize = listExpectedDocs.size();

		for (int j = 0; j <= 3; j++) {

			if (actualHeaderName.toLowerCase().contains("eligibility check")) {

				// to avoid null pointer exceptions
				if (selectedPurpose == null && (orderType.contains("sell") || orderType.contains("unload"))) {
					selectedPurpose = orderType + "- No Purpose Required";
				}

				// below code is to check if same count documents are loaded as expected
				for (int i = 0; i < 4; i++) {
					listActualDocuments = super.listRefreshedDocs();
					int actualTotalDocsSize = listActualDocuments.size();
					if (actualTotalDocsSize == expectedTotaldocsSize) {
						break;
					} else if (i == 3) {
						documentCountMisMatch = true;
					}
					Thread.sleep(4000);

				}

				super.scrolToElement(listActualDocuments.get(0));
				if (listActualDocuments.get(0).isDisplayed()) {
					System.out.println(
							"--------------------------------------------------------------------------------------------------------------------------------------------");
					System.out.printf("%-60s %10s %60s %n", "Expected Document", "Matched", "Acual Document");
					System.out.println(
							"--------------------------------------------------------------------------------------------------------------------------------------------");
					int i = 0;
					for (String documents : listExpectedDocs) {
						String expectedDocName = documents.toUpperCase().trim();

						try {
							actualDocname = listActualDocuments.get(i).getText().toUpperCase().trim();
						} catch (Exception e) {
							actualDocname = "NO FURTHER DOCUMENT SHOWN !!";
						}

						if (expectedDocName.equalsIgnoreCase(actualDocname)) {

							System.out.printf("%-60s %10s %60s %n", expectedDocName, "Yes (Pass)", actualDocname);

						} else {
							System.err.printf("%-60s %10s %60s %n", expectedDocName, "No (Fail)", actualDocname);
							documentMiss = true;

						}
						i++;
					}

					System.out.println(
							"--------------------------------------------------------------------------------------------------------------------------------------------");

					super.scrolToElement(listActualDocuments.get(0));

					// Visa not required
					Thread.sleep(3000);
					List<WebElement> visaNotReq = getDriver().findElements(ElementBuy.VISA_NOT_REQ_CHECK.get());
					if (visaNotReq.size() > 0 && visaNotReq.get(0).isDisplayed()) {
						WebElement visaNotReqCheckbox = visaNotReq.get(0);
						visaNotReqCheckbox.click();
						System.out.println("'" + visaNotReqCheckbox.getText() + "'" + "-is checked");

						getDriver().manage().timeouts().implicitlyWait(java.time.Duration.ofSeconds(10));
						listActualDocuments = super.listRefreshedDocs();

						System.out.println(
								"--------------------------------------------------------------------------------------------------------------------------------------------");
						System.out.printf("%-60s %10s %60s %n", "Document Name", "Is Visa Doc", "Status");
						System.out.println(
								"--------------------------------------------------------------------------------------------------------------------------------------------");

						for (WebElement newDocList : listActualDocuments) {
							actualDocname = newDocList.getText().toLowerCase().trim();
							if (actualDocname.contains("visa")) {
								isVisaShownStill = true;
								System.err.printf("%-60s %10s %60s %n", actualDocname.toUpperCase(), "yes", "Fail");

							} else {
								System.out.printf("%-60s %10s %60s %n", actualDocname.toUpperCase(), "No", "Pass");
							}
						}

						System.out.println(
								"--------------------------------------------------------------------------------------------------------------------------------------------");

					} else if (!orderType.contains("remittance") && !orderType.contains("unload")
							&& !orderType.contains("sell") && !selectedPurpose.contains("last deal completed")
							&& !(orderType.contains("reload") && expectedtrip.contains("current trip"))) {

						visaHideBtnshown = false;
					}
					fwait.until(ExpectedConditions.invisibilityOfElementLocated(ElementBuy.LOADER.get()));
					super.eligibilityIconfirm();

					fwait.until(ExpectedConditions.invisibilityOfElementLocated(ElementBuy.LOADER.get()));
					super.fatfDeclaration("eligibility check");
					continueButton = getDriver().findElement(ElementBuy.CONTINUE.get());
					super.scrolToElement(continueButton);
					continueButton.click();
					Thread.sleep(1000);
					listDialog = getDriver().findElements(ElementBuy.DIALOG_COMMON.get());
					for (WebElement dialog : listDialog) {
						if (dialog.isDisplayed()) {
							errorMessage = dialog.getText().toLowerCase();
							if (errorMessage.contains("this purpose cannot be selected"))
								isRestrictedPurposeWithcard = true;
						}
					}
					if (orderType.contains("remittance")) {

						Thread.sleep(2000);
						List<WebElement> listRemitnotPossible = getDriver()
								.findElements(ElementBuy.REMIT_NOT_POSSIBLE.get());
						if (listRemitnotPossible.size() > 0 && listRemitnotPossible.get(0).isDisplayed()) {
							remitNotPossible = true;
						}
						Assume.assumeFalse(
								"Remit order can not be processed with purpose selected !! (for best vendor)",
								remitNotPossible);
					}
				}
				super.connectDb("select l.is_bmf_edu_allowed  from lead_general_settings l ;", "is_bmf_edu_allowed",
						null);
				if (queryReturnvalueOne != null && queryReturnvalueOne.contains("0")) {
					if (errorMessage != null)
						System.err.println("Purpose restriction error modal shown-" + errorMessage);
					if (orderType.toLowerCase().contains("buy") && product.toLowerCase().contains("forex card")
							&& !(selectedPurpose.contains("leisure") || selectedPurpose.contains("business"))) {
						Assert.assertTrue("Restricted purpose check for buy card is not shown  !!",
								isRestrictedPurposeWithcard);
						Assume.assumeFalse("Test to be skipped as the Restricted Purpose selected !!",
								isRestrictedPurposeWithcard);
					} else if (!orderType.toLowerCase().contains("buy")) {
						Assert.assertFalse("Restricted Purpose check besides buy card should not shownn  !!",
								isRestrictedPurposeWithcard);
					}
				} else {

					System.out.println("all purpose is allowed for buy card as per db !!");
				}
				Assert.assertFalse("Documents Count shown is not same with expected Documents ,Please Check !!",
						documentCountMisMatch);
				Assert.assertFalse("Seems one/more Expected Doc not Found,Please Check  !!", documentMiss);
				Assert.assertTrue("Visa Hide Button Not Shown!!", visaHideBtnshown);
				Assert.assertFalse("Visa Related Doc is Still There", isVisaShownStill);

				break;
			} else if (actualHeaderName.contains("order") && !(actualHeaderName.contains("review"))) {
				// is for unload case sometime is redirected to order details section
				continueButton = getDriver().findElement(ElementBuy.CONTINUE.get());
				super.scrolToElement(continueButton);
				continueButton.click();

			} else if (selectedPurpose != null && (selectedPurpose.contains("selected from last deal completed")
					|| selectedPurpose.toLowerCase().contains("no purpose required"))) {
				super.switchToSection("eligibility check");
			} else if (j == 3) {
				System.out.println("Documents are not checked in this as purpose is-' " + selectedPurpose + " '");
			}
			landedForexScreen(10);
		}

	}

	@And("^user selected or added new address and proceed to Review Screen$")
	public void orderProcessing() throws Throwable {
		boolean errorInProcessToNext = false;
		String toastmsg = null;
		fwait.until(ExpectedConditions.invisibilityOfElementLocated(ElementBuy.LOADER.get()));

		for (int i = 0; i < 3; i++) {
			Thread.sleep(2000);
			List<WebElement> selectAddress = getDriver().findElements(ElementBuy.ADDRESS_SELECT_BTN.get());
			if (selectAddress.size() == 0 || !(selectAddress.size() > 0 && selectAddress.get(0).isDisplayed())) {
				selectAddress = getDriver().findElements(ElementBuy.ADDRESS_SELECT_ALTER.get());
			}
			if (selectAddress.size() > 0 && selectAddress.get(0).isDisplayed()) {
				WebElement selectAdd = selectAddress.get(0);
				super.scrolToElement(selectAdd);
				jse.executeScript("arguments[0].click()", selectAdd);
				// selectAdd.click();
				break;
			} else if (selectAddress.size() == 0) {
				super.addNewAddress();
				break;
			}

		}

		Thread.sleep(500);
		List<WebElement> iConfirmToPresents = getDriver().findElements(ElementBuy.I_CONFIRM_PRESENT_TEXT.get());
		if (iConfirmToPresents.size() > 0 && iConfirmToPresents.get(0).isDisplayed()) {
			WebElement iConfirmToPresent = iConfirmToPresents.get(0);
			jse.executeScript("arguments[0].click()", iConfirmToPresent);

			System.out.println(iConfirmToPresent.getText() + "-is Selected");
		}

		if (product.contains("sim")) {
			super.simOrderContinue();

		} else {

			WebElement reviewOrderBtn = fwait
					.until(ExpectedConditions.elementToBeClickable(ElementBuy.REVIEW_BUTTON.get()));

			for (int j = 0; j <= 3; j++) {
				super.scrolToElement(reviewOrderBtn);
				jse.executeScript("arguments[0].click()", reviewOrderBtn);

				List<WebElement> listToastMessage = getDriver().findElements(ElementBuy.TOAST_MSG.get());
				if (listToastMessage.size() > 0) {
					toastmsg = listToastMessage.get(0).getText();
					if (toastmsg != null)
						System.out.println("Toast Message Displayed-" + "'" + toastmsg + "'");
					fwait.until(ExpectedConditions.invisibilityOf(listToastMessage.get(0)));
					if (!toastmsg.contains("Address saved successfull!"))
						errorInProcessToNext = true;
					break;

				} else if (reviewOrderBtn.isDisplayed()) {
					reviewOrderBtn.click();
				} else if (!reviewOrderBtn.isDisplayed()) {
					break;
				}
			}
			fwait.until(ExpectedConditions.invisibilityOfElementLocated(ElementBuy.LOADER.get()));
		}

		Assert.assertFalse(toastmsg, errorInProcessToNext);
		fwait.until(ExpectedConditions.invisibilityOfElementLocated(ElementBuy.TOAST_MSG.get()));

	}

	@And("^Add on sim cards verify and add$")
	public void simAdd() throws Throwable {
		boolean simAddonDisplayed = false;

		try {

			fwait.until(ExpectedConditions.visibilityOfElementLocated(ElementBuy.REVIEW_ORDER_SUMMARY.get()));
			for (int i = 0; i < 3; i++) {
				if (actualHeaderName.contains("review")) {
					Thread.sleep(1500);
					List<WebElement> listSeeplan = getDriver().findElements(ElementBuy.SIM_ADD_ON.get());
					List<WebElement> listfreeSim = getDriver().findElements(ElementBuy.SIM_ADD_FREE.get());

					if ((listfreeSim.size() > 0 && listfreeSim.get(0).isDisplayed())
							|| (listSeeplan.size() > 0 && listSeeplan.get(0).isDisplayed())) {

						simAddonDisplayed = true;

						if (listfreeSim.size() > 0 && listfreeSim.get(0).isDisplayed()) {
							super.scrolToElement(listfreeSim.get(0));
							listfreeSim.get(0).click();
						} else {
							super.scrolToElement(listSeeplan.get(0));
							listSeeplan.get(0).click();
						}
						fwait.until(ExpectedConditions.visibilityOfElementLocated(ElementBuy.SIM_BUY_DIALOG.get()));
						List<WebElement> ListBuybtns = getDriver().findElements(ElementBuy.SIM_BUY_BTNS.get());
						if (ListBuybtns.size() > 0) {
							WebElement buy = ListBuybtns.get(0); // will select only 1st sim
							if (buy.isDisplayed()) {

								buy.click();
								Thread.sleep(500);

								// super.scrolToElement(simcontinueBtn);
								Thread.sleep(500);
								List<WebElement> listAddressSelect = getDriver()
										.findElements(ElementBuy.SIM_ADDRESS_SELECT.get());
								if (listAddressSelect.size() == 0)
									listAddressSelect = getDriver()
											.findElements(ElementBuy.SIM_ADDRESS_SELECT_TABLE.get());

								if (listAddressSelect.size() == 0) {

									super.addNewAddress();
								}

								if (listAddressSelect.size() > 0 && listAddressSelect.get(0).isDisplayed()) {

									listAddressSelect.get(0).click();

								}
								WebElement simcontinueBtn = fwait.until(
										ExpectedConditions.elementToBeClickable(ElementBuy.SIM_CONTINUE_BTN.get()));
								super.scrolToElement(simcontinueBtn);
								simcontinueBtn.click();
								fwait.until(ExpectedConditions.invisibilityOfElementLocated(ElementBuy.LOADER.get()));
								fwait.until(ExpectedConditions.invisibilityOf(simcontinueBtn));
								break;
							}
						}

					}

				} else {
					landedForexScreen(10);
				}
			}
		} catch (Throwable e) {

			System.err.println("sim add on not added ,due to -" + e.getMessage());

		}
		Assert.assertTrue("Sim add on not displayed", simAddonDisplayed);

		// below code is commented as it is not checking currently
//		Assert.assertNotEquals("in currency sim add on not allowed", "Currency Notes", ordertype);
	}

	@And("^to verify Service charge & paid from given bank Details$")
	public void paymentScreen(DataTable dtpaydetails) throws Throwable {
		int paymodeSize = 0; // to get size from list of allpaymodes for the current order/type
		List<WebElement> listTimerClose = null;
		List<WebElement> listAllPayModes = null;
		List<WebElement> listForordSummary = null; // The order summary and charges section
		listOpionalLockInrate = null;
		String reviewScreenProduct = null;

		// tcs version 1.0 purpose applicable in case tcs v3
		List<String> listOfPuposeForTcsApplicable = new ArrayList<String>();
		listOfPuposeForTcsApplicable.add("education");
		listOfPuposeForTcsApplicable.add("medical visit");
		tcsVersionThreeApplicable = false;
		tcsVersionTwoApplicable = false;
		tcsVersionOneApplicable = false;
		istcsAppliedUnderSummary = false;
		// the charges of order summary section reset for new test-------------
		tcsCharge = null;
		payConvCharge = null;
		simCharge = null;
		totalAmount = null;
		grandTotal = null;
		gst = null;
		bankFee = null;
		servCharge = null;
		cardSpecific = null;
		currentOrderTCSApplicable = null;
		nostroChargeRemit = null;
		isServiceChargeApplied = false; // to check service charge
		boolean isPurposeAdlChargeApplied = false;
		boolean idAddonChargeApplied = false;

		// the below will be true conditionally by order types
		boolean upiUnloadPossible = false;
		offlinePayment = false;
		offlinePayBtnOnly = false;
		fullpayment = false;
		simPayment = false;
		// in case of unload no payment required
		if (orderType.contains("unload"))
			super.paymentRequiredForOrder = false;
		else
			super.paymentRequiredForOrder = true;

		cucumberDataTable = dtpaydetails.asMaps(String.class, String.class);
		requiredPayMode = cucumberDataTable.get(0).get("payMode").toLowerCase();
		String remarks = cucumberDataTable.get(0).get("remark") + " " + requiredPayMode;
		String accNumber = cucumberDataTable.get(0).get("accountNumber");
		String ifscCd = cucumberDataTable.get(0).get("ifscCode");
		String bankName = cucumberDataTable.get(0).get("bankName");
		String upiId = cucumberDataTable.get(0).get("upiId");

		System.out.println("Payment Mode To Select-" + requiredPayMode.toUpperCase());

		// the promo code to be get key
		List<String> promocodeKeys = new ArrayList<String>();
		promocodeKeys.add("discounted rate difference cash back");
		promocodeKeys.add("bookmyforex special cashback");
		promocodeKeys.add("back for more cashback discount");
		promocodeKeys.add("referralDiscount");

		fwait.until(ExpectedConditions.invisibilityOfElementLocated(ElementBuy.LOADER.get()));

		for (int i = 0; i < 3; i++) {
			Thread.sleep(2000);
			BuyOrderCurrency.landedForexScreen(10);
			if (actualHeaderName.contains("review")) {
				Thread.sleep(3000);
				listForordSummary = getDriver().findElements(ElementBuy.REVIEW_ORDER_SUMMARY.get());
				if (listForordSummary.size() > 0 && listForordSummary.get(0).isDisplayed()) {
					super.scrolToElement(listForordSummary.get(0));
					break;
				}
			}

		}

		if (listForordSummary != null && listForordSummary.size() > 0 && listForordSummary.get(0).isDisplayed()) {
			Thread.sleep(1000);
			List<WebElement> listProducts = getDriver().findElements(ElementBuy.REVIEW_ORDER_DETAILS.get());

			List<String> rProucts = new ArrayList<String>();
			for (WebElement p : listProducts) {
				rProucts.add(p.getText().toLowerCase());
			}

			// deciding for product type in current order
			if (listProducts.size() == 4 || orderType.contains("unload") || orderType.contains("sell")) {
				reviewScreenProduct = listProducts.get(1).getText().toLowerCase();
			} else if (rProucts.contains("forex card") && rProucts.contains("currency notes")) {
				reviewScreenProduct = textcombo;
			} else if (listProducts.size() > 4 && rProucts.contains("forex card")) {
				reviewScreenProduct = multiCurrencyCard;
			} else if (listProducts.size() > 4 && rProucts.contains("currency notes")) {
				reviewScreenProduct = multiCurrency;
			}

			// orderType changed here if
			if (reviewScreenProduct != null && !(reviewScreenProduct.contains(orderType)))
				orderType += " - " + reviewScreenProduct;

			if (product == null)
				product = orderType;

			// refreshed the order summary charges
			super.orderSummaryCharges();
			if (totalAmount != null && grandTotal != null) {
				System.out.println("Total Order Amount- " + "'" + totalAmount + "'");
				Float totalChargesCollected = grandTotal - totalAmount;
				System.out.println("Applied Charges beyond Total Order Amount - " + "'" + totalChargesCollected + "'");
				System.out.println("Grand Total before TCS- " + "'" + grandTotal + "'");
			}

			idAddonChargeApplied = charges.containsKey(addOnSimChargeKey);
			isPurposeAdlChargeApplied = charges.containsKey(addlpurposeChargekey);
			isServiceChargeApplied = charges.containsKey(serviceChargeKey);

			if (orderType.toLowerCase().contains("buy") || orderType.toLowerCase().contains("buy"))
				Assert.assertTrue("Service charge applicable but not applied", isServiceChargeApplied);

			// remit purpose charge checking here
			// currently is removed as per pritam confirmed
//			if (orderType.contains("remittance") && selectedPurpose.contains("non relative individual"))
//				Assert.assertTrue("remit Purpose Charge not Applied. Check with dev ..!!", isPurposeAdlChargeApplied);

			// service charge is checking here as per slab
			super.serviceChargeCheck();

			// to check in case better rate cash order it should be applied promo code
			if (orderType.toLowerCase().contains("referral")
					|| (orderType.toLowerCase().contains("better rate request") && betterrateContinueWithCashBack)
					|| super.promoApplied) {
				boolean cashback = false;
				for (String codekey : promocodeKeys) {
					cashback = super.charges.containsKey(codekey.toLowerCase());
					if (cashback) {
						System.out.println("Promo code applied for-" + orderType.toUpperCase());
						break;
					}

				}

				Assert.assertTrue("Promo Code should be applied for-" + orderType.toUpperCase(), cashback);
			}

			if (super.charges.containsKey(addOnSimChargeKey))
				System.out.println("Sim Addon Charges-" + simCharge);

			getDriver().manage().timeouts().implicitlyWait(java.time.Duration.ofSeconds(10));
			listAllPayModes = getDriver().findElements(ElementBuy.ALL_PAY_MODES.get());

			paymodeSize = listAllPayModes.size();
			String firstPaymode = listAllPayModes.get(0).getText().toLowerCase().trim();

			// to check if there is any upi pay mode for unload
			for (WebElement upiUnload : listAllPayModes) {
				if (upiUnload.getText().toLowerCase().contains("upi") && orderType.contains("unload")) {
					upiUnloadPossible = true;
					break;
				}

			}

			// sell/Unload order
			// for lock rates payment methods should be 2/3 qty or if changed,then change
			// below

			if (paymodeSize <= 3 && (firstPaymode.contains("neft/ rtgs") || firstPaymode.contains("offline")
					|| firstPaymode.contains("pay later")) || requiredPayMode.contains("neft/ rtgs")) {
				offlinePayment = true;

				for (WebElement payMode : listAllPayModes) {

					String payModetext = payMode.getText().toLowerCase().trim();
					if (upiUnloadPossible && requiredPayMode.contains(payModetext)) {
						payMode.click();
						System.out.println("Unload via Upi payment !!");
						break;
					} else if (!requiredPayMode.contains("neft/ rtgs")) {
						System.out.println("Vendor is denied full payment for products/Now,So Lock-in Exchange Rates");
						payMode.click();
						requiredPayMode = firstPaymode;
						break;
					} else if (payModetext.contains(requiredPayMode)) {
						payMode.click();
						break;
					}

				}

				// SIMADDON WHILE OFFLINE payment, ADD ON TO REMOVE
				Thread.sleep(1000);
				List<WebElement> listSimRemove = getDriver().findElements(ElementBuy.OFFLINE_SIM_REMOVE_MODAL.get());
				if (offlinePayment && listSimRemove.size() > 0 && listSimRemove.get(0).isDisplayed()) {
					fwait.until(ExpectedConditions.invisibilityOfElementLocated(ElementBuy.LOADER.get()));
					Thread.sleep(1000);
					fwait.until(ExpectedConditions.elementToBeClickable(ElementBuy.REMOVE_CONFIRM_BTN.get())).click();
					fwait.until(ExpectedConditions.invisibilityOfElementLocated(ElementBuy.LOADER.get()));
					System.err.println("SIMADDON WHILE OFFLINE PAYMENT, ADD ON TO REMOVED");
				}

				// if timer is displayed after payment mode slected to close text only
				getDriver().manage().timeouts().implicitlyWait(java.time.Duration.ofSeconds(10));
				listTimerClose = getDriver().findElements(ElementBuy.TIMER_CLOSE.get());
				if (listTimerClose.size() > 0 && listTimerClose.get(0).isDisplayed()) {

					listTimerClose.get(0).click();

				}

				fwait.until(ExpectedConditions.invisibilityOfElementLocated(ElementBuy.TOAST_MSG.get()));

				if (orderType.contains("unload") || orderType.contains("sell")) {

					Thread.sleep(1000);
					List<WebElement> listBankDetails = getDriver()
							.findElements(ElementUnload.SELL_UNLOAD_BANK_NAME.get());
					List<WebElement> listUnloadbankDetails = getDriver()
							.findElements(ElementUnload.UNLOAD_ACCOUNT_NO.get());
					if (listBankDetails.size() > 0 && listBankDetails.get(0).isDisplayed()) {
						listBankDetails.get(0).clear();
						listBankDetails.get(0).sendKeys(bankName);
						WebElement bName = getDriver().findElement(ElementUnload.SELL_UNLOAD_ACCOUNT_NO.get());
						bName.clear();
						bName.sendKeys(accNumber);
						WebElement ifscCode = getDriver().findElement(ElementUnload.SELL_UNLOAD_BANK_IFSC.get());
						ifscCode.clear();
						ifscCode.sendKeys(ifscCd);
						WebElement bAddress = getDriver().findElement(ElementUnload.SELL_UNLOAD_BANK_ADD.get());
						bAddress.clear();
						bAddress.sendKeys("Noida");
						WebElement benname = getDriver().findElement(ElementUnload.SELL_UNLOAD_BEN_NAME.get());
						benname.clear();
						benname.sendKeys("D BISWAJEET DAS");

						WebElement saveBtn = getDriver().findElement(ElementUnload.SELL_UNLOAD_SAVE_BUTTON.get());
						super.scrolToElement(saveBtn);

						saveBtn.click();

					} else if (listUnloadbankDetails.size() > 0 && listUnloadbankDetails.get(0).isDisplayed()) {
						WebElement bName = getDriver().findElement(ElementUnload.UNLOAD_ACCOUNT_NO.get());
						bName.clear();
						bName.sendKeys(accNumber);
						WebElement ifscCode = getDriver().findElement(ElementUnload.UNLOAD_BANK_IFSC.get());
						ifscCode.clear();
						ifscCode.sendKeys(ifscCd);
					} else if (requiredPayMode.contains("upi") && upiUnloadPossible) {

						upiAccount(upiId, accNumber, ifscCd);

					}
					super.inputRemarks(remarks);
					super.confirmOrder();
					super.upiLimit();
				}
			}

			if (super.paymentRequiredForOrder) {
				Thread.sleep(2000);
				super.listpayNowAdvBtn = getDriver().findElements(ElementBuy.OFFLINE_PAY_NOW.get());
				if (listpayNowAdvBtn.size() > 0 && listpayNowAdvBtn.get(0).isDisplayed()) {
					offlinePayBtnOnly = true;
					// tcs modal will open in case tcs version 1.0/2.0
					super.tcsModalClose();
					// refreshed the order summary charges
					super.orderSummaryCharges();
					super.paynConfirm();

				} else if (offlinePayment) {
					// all payment modes (net banking/debit/credit)
					listAllPayModes = getDriver().findElements(ElementBuy.ALL_PAY_MODES.get());
				}
				paymodeSize = listAllPayModes.size();
				if (paymodeSize >= 2 && listAllPayModes.get(0).isDisplayed() && !offlinePayBtnOnly
						&& super.paymentRequiredForOrder) {
					for (WebElement paymode : listAllPayModes) {
						String PayModeName = paymode.getText().trim().toLowerCase();
						// for net banking/debit/upi/credit click
						if (PayModeName.contains(requiredPayMode)) {

							fullpayment = true;
							super.scrolToElement(paymode);
							paymode.click();

							super.upiLimit();
// --------------------------------------------------------------------------------------------------------------------
//                   Remit case For Sbm vendor if payment methods qty changed,then change here no sbm vendor currently
//					if (allPaymodeSize <= 3 && productType.contains("wire transfer") && !offlinePayment ) {
//
//						WebElement toastMessage = fwait
//								.until(ExpectedConditions.visibilityOfElementLocated(ElementBuy.TOAST_MSG.get()));
//						System.out.println("Remit order-" + "'" + toastMessage.getText() + "'");
//						fwait.until(ExpectedConditions.invisibilityOfElementLocated(ElementBuy.TOAST_MSG.get()));
//					}
// --------------------------------------------------------------------------------------------------------------------
							break;
						}

					}

					// timer activated to close text only
					listTimerClose = getDriver().findElements(ElementBuy.TIMER_CLOSE.get());
					if (listTimerClose.size() > 0 && listTimerClose.get(0).isDisplayed()) {

						listTimerClose.get(0).click();

					}

					fwait.until(ExpectedConditions.invisibilityOfElementLocated(ElementBuy.LOADER.get()));
					getDriver().manage().timeouts().implicitlyWait(java.time.Duration.ofSeconds(10));
					List<WebElement> payeeIsPresent = getDriver().findElements(ElementBuy.RELATION_PAYEE.get());
					if (payeeIsPresent.size() > 0 && payeeIsPresent.get(0).isDisplayed()) {
						Select payee = new Select(payeeIsPresent.get(0));
						payee.selectByVisibleText("Self");
					}

					// select bank name or card type
					getDriver().manage().timeouts().implicitlyWait(java.time.Duration.ofSeconds(10));
					List<WebElement> listBankCardTypes = getDriver().findElements(ElementBuy.BANK_CARD_TYPE.get());
					if (listBankCardTypes.size() > 0 && listBankCardTypes.get(0).isEnabled()) {

						WebElement bankCardtype = fwait
								.until(ExpectedConditions.elementToBeClickable(listBankCardTypes.get(0)));
						Select bankCardDrpDown = new Select(bankCardtype);
						super.scrolToElement(bankCardtype);
						if (bankCardtype.isDisplayed() && requiredPayMode.contains("card")) {

							bankCardDrpDown.selectByVisibleText("VISA");

						} else {
							// select bank name from net banking
							bankCardDrpDown.selectByVisibleText(bankName);

						}
						fwait.until(ExpectedConditions.invisibilityOfElementLocated(ElementBuy.LOADER.get()));

					}

					Thread.sleep(2000);
					List<WebElement> listConvCharge = getDriver().findElements(ElementBuy.PAYEMENT_CONV_CHARGE.get());
					int sizeConvCharge = listConvCharge.size();
					if (!offlinePayment && (requiredPayMode.contains("upi") || requiredPayMode.contains("net banking")
							|| requiredPayMode.contains("card"))) {
						if (sizeConvCharge > 0 && listConvCharge.get(0).isDisplayed()) {
							String payConvAlertCharge = listConvCharge.get(0).getText();
							payConvCharge = Float.parseFloat(payConvAlertCharge.replaceAll("[^0-9\\.]", ""));
							System.out.println("Convenience Charge Alert displayed-" + "'" + payConvAlertCharge + "'"
									+ "(" + requiredPayMode.toUpperCase() + ")");
							// in case UPi & there will be pay conv. charge
							if (payConvCharge != null)
								Assert.assertNotEquals("UPI- Payment Conv. is not applicable (Ignored further test)",
										"upi", requiredPayMode);

						}
					}

					if (!offlinePayment && !requiredPayMode.contains("upi") && !requiredPayMode.contains("card")) {
						List<WebElement> listAccountNum = getDriver().findElements(ElementBuy.ACCOUNT_NUMBER.get());
						List<WebElement> listIfsc = getDriver().findElements(ElementBuy.IFSC_CODE.get());
						for (WebElement accountNum : listAccountNum) {
							if (accountNum.isDisplayed()) {
								super.scrolToElement(accountNum);
								accountNum.sendKeys(accNumber);
								break;
							}
						}
						for (WebElement ifscCode : listIfsc) {
							if (ifscCode.isDisplayed()) {
								super.scrolToElement(ifscCode);
								ifscCode.sendKeys(ifscCd);
								break;
							}
						}
					} else if (requiredPayMode.contains("upi")) {
						super.upiAccount(upiId, accNumber, ifscCd);

					}

				}
			}
		}
		// --------------------------------------------
		// TCS related codes handled from here
		// to verify that tcs is applied or not in order summary
		// in case offline pay the tcs modal version 2.0 is already closed
		// -----------------------------------------------

		// payment conv. charge to check ,if is applied or not
		if (fullpayment && (requiredPayMode.contains("card") || requiredPayMode.contains("net banking"))) {
			Assert.assertNotEquals("Payment Conv. Charge is not applied for-" + requiredPayMode.toUpperCase(), null,
					payConvCharge);
		}
		// refreshed the order summary charges
		super.orderSummaryCharges();
		if ((TestRunner.tcsTwo || TestRunner.tcsThree)) {
			// total amount final to be refresh here just after timer opened
			// checking TCS applicable amount for tcs v3
			totalAmount = super.charges.get(totalKey);
			currentOrderTCSApplicable = totalAmount + gst;
			if (servCharge != null && isServiceChargeApplied)
				currentOrderTCSApplicable += servCharge;

			if (cardSpecific != null)
				currentOrderTCSApplicable += cardSpecific;
			if (payConvCharge != null) {
				System.out.println("Payment Conv. charge Applied- " + "'" + payConvCharge + "'" + "("
						+ requiredPayMode.toUpperCase() + ")");
				currentOrderTCSApplicable += payConvCharge;
			}
			if (bankFee != null) {
				currentOrderTCSApplicable += bankFee;
			}
			if (orderType.contains("remittance") && expectedNostro.contains("OURS")) {

				if (nostroChargeRemit != null) {
					System.out.println("Remit Nostro charge applied- " + nostroChargeRemit);
					currentOrderTCSApplicable += nostroChargeRemit;
				}
				if (charges.containsKey(nostroKey))
					Assert.assertTrue(
							"Nostro Charge shown zero under order summary (Possibly the best Vendor is YBL)  !!",
							nostroChargeRemit > 0.0);

				// the below line will work if best vendor is RBL
				Assert.assertTrue("Nostro Charge not shown under order summary (if best vendor-RBL)",
						charges.containsKey(nostroKey));

			}

			if (purposeSelectedCharge != null)
				currentOrderTCSApplicable += purposeSelectedCharge;
		}

		if (!offlinePayBtnOnly)
			super.tcsModalClose();
		// checking for TCS version applicable in order or not-------

		if (TestRunner.tcsOne && !(reviewScreenProduct.contains("combo"))) {
			if ((grandTotal > tcsThresholdAmount && orderType.contains("forex card"))) {
				tcsVersionOneApplicable = true;

				// sometime the tcs modal is not opened due to lock rate is not available (Adv
				// payment mode is off )
				if (currentOrderTCSApplicable == null)
					currentOrderTCSApplicable = grandTotal;

			} else if (totalAmount > tcsThresholdAmount && orderType.contains("wire transfer")) {
				tcsVersionOneApplicable = true;
				if (currentOrderTCSApplicable == null)
					currentOrderTCSApplicable = totalAmount;

			}

		}

		if (TestRunner.tcsTwo && !(listOfPuposeForTcsApplicable.contains(selectedPurpose))) {
			tcsVersionTwoApplicable = true;
		}

		if (TestRunner.tcsThree && !(orderType.contains("unload") || orderType.contains("sell"))
				&& selectedPurpose != null && !(selectedPurpose.contains(tcsExemptionPurpose))) {
			if (previousAmt != null) {
				Float totalOrdersDid = currentOrderTCSApplicable + previousAmt;
				Float newTcsApplicable = Math.abs(totalOrdersDid - tcsThresholdAmount);
				if (currentOrderTCSApplicable > tcsThresholdAmount || totalOrdersDid > tcsThresholdAmount) {
					tcsVersionThreeApplicable = true;
				}
				// re-checking TCS applicable amount for tcs v3
				if (currentOrderTCSApplicable > newTcsApplicable && !orderType.contains("forex card")) {
					currentOrderTCSApplicable = newTcsApplicable;
				}

			}
		}
		// Rounding off tcs applicable amount
		if (currentOrderTCSApplicable != null) {
			roundOffTcsApplicableCalculated = 0;
			roundOffTcsApplicableCalculated = Math.round(currentOrderTCSApplicable);
		}

		// below is commented as we don't know minerva end transactions for the user
		if ((TestRunner.tcsOne || TestRunner.tcsThree) && product.contains("forex card")
				&& super.roundOffDBTcsApplicable != 0 && !idAddonChargeApplied
				&& roundOffTcsApplicableCalculated != super.roundOffDBTcsApplicable) {
			roundOffTcsApplicableCalculated = super.roundOffDBTcsApplicable;
		}

		// -------------------checking for TCS version applicable in order or not ends
		// heres-------
		// refreshed the order summary charges
		super.orderSummaryCharges();
		super.istcsAppliedUnderSummary = charges.containsKey(tcsKey);

		if (currentOrderTCSApplicable != null && selectedPurpose != null && istcsAppliedUnderSummary) {

			if (tcsVersionOneApplicable) {

				System.out.println("TCS Applicable-" + "'" + tcsVersionOneApplicable + "'" + " for Product type-" + "'"
						+ orderType.toUpperCase() + "'" + " for purpose Code-" + "'" + selectedPurpose.toUpperCase()
						+ "'" + "\n" + " on tcs applicable amount-" + "'" + currentOrderTCSApplicable
						+ ". So Tcs Applied is-" + "'" + super.tcsCharge + " percentage @" + percentage + "'"
						+ " for current Fin-" + super.finYer);

			} else if (tcsVersionTwoApplicable || tcsVersionThreeApplicable) {

				if (super.tcsVersionTwo) {
					System.out.println("TCS Applicable-" + "'" + tcsVersionTwoApplicable + "'" + " for Product type-"
							+ "'" + orderType.toUpperCase() + "'" + "\n" + " for purpose Code-" + "'"
							+ selectedPurpose.toUpperCase() + "'" + " On tcs applicable amount-" + "'"
							+ currentOrderTCSApplicable + "'" + ". So Tcs Applied is-" + "'" + super.tcsCharge + "'"
							+ " percentage @" + percentage + " for current Fin-" + super.finYer);

				}

				if (super.tcsVersionThree) {
					System.out.println("TCS Applicable-" + "'" + tcsVersionThreeApplicable + "'" + " for Product type-"
							+ "'" + orderType.toUpperCase() + "'" + "\n" + " for purpose Code-" + "'"
							+ selectedPurpose.toUpperCase() + "'" + " On tcs applicable amount-" + "'"
							+ currentOrderTCSApplicable + "'" + ". So Tcs Applied is-" + "'" + super.tcsCharge + "'"
							+ " percentage @" + percentage + " for current Fin-" + super.finYer);

				}

			}

			// Tcs calculation checked here for v1/2/3
			super.tcscalculate();
			if (super.paymentRequiredForOrder && fullpayment) {
				// To check Net payable should be same
				super.orderSummaryCharges();
				List<WebElement> listNetPay = getDriver().findElements(ElementBuy.NET_PAYABLE.get());
				for (WebElement netPayWebElement : listNetPay) {
					if (netPayWebElement.isDisplayed()) {
						super.scrolToElement(netPayWebElement);
						String netpayableString = (String) jse.executeScript("return arguments[0].innerText;",
								netPayWebElement);
						// netPayWebElement.getText();
						netPayable = Float.parseFloat(netpayableString.replaceAll("[^0-9\\.]", ""));
						break;
					}
				}
				if (netPayable != null)
					Assert.assertEquals("Net payble and grand Total is different !!", netPayable, grandTotal);
			}

		} else if (tcsVersionOneApplicable || tcsVersionTwoApplicable || tcsVersionThreeApplicable) {

			System.out.println("TCS is applicable but under order Summary is shown-" + "'" + istcsAppliedUnderSummary
					+ "'" + " for Product type-" + "'" + orderType.toUpperCase() + "'" + "\n" + " , purpose Code-" + "'"
					+ selectedPurpose.toUpperCase() + "'" + " , Grand total Amount :" + "'" + grandTotal + "'"
					+ (super.modalTcsFinalApplied != null
							? (" , Tcs applied as per Modal:" + "'" + super.modalTcsFinalApplied + "'"
									+ " for current Fin-" + super.finYer)
							: ", & Aslo tcs Modal not Shown"));

			Assert.assertTrue("TCS charge should be shown under order summary  !!", istcsAppliedUnderSummary);

		} else {

			System.out.println("TCS is applicable -" + "'" + istcsAppliedUnderSummary + "'" + " for Product type-" + "'"
					+ orderType.toUpperCase() + "'" + "\n" + " & purpose Code-" + "'" + selectedPurpose.toUpperCase()
					+ "'" + " , Grand total Amount :" + "'" + grandTotal + "'");
		}

		// TCS should not be applicable in case TCS exempted purposes
		if (selectedPurpose.contains(tcsExemptionPurpose)) {
			System.out.println("TCS Applicable 'v1/v2/v3-' " + "'" + tcsVersionOneApplicable + " / "
					+ tcsVersionTwoApplicable + " / " + tcsVersionThreeApplicable + "'" + " for Product type-" + "'"
					+ orderType.toUpperCase() + "'" + " as purpose Code is-" + "'" + selectedPurpose.toUpperCase()
					+ "'");

			Assert.assertFalse("TCS is not applicable for purpose: " + tcsExemptionPurpose + " - ",
					istcsAppliedUnderSummary);
		}

		// tcs percentage should be 20% for buy card or combo order
		if (percentage != null && orderType.contains("buy")
				&& (product.contains("forex card") || product.contains("combo")))
			Assert.assertTrue("TCS percentage should be 20% for buy card or combo orders !!", percentage == 20);

		// to check if TCS is applied for unload /sell
		if (orderType.contains("unload") || orderType.contains("sell")) {
			Assert.assertFalse("TCS is not applicable for sell/unload !!", istcsAppliedUnderSummary);
		}

		// to check TCS Version 1.0 should be applied
		if (TestRunner.tcsOne && tcsVersionOneApplicable) {
			Assert.assertTrue("TCS version 1.0 applicable, But not applied (Modal not displayed) !!",
					super.tcsVersionOne);
			Assert.assertFalse("TCS version 1.0 applicable, But other Tcs v2 is shown !!", super.tcsVersionTwo);
			Assert.assertFalse("TCS version 1.0 applicable, But other Tcs v3 is shown !!", super.tcsVersionThree);
		}

		// to check TCS Version 2.0 should be applied
		if (TestRunner.tcsTwo && tcsVersionTwoApplicable) {
			Assert.assertFalse("TCS version 2.0 applicable, But other Tcs v1 is shown !!", super.tcsVersionOne);
			Assert.assertTrue("TCS version 2.0 applicable, But not applied (Modal not displayed) !!",
					super.tcsVersionTwo);
			Assert.assertFalse("TCS version 2.0 applicable, But other Tcs v3 is shown !!", super.tcsVersionThree);

		}

		if (TestRunner.tcsThree && tcsVersionThreeApplicable) {
			Assert.assertFalse("TCS version 3.0 applicable,  But other Tcs v1 is shown !!", super.tcsVersionOne);
			Assert.assertFalse("TCS version 3.0 applicable, But other Tcs v2 is shown !!", super.tcsVersionTwo);
			Assert.assertTrue("TCS version 3.0 applicable, But not applied (Modal not displayed) !!",
					super.tcsVersionThree);
		}
		// --------------- TCS related codes ended here-------------------//

		if (super.paymentRequiredForOrder) {
			getDriver().manage().timeouts().implicitlyWait(java.time.Duration.ofSeconds(10));
			listOpionalLockInrate = getDriver().findElements(ElementBuy.LOCK_IN_RATE_OPTIONAL.get());
			if (listOpionalLockInrate.size() > 0 && listOpionalLockInrate.get(0).isDisplayed()) {
				super.paymentRequiredForOrder = false;
				WebElement confirmOrderWithOutLock = listOpionalLockInrate.get(1);
				super.scrolToElement(confirmOrderWithOutLock);
				confirmOrderWithOutLock.click();
				requiredPayMode = "adv/fullpayment not allowed for Now";
				System.out.println("User selected to confirm order with out lock in adv payment, for order :"
						+ orderType.toUpperCase());

			}
			fwait.until(ExpectedConditions.invisibilityOfElementLocated(ElementBuy.LOADER.get()));
			super.inputRemarks(remarks);
			// in case there is no payment to be made in order will confirm order only
			super.confirmOrder();
		}

		super.payDisclaimTipVerify();

		if (super.paymentRequiredForOrder && !offlinePayBtnOnly) {
			super.paynConfirm();

//			 the below is commented as manik removed the check box dt-21/02/2024
//			boolean wantBuyCardDeclChecked = false;
//			if (orderType.contains("buy") && orderType.contains("forex card")) {
//				Thread.sleep(2000);
//				List<WebElement> fieldReqErrormsg = getDriver().findElements(ElementBuy.THIS_FIELD_REQ.get());
//				if (fieldReqErrormsg.size() > 0 && fieldReqErrormsg.get(0).isDisplayed()) {
//					WebElement iConfirmCardBuy = getDriver().findElement(ElementBuy.I_CONFIRM_CARD_BUY.get());
//
//					super.scrolToElement(iConfirmCardBuy);
//					jse.executeScript("arguments[0].click()", iConfirmCardBuy);
//					wantBuyCardDeclChecked = true;
//					System.out.println(iConfirmCardBuy.getText() + " -isChecked as " + "'"
//							+ fieldReqErrormsg.get(0).getText() + "'");
//					super.paynConfirm();
//				}
//
//				Assert.assertTrue("I, confirm I want to buy a BookMyForex forex card- not checked",
//						wantBuyCardDeclChecked);
//			}
			super.upiLimit();

		}

		if (!requiredPayMode.contains("adv/fullpayment not allowed")) {
			for (int j = 0; j < 3; j++) {
				// name mismatch modal opens when there is any mismatch with order and bank name
				Thread.sleep(2000);
				List<WebElement> listNameMisDialog = getDriver().findElements(ElementBuy.NAME_MISMATCH_DIALOG.get());
				if (listNameMisDialog.size() > 0 && listNameMisDialog.get(0).isDisplayed()) {
					String nameMismtachtext = null;

					fwait.until(ExpectedConditions.invisibilityOfElementLocated(ElementBuy.LOADER.get()));

					WebElement nameMisMatchModal = fwait
							.until(ExpectedConditions.elementToBeClickable(ElementBuy.NAME_MISMATCH_PAY.get()));

					if (orderType.contains("unload") || orderType.contains("sell")) {
						nameMismtachtext = "the name on your bank account doesn't seem to match the name mentioned in the"
								+ " order. as per regulations the proceeds of foreign currency sale must be deposited in the"
								+ " bank account of the traveller/ cardholder (or business in case of a business order)."
								+ " if you proceed, your order will be verified manually and our team may contact you to"
								+ " understand this discrepancy. the order may be cancelled and associated cancellation"
								+ " charges may be applied if it is determined that the funds are being transferred to a third party.";

					} else {
						nameMismtachtext = "the name on your bank account doesn't seem to match the name mentioned in the order."
								+ " as per regulations the payment for this order must come from a bank account belonging to the"
								+ " traveller/ remitter or a close relative of the traveller/ remitter. Our team may contact you"
								+ " to understand this discrepancy. the order may be cancelled and associated cancellation charges"
								+ " may be applied if the funds for this order are received via another person/ entity.";
					}
					String actualnameMisMtachtext = getDriver().findElement(ElementBuy.BANK_NAME_MISMATCH_TEXT.get())
							.getText().toLowerCase();
					jse.executeScript("arguments[0].click()", nameMisMatchModal);
					Assert.assertEquals("The text on name Mis-match modal not same as expected-" + orderType,
							nameMismtachtext.toLowerCase(), actualnameMisMtachtext.toLowerCase());

					fwait.until(ExpectedConditions.invisibilityOfElementLocated(ElementBuy.LOADER.get()));
					fwait.until(ExpectedConditions.invisibilityOf(nameMisMatchModal));
					break;
				}

			}
		}
	}

	@Then("^payment done via Razorpay$")
	public void orderPayment() throws Throwable {
		super.paymentDone = false;
		// in case card payment to use
		String cardnumber = "4315810559288000";
		String expirydt = "1225";
		String cvv = "158";
		String pw = null;
		String cw = null;
		for (int j = 0; j < 3; j++) {
			if (super.paymentRequiredForOrder) {
				fwait.until(ExpectedConditions.invisibilityOfElementLocated(ElementBuy.LOADER.get()));
				Thread.sleep(5000);
				if (simPayment || requiredPayMode.contains("neft/ rtgs") || (offlinePayBtnOnly && offlinePayment)) {
					requiredPayMode = requiredPayMode + "- netbanking "; // over ride to required mode if is upi
					System.out.println("Advance amount to paid / Sim payment ");
				} else if (requiredPayMode.contains("debit") || requiredPayMode.contains("credit")) {
					requiredPayMode = "card"; // on razor pay modal its card instead of debit/credit
				}
				// After razorpay operations
				if (requiredPayMode.contains("upi")) {
					// UPI QR code case handled
					Thread.sleep(5000);
					paymentDone = true;

				} else if (!requiredPayMode.contains("upi") && (simPayment || fullpayment || offlinePayment)) {
					// int iframe = iframeElements.size() - 1;
					List<WebElement> iframeElements = getDriver().findElements(ElementBuy.I_FRAME.get());
					for (WebElement frames : iframeElements) {
						if (frames.isDisplayed()) {
							fwait.until(ExpectedConditions.frameToBeAvailableAndSwitchToIt(frames));
							break;
						}

					}

					try {

						// for full payment of www and via net banking
						if (fullpayment && requiredPayMode.contains("net banking") && !offlinePayBtnOnly) {
							super.razorPayNow();
						} else {
							Thread.sleep(2000);
							// Razorpay list of paymodes upi,netbanking,emi,debit/credit
							List<WebElement> listRazorPayAllModes = getDriver()
									.findElements(ElementBuy.RZR_ALLPAYMODE_SELECT.get());
							for (WebElement payMode : listRazorPayAllModes) {
								String paymodeTxt = payMode.getText().toLowerCase();
								if (requiredPayMode.contains(paymodeTxt)) {
									jse.executeScript("arguments[0].click()", payMode);
									if (payMode.isDisplayed())
										payMode.click();

									break;
								}
							}

							if (requiredPayMode.contains("card")) {
								for (int i = 0; i < 3; i++) {
									Thread.sleep(1000);
									List<WebElement> lisCardNum = getDriver().findElements(ElementBuy.CARD_NO.get());
									if (lisCardNum.size() > 0 && lisCardNum.get(0).isDisplayed()) {
										getDriver().findElement(ElementBuy.CARD_EXPIRY.get()).sendKeys(expirydt);
										getDriver().findElement(ElementBuy.CARD_CVV.get()).sendKeys(cvv);
										lisCardNum.get(0).sendKeys(cardnumber);
										WebElement saveCardDetails = getDriver()
												.findElement(ElementBuy.INPUT_SAVE.get());
										if (saveCardDetails.isSelected()) {
											// it should uncheck, save card details by default sometime checked
											getDriver().findElement(ElementBuy.CARD_SAVE.get()).click();
										}
										break;
									}

								}
							}

						}

						// Select bank names in case offline pay mode/ full payment

						if (offlinePayment || simPayment)
							for (int i = 0; i < 3; i++) {
								Thread.sleep(1000);
								List<WebElement> listSelectBank = getDriver()
										.findElements(ElementBuy.RZR_NETBANK.get());
								if (listSelectBank.size() > 0 && listSelectBank.get(0).isDisplayed()
										&& requiredPayMode.contains("netbanking")) {
									for (WebElement selectAnyBank : listSelectBank) {
										String bankName = selectAnyBank.getText().toLowerCase();
										if (selectAnyBank.isDisplayed() && bankName.contains("icici")) {
											selectAnyBank.click();
											break;
										}
									}
								}
							}

						// after selected netbanking or debit/credit card paynow click & is final button
						// to click and open success modal
						if (requiredPayMode.contains("card") || offlinePayment || simPayment) {
							super.razorPayNow();

							// some time razorpay send notification for higher failure net banking provider
							Thread.sleep(1000);
							List<WebElement> warningChanceFailModalList = getDriver()
									.findElements(ElementBuy.RZR_WARNING_FAILURE.get());

							for (WebElement proceedwithWarning : warningChanceFailModalList) {
								if (proceedwithWarning.getText().toLowerCase().contains("continue")) {
									proceedwithWarning.click();
								}

							}
						}

						if (device.contains("desktop")) {
							Set<String> s = getDriver().getWindowHandles();
							Iterator<String> t = s.iterator();

							pw = t.next();
							cw = t.next();
							// Now iterate web browser windows using Iterator

							getDriver().switchTo().window(cw);
						}
						System.out.println("Web title is " + getDriver().getTitle());
						Thread.sleep(1000);
						List<WebElement> listOtpModal = getDriver()
								.findElements(ElementBuy.DEBIT_CREDIT_CARD_OTP.get());
						if (requiredPayMode.contains("card") && listOtpModal.size() > 0
								&& listOtpModal.get(0).isDisplayed()) {

							getDriver().findElement(ElementBuy.DEBIT_CREDIT_CARD_OTP.get()).sendKeys("159753");
							getDriver().findElement(ElementBuy.OTP_SUBMIT.get()).click();
							paymentDone = true;

						} else {

							WebElement success = fwait
									.until(ExpectedConditions.elementToBeClickable(ElementBuy.RZR_SUCESS.get()));
							jse.executeScript("arguments[0].click()", success);
							// success.click();
							paymentDone = true;

						}
						if (pw != null)
							getDriver().switchTo().window(pw);

					} catch (Exception e) {
						System.out.println(e.getMessage());

					}

				}

			}

			if (paymentDone)
				break;

		}
		if (paymentRequiredForOrder)
			Assert.assertTrue("Payment is required but is failed,Payment failure,Please Check Manually !!",
					paymentDone);

	}

	@Then("^user redirected to Order confirmation screen & get Order Reference Number$")
	public void orderConfirmationScreen() throws Throwable {
		reflink = null;
		try {
			System.out.println("Payment Mode Was-" + "'" + requiredPayMode.toUpperCase() + "'");
			super.orderRef(10);

		} catch (Exception e) {
			System.err.println("Order ref not generated due to-" + e.getMessage());
		}
		Assert.assertTrue("Seems No OC screen found/Reference No. not generated", super.orderRefGenerated);
	}

	@And("^to verify tat Message for required section$")
	public void tatMessageCheck() throws Throwable {

		// Tat info message checked
		super.tatInfo();

	}

	@Then("^User given all below details to order sim$")
	public void orderSim(DataTable simBuy) throws Throwable {
		cucumberDataTable = simBuy.asMaps(String.class, String.class);
		product = "sim";
		orderType = cucumberDataTable.get(0).get("orderType").toLowerCase();
		super.firstCountry = cucumberDataTable.get(0).get("tcountryOne");
		super.secondCountry = cucumberDataTable.get(0).get("tcountryTwo");
		super.travelBeforeAfterToday = Integer.parseInt(cucumberDataTable.get(0).get("departAfterToday"));
		super.returnAfterToday = Integer.parseInt(cucumberDataTable.get(0).get("returnAfterToday"));

		WebElement selectCountry = getDriver().findElement(ElementBuy.SIM_TO_COUNTRY.get());
		Select travelCountry = new Select(selectCountry);
		if (firstCountry != null)
			travelCountry.selectByVisibleText(firstCountry);
		if (secondCountry != null)
			travelCountry.selectByVisibleText(secondCountry);

		webElementTravelStartSelect = getDriver().findElement(ElementBuy.SIM_TRAVEL.get());
		webElementTravelStartSelect.click();
		super.traveldateselect();

	}

	@Then("^User able to buy sim after given all details$")
	public void showSimPlan() throws Throwable {
		super.bookOrderLogic(ElementBuy.SIM_SHOW_PLANS.get());

	}

	@And("^User select the plan$")
	public void selectPlan() throws Throwable {

		for (int i = 0; i <= 3; i++) {
			if (actualHeaderName.toLowerCase().contains("plan details")) {
				List<WebElement> ListBuybtns = getDriver().findElements(ElementBuy.SIM_BUY_BTNS.get());
				for (WebElement selectplan : ListBuybtns) {
					if (selectplan.isDisplayed()) {
						selectplan.click();
						break;
					}
				}
				super.simOrderContinue();
				break;
			} else {
				landedForexScreen(10);
			}
			Thread.sleep(1500);
		}
	}

	@Then("^Activation, address Submit and Sim book$")
	public void simbook() throws Throwable {

		super.simOrderContinue();

	}

	@Then("^Sim order payment$")
	public void simPay(DataTable dtpaydetails) throws Throwable {
		refNumber = null;
		cucumberDataTable = dtpaydetails.asMaps(String.class, String.class);
		requiredPayMode = StringUtils.capitalize(cucumberDataTable.get(0).get("payMode"));
		String bankName = cucumberDataTable.get(0).get("bankName");
		fwait.until(ExpectedConditions.urlContains("/sim-order-review"));

		WebElement payMode = getDriver().findElement(ElementBuy.SIM_PAY_MODE.get());
		Select selectPayMode = new Select(payMode);
		selectPayMode.selectByVisibleText(requiredPayMode);

		WebElement subPayMode = getDriver().findElement(ElementBuy.SIM_SUB_PAY_MODE.get());
		Select selectSubPayMode = new Select(subPayMode);

		if (requiredPayMode.contains("Net Banking"))
			selectSubPayMode.selectByVisibleText(bankName);
		else if (!requiredPayMode.contains("upi"))
			selectSubPayMode.selectByVisibleText("VISA");
		paymentRequiredForOrder = true;
		simPayment = true;
		refNumber = getDriver().findElement(ElementBuy.SIM_ORD_REF.get()).getText();
		super.paynConfirm();

	}

}