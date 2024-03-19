package com.bmf.automation.sell;

import java.util.List;

import org.junit.Assert;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.ui.ExpectedConditions;

import com.bmf.automation.buy_order.ElementBuy;

import com.bmf.automation_commons.BmfTestCommon;

import io.cucumber.java.en.And;
import io.cucumber.java.en.Then;

public class SellOrder extends BmfTestCommon {

	@Then("^CDF modal verify and proceed to order create$")
	public void cdfModal() throws Throwable {

		boolean cdfModalDisplayed = false;
		fwait.until(ExpectedConditions.invisibilityOfElementLocated(ElementBuy.LOADER.get()));

		try {
			fwait.until(ExpectedConditions.invisibilityOfElementLocated(ElementBuy.LOADER.get()));
			Thread.sleep(1200);
			WebElement orderContniue = fwait
					.until(ExpectedConditions.elementToBeClickable(ElementBuy.ORDER_EDIT_SUBMIT.get()));

			super.scrolToElement(orderContniue);
			orderContniue.click();

			for (int i = 0; i < 3; i++) {
				Thread.sleep(500);
				List<WebElement> listcdfModal = getDriver().findElements(ElementSell.CDF_DIALOG.get());
				if (listcdfModal.size() > 0 && listcdfModal.get(0).isDisplayed()) {
					cdfModalDisplayed = true;
					WebElement cdfModal = fwait
							.until(ExpectedConditions.visibilityOfElementLocated(ElementSell.MODAL_TEXT.get()));
					fwait.until(ExpectedConditions.elementToBeClickable(ElementSell.HAVE_CDF_MODAL.get())).click();
					System.out.println(
							"====================================================================================================================================");
					System.out.println("CDF Modal Displayed-" + "'" + cdfModal.getText().toUpperCase() + "'");
					System.out.println(
							"====================================================================================================================================");
					break;
				}
			}

		} catch (Exception e) {
			System.err.println("CDF modal not displayed.");

		}

		Assert.assertTrue("5000 selling cdf modal not displayed", cdfModalDisplayed);
	}

	@And("^Customer Detials Name Edited to '(.*)' and contnue$")
	public void custDeatilsSkip(String name) throws Throwable {
		custName = null;
		actualCustomerName = null;
		for (int i = 0; i <= 3; i++) {
			landedForexScreen(5);
			if (actualHeaderName.contains("customer")) {
				try {
					Thread.sleep(500);
					fwait.until(ExpectedConditions.invisibilityOfElementLocated(ElementBuy.LOADER.get()));
					custName = fwait.until(ExpectedConditions.elementToBeClickable(ElementBuy.CUSTOMER_NAME.get()));
					actualCustomerName = custName.getAttribute("value");
					System.out.println("Customer Name In Order besides Pan name-" + "'" + actualCustomerName + "'");
					custName.clear();
					custName.sendKeys(name);
					// is checking valid phone
					super.isValidPhone();
					fwait.until(ExpectedConditions.elementToBeClickable(ElementSell.CUST_CONTINUE.get())).click();
					break;
				} catch (Exception e) {

					System.err.println("Not able to edit name due to-" + e.getMessage());

				}
			} else {
				super.switchToSection("customer");
			}
		}
	}

}
