package com.bmf.automation_commons;

import com.bmf.automation.runner.TestRunner;
import com.google.common.base.Joiner;


import org.apache.commons.lang3.SystemUtils;
import org.openqa.selenium.edge.EdgeDriver;

import org.openqa.selenium.UnexpectedAlertBehaviour;
import org.openqa.selenium.WebDriver;

import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;

import org.openqa.selenium.edge.EdgeOptions;
import org.openqa.selenium.remote.CapabilityType;
import org.openqa.selenium.remote.DesiredCapabilities;

import java.io.File;
import java.util.HashMap;
import java.util.Map;

public class WebDriverManager {

	private static WebDriver webDriver = null;

	public synchronized static WebDriver getWebDriver() {
		if (webDriver != null)
			return webDriver;

		final DesiredCapabilities capabilities = new DesiredCapabilities(TestRunner.browser.toLowerCase(), null, null);
		capabilities.setCapability(CapabilityType.UNHANDLED_PROMPT_BEHAVIOUR, UnexpectedAlertBehaviour.ACCEPT);

		if (TestRunner.browser.equalsIgnoreCase("edge")) {

			if (SystemUtils.IS_OS_WINDOWS)
				System.setProperty("webdriver.edge.driver", System.getProperty("user.dir") + Joiner
						.on(File.separatorChar).join("", "src", "test", "WebDrivers", "edge", "msedgedriver.exe"));
			else if (SystemUtils.IS_OS_LINUX)
				System.setProperty("webdriver.edge.driver", System.getProperty("user.dir")
						+ Joiner.on(File.separatorChar).join("", "src", "test", "WebDrivers", "edge", "msedgedriver"));

			EdgeOptions eoption = new EdgeOptions();
			// Using the accept insecure certificate method with true as parameter to accept
			// the
			// untrusted certificate

			if (SystemUtils.IS_OS_WINDOWS)
				eoption.addArguments("--headless");
			// this is required to switch new window in case of razorpay modal
			eoption.addArguments("--window-size=1920,1080");
			eoption.setAcceptInsecureCerts(false);
			eoption.merge(capabilities);

			webDriver = new EdgeDriver(eoption);
		} else if (TestRunner.browser.equalsIgnoreCase("chrome")) {
			if (SystemUtils.IS_OS_WINDOWS)
				System.setProperty("webdriver.chrome.driver", System.getProperty("user.dir") + Joiner
						.on(File.separatorChar).join("", "src", "test", "WebDrivers", "chrome", "chromedriver.exe"));
			else if (SystemUtils.IS_OS_LINUX)
				System.setProperty("webdriver.chrome.driver", "/usr/bin/chromedriver");

			ChromeOptions cOption = new ChromeOptions();
			// Using the accept insecure certificate method with true as parameter to accept
			// the
			// untrusted certificate

			if (SystemUtils.IS_OS_LINUX) {
			    cOption.addArguments("--headless");
			    cOption.addArguments("--disable-dev-shm-usage"); //!!!should be enabled for Jenkins
			    cOption.addArguments("--no-sandbox");
			// this above required to switch new window in case of razorpay modal
			}
			if (TestRunner.isMobileMode ) {

				Map<String, Object> mobileEmulation = new HashMap<>();
				mobileEmulation.put("deviceName", "iPhone X");
				cOption.setExperimentalOption("mobileEmulation", mobileEmulation);

			} else {
				cOption.addArguments("--window-size=1920,1080");
			}
			cOption.setAcceptInsecureCerts(false);
			cOption.merge(capabilities);

			webDriver = new ChromeDriver(cOption);

		}

		System.err.println("The " + TestRunner.browser.toUpperCase() + " browser is Started !!");
		webDriver.manage().window().maximize();

		if (TestRunner.tcsOne)
			System.out.println("Tcs one will check,check if version enable on the Environment ' "
					+ TestRunner.env.toUpperCase() + " ' !!");
		if (TestRunner.tcsTwo)
			System.out.println("Tcs two will check,check if version enable on the Environment ' "
					+ TestRunner.env.toUpperCase() + " ' !!");
		if (TestRunner.tcsThree)
			System.out.println("Tcs three will check,check if version enable on the Environment ' "
					+ TestRunner.env.toUpperCase() + " ' !!");

		System.out.println("Is LINUX Environment: " + SystemUtils.IS_OS_LINUX);
		System.out.println("Is Windows Environment: " + SystemUtils.IS_OS_WINDOWS);
		System.out.println("WebDriver Property: "
				+ System.getProperty("webdriver." + TestRunner.browser.toLowerCase() + ".driver"));
		System.out.println("Driver File Exists: "
				+ new java.io.File(System.getProperty("webdriver." + TestRunner.browser.toLowerCase() + ".driver"))
						.exists());
		return webDriver;
	}

}
