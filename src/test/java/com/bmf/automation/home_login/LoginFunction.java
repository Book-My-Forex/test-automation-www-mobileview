package com.bmf.automation.home_login;

import io.cucumber.datatable.DataTable;
import io.cucumber.java.After;

import io.cucumber.java.Scenario;
import io.cucumber.java.en.And;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;

import java.io.File;

import java.util.List;

import org.apache.commons.lang3.RandomStringUtils;
import org.junit.Assert;
import org.junit.Assume;

import org.openqa.selenium.OutputType;
import org.openqa.selenium.TakesScreenshot;
import org.openqa.selenium.WebElement;

import org.openqa.selenium.io.FileHandler;
import org.openqa.selenium.support.ui.ExpectedCondition;
import org.openqa.selenium.support.ui.ExpectedConditions;

import com.bmf.automation.buy_order.ElementBuy;
import com.bmf.automation.buy_order.ElementMobileBuy;
import com.bmf.automation.runner.TestRunner;
import com.bmf.automation_commons.BmfTestCommon;

import com.google.common.base.Joiner;

public class LoginFunction extends BmfTestCommon {

	@Given("^User opens BookMyForex url is '(.*)'$")
	public void OpenBmf(String url) throws Throwable {
		TestRunner.isMobileMode = false;
		device = "desktop";
		// is used for tat info message with Initial value
		weforexAmount = null;
		actualHeaderName = "home screen";
		betterrateContinueWithCashBack = false;
		forexPageLoaded = false;
		pageloaded = false;
		guestLogin = false;
		login = false;

		if (reflink != null && orderType != null && orderType.toLowerCase().contains("referral"))
			getDriver().get(reflink);
		else
			getDriver().get("https://" + TestRunner.env + '.' + url);
		for (int i = 0; i < 5; i++) {

			super.pageLoadError();
			if (errorCode == null) {
				pageloaded = true;
				super.promoApplied = false;
				System.out.println("BMF is loaded-" + "'" + pageTitle + "'");

				getDriver().navigate().refresh();
				// due to automation sometime due to previous test the user is logged in already
				for (int k = 0; k < 3; k++) {
					List<WebElement> listLogOutBtn = getDriver().findElements(ElementHome.LOGOUT_BTN.get());
					for (WebElement logout : listLogOutBtn) {
						if (logout.isDisplayed()) {
							System.out.println("Already Loged In .Log out button clicking..");
							WebElement logoutBtn = fwait
									.until(ExpectedConditions.elementToBeClickable(listLogOutBtn.get(0)));
							jse.executeScript("arguments[0].click()", logoutBtn);

							break;
						}
					}
					Thread.sleep(2500);
				}
				break;
			}

		}
		Thread.sleep(1000);
		List<WebElement> listStickyClose = getDriver().findElements(ElementHome.CLOSE_HOME_STIKCY.get());
		if (listStickyClose.size() > 0 && listStickyClose.get(0).isDisplayed())
			listStickyClose.get(0).click();
		if (errorCode != null)
			Assert.assertTrue("BookMyForex Loading Failed due to-" + "'" + errorCode + "'", pageloaded);
	}

	@And("^login with newlycreated user$")
	public void newLogedIn() throws Throwable {
		LogedIn(email, phoneNo, psw);

	}

	@Given("^User opens mobile version BookMyForex url is '(.*)'$")
	public void OpenMobBmf(String url, DataTable dt) throws Throwable {

		Assert.assertTrue("in Test runner isMobileMode is false so mobile view can't chekced", TestRunner.isMobileMode);
		cucumberDataTable = dt.asMaps(String.class, String.class);
		device = cucumberDataTable.get(0).get("device").toLowerCase();

		// is used for tat info message with Initial value
		weforexAmount = null;
		actualHeaderName = "home screen";
		betterrateContinueWithCashBack = false;
		forexPageLoaded = false;
		pageloaded = false;
		guestLogin = false;
		login = false;
		getDriver().get("https://" + TestRunner.env + '.' + url);

		for (int i = 0; i < 5; i++) {

			super.pageLoadError();
			if (errorCode == null) {
				pageloaded = true;
				super.promoApplied = false;
				System.out.println("BMF is loaded-" + "'" + pageTitle + "'");

				getDriver().navigate().refresh();
				Thread.sleep(1200);
				getDriver().findElement(ElementMobileBuy.M_LEFT_MENU.get()).click();
				fwait.until(ExpectedConditions.visibilityOfElementLocated(ElementMobileBuy.M_CLOSE_MENU.get()));
				List<WebElement> listLoginCommom = getDriver().findElements(ElementMobileBuy.M_LOGIN_COMMON.get());

				for (WebElement btn : listLoginCommom) {

					if (btn.isDisplayed() && btn.getText().toLowerCase().contains("log out")) {
						System.out.println("Already Loged In .Log out button clicking..");
						btn.click();

					}
				}
				break;
			}

		}
		if (errorCode != null)
			Assert.assertTrue("www Loading Failed due to -" + "'" + errorCode + "'", pageloaded);
	}

