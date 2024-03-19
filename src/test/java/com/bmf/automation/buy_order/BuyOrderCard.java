package com.bmf.automation.buy_order;

import java.util.List;

import org.junit.Assert;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.ui.ExpectedConditions;


import com.bmf.automation_commons.BmfTestCommon;

import io.cucumber.java.en.Then;

public class BuyOrderCard extends BmfTestCommon {

	@Then("^Existing Card modal should open and redirected to home$")
	public void existingCardModal() throws Throwable {

		fwait.until(ExpectedConditions.invisibilityOfElementLocated(ElementBuy.LOADER.get()));

		boolean existCardModalDisplayed = false;
		for (int i = 0; i < 3; i++) {
			Thread.sleep(3000);
			List<WebElement> listExistingCardModal = getDriver().findElements(ElementBuy.EXIST_CARD_DIALOG.get());
			if (listExistingCardModal.size() > 0) {
				WebElement existCard = listExistingCardModal.get(0);
				if (existCard.isDisplayed()) {
					String modaltext = existCard.getText();
					fwait.until(ExpectedConditions.elementToBeClickable(ElementBuy.EXIST_CARD_MODAL.get()));
					getDriver().findElement(ElementBuy.EXIST_CARD_BTN.get()).click();
					System.out.println("Existing Card Modal opened with message-" + "'" + modaltext + "'" + "(PASS)");
					System.out.println("Redirected to Home-" + "'" + getDriver().getCurrentUrl() + "'");
					existCardModalDisplayed = true;
					break;
				}
			}
		}
		Assert.assertEquals("No any card mapped to user from BMF/ modal Not Displayed", true, existCardModalDisplayed);
	}
}
