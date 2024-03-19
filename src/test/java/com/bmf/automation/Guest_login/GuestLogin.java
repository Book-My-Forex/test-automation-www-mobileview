package com.bmf.automation.Guest_login;

import io.cucumber.datatable.DataTable;
import io.cucumber.java.en.And;

import java.util.List;
import java.util.Map;

import org.junit.Assert;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.WebElement;

import org.openqa.selenium.support.ui.ExpectedConditions;

import com.bmf.automation_commons.BmfTestCommon;

public class GuestLogin extends BmfTestCommon {
	JavascriptExecutor jse = (JavascriptExecutor) getDriver();
	List<Map<String, String>> cucumberDataTable;
	List<WebElement> listGuestPhone = null;

	@And("^User Login with Guest details$")
	public void guestLogin(DataTable guestDT) throws Throwable {
		cucumberDataTable = guestDT.asMaps(String.class, String.class);
		String fixedOtp = cucumberDataTable.get(0).get("fixedOtp");
		String phoneNo = cucumberDataTable.get(0).get("phoneNumber");
		String email = cucumberDataTable.get(0).get("email");
		String name = cucumberDataTable.get(0).get("name");
		for (int j = 0; j < 3; j++) {
			try {

				for (int i = 0; i < 3; i++) {
					listGuestPhone = getDriver().findElements(ElementGuestLogin.GUEST_LOGIN_DIALOG.get());
					if (listGuestPhone.size() > 0 && listGuestPhone.get(0).isDisplayed()) {
						WebElement enterPhone = getDriver().findElement(ElementGuestLogin.GUEST_PHONE.get());
						enterPhone.sendKeys(phoneNo);

						WebElement phoneSubmit = getDriver().findElement(ElementGuestLogin.SUBMIT_BTN.get());
						jse.executeScript("arguments[0].click()", phoneSubmit);
						fwait.until(
								ExpectedConditions.invisibilityOfElementLocated(ElementGuestLogin.SUBMIT_BTN.get()));

						Thread.sleep(1500);
						List<WebElement> listEmailEdit = getDriver()
								.findElements(ElementGuestLogin.GUEST_EMAIL_EDIT.get());
						if (listEmailEdit.size() > 0 && listEmailEdit.get(0).isDisplayed()) {

							WebElement editBtn = fwait
									.until(ExpectedConditions.elementToBeClickable(listEmailEdit.get(0)));
							jse.executeScript("arguments[0].click()", editBtn);

						}
						WebElement enterEmail = fwait
								.until(ExpectedConditions.elementToBeClickable(ElementGuestLogin.GUEST_EMAIL.get()));
						enterEmail.sendKeys(email);

						WebElement enterName = fwait
								.until(ExpectedConditions.elementToBeClickable(ElementGuestLogin.GUEST_NAME.get()));
						enterName.sendKeys(name);

						WebElement sendOTP = fwait.until(
								ExpectedConditions.elementToBeClickable(ElementGuestLogin.MOBILE_OTP_RADIO.get()));
						sendOTP.click();

						WebElement otptext = fwait
								.until(ExpectedConditions.elementToBeClickable(ElementGuestLogin.GUEST_OTP_TEXT.get()));
						otptext.sendKeys(fixedOtp);

						WebElement confirmOTP = getDriver().findElement(ElementGuestLogin.CONFIRM_OTP.get());
						Thread.sleep(2000);
						jse.executeScript("arguments[0].click()", confirmOTP);
						fwait.until(ExpectedConditions.invisibilityOf(listGuestPhone.get(0)));
						guestLogin = true;
						break;
					}

					Thread.sleep(2500);

				}
			} catch (Exception e) {

				System.err.println("Something not right-" + e.getMessage());

			}
		}
		if (actualHeaderName.contains("home screen"))
			Assert.assertTrue("Guest Login Failed", guestLogin);
	}
}