	@Given("^User opens agent BookMyForex url is '(.*)'$")
	public void OpenAgentBmf(String url) throws Throwable {
		// is used for tat info message
		device = "desktop";
		actualHeaderName = "home screen";
		forexPageLoaded = false;
		pageloaded = false;
		guestLogin = false; // intial value
		login = false;// intial value
		getDriver().get("https://" + TestRunner.agentEnv + '.' + url);
		for (int i = 0; i < 5; i++) {
			super.pageLoadError();
			if (errorCode == null) {
				pageloaded = true;
				super.promoApplied = false;
				System.out.println("Agent BMF is loaded-" + "'" + pageTitle + "'");
				getDriver().navigate().refresh();
				Thread.sleep(5000);
				break;
			}

		}

		if (errorCode != null)
			Assert.assertTrue("Agent www Loading Failed due to -" + "'" + errorCode + "'", pageloaded);
	}

	@When("^User enters correct credentials for mobile view '(.*)', '(.*)' & '(.*)'$")
	public void mLogedIn(String email, String phone, String password) throws Throwable {
		errorMessage = null;
		loginBtnShown = false;
		if (pageloaded) {
			try {

				getDriver().findElement(ElementMobileBuy.M_LEFT_MENU.get()).click();
				fwait.until(ExpectedConditions.visibilityOfElementLocated(ElementMobileBuy.M_CLOSE_MENU.get()));
				Thread.sleep(1200);
				List<WebElement> listLoginCommom = getDriver().findElements(ElementMobileBuy.M_LOGIN_COMMON.get());

				for (WebElement btn : listLoginCommom) {
					if (btn.isDisplayed())
						if (btn.getText().toLowerCase().contains("sign in")) {
							loginBtnShown = true;
							btn.click();
							WebElement emailPhone = fwait
									.until(ExpectedConditions.elementToBeClickable(ElementHome.EMAIL_PHONE.get()));
							emailPhone.sendKeys(email);
							WebElement passwordTextbox = fwait
									.until(ExpectedConditions.elementToBeClickable(ElementHome.PASSWORD.get()));
							passwordTextbox.sendKeys(password);
							List<WebElement> listPhoneNumber = getDriver().findElements(ElementHome.PHONE.get());
							if (listPhoneNumber.get(0).isDisplayed())
								listPhoneNumber.get(0).sendKeys(phone);

							WebElement confirmbtn = getDriver().findElement(ElementHome.SUBMIT_CREDENTILAS.get());
							jse.executeScript("arguments[0].click()", confirmbtn);
							fwait.until(ExpectedConditions.invisibilityOf(confirmbtn));
							login = true;
							break;
						}

				}
			} catch (Exception e) {
				Thread.sleep(500);
				List<WebElement> responseLoginList = getDriver().findElements(ElementHome.RESPONSE_LOGIN.get());
				for (WebElement message : responseLoginList) {
					if (message.isDisplayed()) {
						errorMessage = message.getText().toLowerCase();
						break;
					}
				}
				if (errorMessage != null && errorMessage.contains("expired"))
					Assert.assertTrue(errorMessage.toUpperCase(), login);
				else if (errorMessage != null
						&& (errorMessage.contains("invalid password") || errorMessage.contains("forgot your password")))
					Assume.assumeTrue(errorMessage.toUpperCase(), login);
				else if (loginBtnShown)
					Assert.assertTrue("Login Failed, Check Manually !!", login);

			}

		} else {
			getDriver().quit();
		}

	}

	@Then("^get referral link from my account$")
	public void getRefLink() throws Throwable {
		String text;

		fwait.until(ExpectedConditions.invisibilityOfElementLocated(ElementBuy.LOADER.get()));
		List<WebElement> listCommonLoginWin = getDriver().findElements(ElementHome.COMMON_LOGINWINDO.get());
		for (WebElement myAcount : listCommonLoginWin) {
			if (myAcount.isDisplayed()) {
				text = myAcount.getText();
				if (text.toLowerCase().contains("my account")) {
					myAcount.click();
					text = null;
					break;
				}
			}
		}
		fwait.until(ExpectedConditions.visibilityOfElementLocated(ElementHome.MY_AC_IMG.get()));
		fwait.until(ExpectedConditions.invisibilityOfElementLocated(ElementBuy.LOADER.get()));
		Thread.sleep(2500);
		List<WebElement> myAcNavList = getDriver().findElements(ElementHome.MY_AC_NAV_MENU.get());
		for (WebElement navmanu : myAcNavList) {
			if (navmanu.isDisplayed()) {
				text = navmanu.getText();
				if (text.toLowerCase().contains("referrals")) {
					navmanu.click();
					getDriver().findElement(ElementHome.REFERRAL_BTN.get()).click();
					Thread.sleep(1000);
					fwait.until(ExpectedConditions.visibilityOfElementLocated(ElementHome.REF_CODE.get()));
					String link = getDriver().findElement(ElementHome.REF_LINK.get()).getText();
					if (!TestRunner.env.toLowerCase().contains("www"))
						reflink = link.replace("www", TestRunner.env);

					System.out.println("Referral link- " + reflink);
					text = null;
					break;
				}
			}
		}

	}

	@When("^User enters correct credentials '(.*)', '(.*)' & '(.*)'$")
	public void LogedIn(String email, String phone, String password) throws Throwable {
		errorMessage = null;
		loginBtnShown = false;
		List<WebElement> listLoginBtn = null;
		if (pageloaded) {
			try {

				for (int i = 0; i < 5; i++) {

					listLoginBtn = getDriver().findElements(ElementHome.LOGIN_BTN.get());
					if (listLoginBtn.size() == 0)
						listLoginBtn = getDriver().findElements(ElementHome.CMS_LOGIN.get());
					if (listLoginBtn.size() > 0 && listLoginBtn.get(0).isDisplayed()) {
						WebElement loginButton = listLoginBtn.get(0);
						loginBtnShown = true;
						loginButton.click();
						fwait.until(ExpectedConditions.visibilityOfElementLocated(ElementHome.LOGIN_DIALOG.get()));
						WebElement emailPhone = fwait
								.until(ExpectedConditions.elementToBeClickable(ElementHome.EMAIL_PHONE.get()));
						emailPhone.sendKeys(email);
						WebElement passwordTextbox = fwait
								.until(ExpectedConditions.elementToBeClickable(ElementHome.PASSWORD.get()));
						passwordTextbox.sendKeys(password);
						List<WebElement> listPhoneNumber = getDriver().findElements(ElementHome.PHONE.get());
						if (listPhoneNumber.get(0).isDisplayed())
							listPhoneNumber.get(0).sendKeys(phone);

						WebElement confirmbtn = getDriver().findElement(ElementHome.SUBMIT_CREDENTILAS.get());
						jse.executeScript("arguments[0].click()", confirmbtn);
						// confirmbtn.click();

						fwait.until(ExpectedConditions.invisibilityOf(confirmbtn));
						login = true;

						break;

					}
					Thread.sleep(2000);

				}
			} catch (Exception e) {
				Thread.sleep(500);
				List<WebElement> responseLoginList = getDriver().findElements(ElementHome.RESPONSE_LOGIN.get());
				for (WebElement message : responseLoginList) {
					if (message.isDisplayed()) {
						errorMessage = message.getText().toLowerCase();
						break;
					}
				}
				if (errorMessage != null && errorMessage.contains("expired"))
					Assert.assertTrue(errorMessage.toUpperCase(), login);
				else if (errorMessage != null
						&& (errorMessage.contains("invalid password") || errorMessage.contains("forgot your password")))
					Assume.assumeTrue(errorMessage.toUpperCase(), login);
				else if (loginBtnShown)
					Assert.assertTrue("Login Failed, Check Manually !!", login);

			}

		} else {
			getDriver().quit();
		}
	}

	@When("^User enters correct credentials To sign up$")
	public void signUp(DataTable signUpdt) throws Throwable {

		cucumberDataTable = signUpdt.asMaps(String.class, String.class);
		orderType = "referral / signUp case";
		phoneNo = cucumberDataTable.get(0).get("phone");
		email = cucumberDataTable.get(0).get("email").toLowerCase();
//		String intialPhoneNum = cucumberDataTable.get(0).get("firstTwoPhoneDigit");
//		String intialEmail = cucumberDataTable.get(0).get("emailStartwith");
		String otp = cucumberDataTable.get(0).get("otpFixed");
		String name = cucumberDataTable.get(0).get("name");
		psw = cucumberDataTable.get(0).get("password");

		if (TestRunner.env.contains("uat") || TestRunner.env.contains("kube-dev")) {
			super.connectDb("DELETE from users where email=" + "'" + email + "';", null, null);

		} else {
//			super.connectDb("update skip_otp_for set phone_email_contact =" + phoneNo + " where id=0");
//			super.connectDb("update skip_otp_for set phone_email_contact =" + "'" + email + "'" + " where id=23");
		}

		if (orderType.toLowerCase().contains("referral") && phoneNo != null && email != null) {
//			if (panNum.toUpperCase().contains("AWCPC2162M"))
			super.connectDb("DELETE from leads l where  l.phone ='" + phoneNo + "' ;", null, null);
			super.connectDb("DELETE from leads l where  l.email ='" + email + "' ;", null, null);
			super.connectDb(
					"DELETE from lead_attributes la where la.pan_card_no ='Y29tLmJtZi5yYW5kb21pdmNvbS5ibWYuc2FsdD8sfKoTVteN+gN5Uwbruj8=';",
					null, null);
//			else
//				System.out.println("please encrypt the pan number first fro new pan-" + panNum);

		}
		getDriver().findElement(ElementHome.REGISTER_BTN.get()).click();

		fwait.until(ExpectedConditions.visibilityOfElementLocated(ElementHome.REG_DIALOG.get()));

		getDriver().findElement(ElementHome.REG_NAME.get()).sendKeys(name);
		getDriver().findElement(ElementHome.REG_EMAIL.get()).sendKeys(email);
		getDriver().findElement(ElementHome.REG_PHONE.get()).sendKeys(phoneNo);
		getDriver().findElement(ElementHome.REG_PSWD.get()).sendKeys(psw);

		getDriver().findElement(ElementHome.REG_Re_PSWD.get()).sendKeys(psw);

		WebElement phoneOtpVerify = getDriver().findElement(ElementHome.REG_EMAIL_OTP_INP.get());
		if (!phoneOtpVerify.isSelected())
			getDriver().findElement(ElementHome.REG_OTP_EMAIL.get()).click();

		getDriver().findElement(ElementHome.REG_SUBMIT.get()).click();

		fwait.until(ExpectedConditions.visibilityOfElementLocated(ElementHome.REG_OTP_INPUT.get())).sendKeys(otp);
		WebElement otpSubmit = getDriver().findElement(ElementHome.REG_OTP_SUBMIT.get());
		otpSubmit.click();

		fwait.until(ExpectedConditions.invisibilityOf(otpSubmit));

	}

	@When("^veify registered successfully$")
	public void signUpDoneCheck() throws Throwable {
		boolean registerDoneAuser = false;
		// to update we generated some random mails but for now commented as we are
		// delted the user every time registered
//		phoneNo = intialPhoneNum + RandomStringUtils.randomNumeric(8);
//		email = intialEmail + System.currentTimeMillis() + "@yopmail.com";
		// System.out.println("Here is phone number /email used to register: -" +
		// phoneNo + "\n" + email);
		for (int i = 0; i < 3; i++) {
			Thread.sleep(1200);
			List<WebElement> listRegSuc = getDriver().findElements(ElementHome.REG_INTIMATION_DIALOG.get());
			if (listRegSuc.size() > 0 && listRegSuc.get(0).isDisplayed()) {
				registerDoneAuser = true;
				System.out.println("Registration Done for user with email:" + email + " & Phone:" + phoneNo);
				String intimationMessage = fwait
						.until(ExpectedConditions.visibilityOfElementLocated(ElementHome.INTIMATION_DIALOG.get()))
						.getText();

				if (intimationMessage != null) {
					System.out.println("Intimation message Shown-" + "'" + intimationMessage + "'");
					// after registration done updating the is_deleted to 1
					// super.connectDb("update users set is_deleted=1 where email=" + "'" + email +
					// "';", null, null);

					getDriver().navigate().refresh();

					break;
				}
			}
			Assert.assertTrue("Registration Not Done for user with email:" + email + " & Phone:" + phoneNo,
					registerDoneAuser);
		}
	}

	// On scenarios fail will take screen shot and store
	@After
	public void takeSnapShot(Scenario testcase) throws Exception {
		File DestFile = null;
		if (actualHeaderName.toLowerCase().contains("home") && ( orderType==null ||  !orderType.toLowerCase().contains("signup")))
			orderType = "oder type is not selected";

		for (int i = 0; i < 3; i++) {
			String testCase = testcase.getName().toUpperCase().replaceAll("/", ",");
			if (testcase.isFailed()) {
				System.out.println(
						"FAIL-" + " (" + orderType + ") " + testCase + "(screenshot added to FailedScreenShots)");
				// Convert web driver object to TakeScreenshot
				TakesScreenshot scrShot = ((TakesScreenshot) getDriver());
				// Call getScreenshotAs method to create image file
				File SrcFile = scrShot.getScreenshotAs(OutputType.FILE);
				// Move image file to new destination
				DestFile = new File(System.getProperty("user.dir")
						+ Joiner.on(File.separatorChar).join("", "src", "test", "FailedScreenShots", "") + testCase
						+ ".png");
				// Copy file at destination
				FileHandler.copy(SrcFile, DestFile);

				break;
			} else if (i == 2 && !testcase.isFailed()) {

				System.out.println(testcase.getStatus() + " - " + " (" + orderType.toUpperCase() + ") " + testCase);
				if (DestFile != null)
					System.out.println(DestFile);

				break;
			}

		}

	}

}
