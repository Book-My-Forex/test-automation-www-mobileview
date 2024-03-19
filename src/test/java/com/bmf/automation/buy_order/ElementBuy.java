package com.bmf.automation.buy_order;

import org.openqa.selenium.By;

public enum ElementBuy {
	HEADER_EXPANDED_SECTION(By.xpath("//span[@class='expand_heading']")),
	CUSTOMER_EXPANDED_SECTION(By.xpath("//span[@class='expand_heading ng-scope']")),
	TAWK_CHAT(By.xpath("//div[@class='tawk-text-truncate']")),
	THIS_FIELD_REQ(By.xpath("//span[@class='by_error_txt ng-binding']")),
	TCS_MANDATORY_FIELD(By.xpath("//span[@id='tcs_popup-error']")),
	SAVE_BTN_ORDER(By.xpath("//button[@class='editBtn green triggerUpdate']")),
	EXIST_CARD_MODAL(By.xpath("//div[@id='existingCardFound']//p[1]")),
	ORDER_AMOUNT_INPUT(By.xpath("//td[@data-title='Forex Amount']//input")),
	EXIST_CARD_DIALOG(By.xpath("//div[@id='existingCardFound']")),
	EXIST_CARD_BTN(By.xpath("//a[@class='btn btn-warning']")),

	ADDED_PRODUCTS(By.xpath("//td[@class='product_text']/span")),

	// order details
	DIALOG_COMMON(By.xpath("//div[@class='modal-dialog modal-md']")),
	ORDER_DTL_PRODUCT_SELECT(By.xpath("//select[@id='productCode']")),
	ORDER_DTL_FOREX_AMOUNT(By.xpath("//input[@NAME='foreign_amount']")),
	ORDER_DTL_CURRECY_TYPE(By.xpath("//select[@id='currencyCode']")),
	ORDER_DTL_ADD(By.xpath("//span[@class='by_add_product add_pro_btn']")),
	ORDER_DTL_MAX_PRODUCT_MODAL_CLOSE(By.xpath("//button[@ng-click='deleteStatus(false)']")),

	NON_FUNC_COUNTRIES(By.xpath("//input[contains (@id, 'non_functional_countries')]")),
	NON_FUNC_CONTRIES_TEXT(By.xpath("//div[@ng-if='showAcceptNonFunctionalCountriesCust']//span")),
	NON_FUNC_COUNTRIES_ELIGI_TEXT(By.xpath("//form[@id='eligibilityCheckForm']//div[@class='checkbox'][2]//span")),
	CUSTOMER_NAME(By.xpath("//input[@id='name']")), 
	PHONE_NUM(By.xpath("//input[@name='phone']")),
	PAN_REPLACE_DIALOG(By.xpath("//div[@id='pan_mismatch_popup']")),
	PAN_EDIT(By.xpath("//a[@class='panedit_class ng-scope']")), PAN_INPUT(By.xpath("//input[@name='pan']")),
	TRAVEL_COUNTRY(By.xpath("//select[@ng-model='customerDetail.countries']")),
	TRAVEL_START_INPUT(By.xpath("//input[@name='start_date']")), RETURN_DATE(By.xpath("//input[@id='end_date']")),
	PAN_NAME(By.xpath("//*[@id='pan_mismatch_popup']/div/div/div[2]/div/div[1]/span")),
	RATE_CARD_BUY_SELL(By.xpath("//span[contains(@class,'showrate')]//span")),
	M_RATE_CARD_BUY_SELL (By.xpath("//div[contains(@class,'showrate')]//span[2]")),
	VISA_NOT_REQ_CHECK(By.xpath("//span[@class='remember_txt confirm_txt visa-on-arrival-text']")),
	ELIGIBILTY_ICONFIRM_SELL(By.xpath("//span[@class='remember_txt confirm_txt']")),

	ELIGIBILITY_I_CONFIRM(By.xpath("//span[contains(@class,'eligibility-confirmation-text')]")),

	CONTINUE(By.xpath("//button//span[text()='Continue']")),
	REMIT_NOT_POSSIBLE(By.xpath("//div[@class='modal fade ng-scope in']")),

	CITY_SELECT(By.xpath("//select[@id='buysell-cityCode']")),
	MONTH_NEXT(By.xpath("//span[@class='ui-icon ui-icon-circle-triangle-e']")),
	MONTH_PREV(By.xpath("//span[@class='ui-icon ui-icon-circle-triangle-w']")),
	DATE_PICKER(By.xpath("//div[@id='ui-datepicker-div']")), DATES(By.xpath("//td[@data-handler='selectDay']")),
	TODAY_DATE(By.xpath("//td[contains(@class,'ui-datepicker-today')]")),
	REASON_TRAVEL(By.xpath("//select[@name='reason_for_travel']")),

	// Remit case
	REASON_TRANSFER(By.xpath("//input[@name='reason_for_transfer']")),
	BROKERAGE_PARTNER(By.xpath("//select[@id='approvedBroker']")),

	BUSINESS_NAME(By.xpath("//input[@id='business_name']")),
	BUSINESS_TYPE(By.xpath("//select[@name='business_type_code']")),
	BUY_SELL_BUTTON(By.xpath("//a[@id='buysellatag']")),
	ADD_PRODUCT(By.xpath("//div[@class='col-xs-4 col-md-4 col-sm-4 mob-text-center']//a[1]")),
	CMS_ADD_PRODUCT(By.xpath("//span[@class='add_product']")),
	M_ADD_PRODUCT (By.xpath("//a[@class='addProductBtn']")),
	ALL_DOC_UPLOADER(By.xpath("//div[@class='document__area--heading mobile_hide']//span")),	
	M_ALL_DOC_UPLOADER(By.xpath("//div[@class='document__area--heading desktop_hide']//h1//span")),
	LOADER(By.xpath("//div[@class='loading']/img")), CURRENCY_TYPE(By.xpath("//select[@id='buysell-currencyCode']")),


	PAYMENT_PRO_TIP (By.xpath("//div[@class='tcs_decle_widgets by_mt_20']/p")),
	ACTION_EDIT_BUTTON(By.xpath("//button[@class='editBtn triggerEdit']")),
	ORDER_EDIT_SUBMIT(By.xpath("//button[@type='submit']")),
	PRODUCT_TYPE(By.xpath("//select[@id='buysell-productCode']")),

	HEADER_NAME(By.xpath("//span[@class='collapse_heading']")),
	ORDER_SECTION_EDIT(By.xpath("//i[@class='sprite_img edit_icon mobile_edit_btn']")),
	ERROR_TRV_COUNTRY(By.xpath("//div[@id='countryMessage']")),

	// UPLOAD SECTION ORDER FLOW
	WARNING_DOC_DISCREPANCY(By.xpath("//a[@ng-click='showDocDiscrepancyModal();']")),
	DOCUMENT_DISC_DIALOGE(By.xpath("//div[@class='modal fade errorAlertModal ng-scope in']")),
	DOC_DISC_ERROR(By.xpath("//div[@class='alertHeading ng-binding']")),
	DOC_DISC_OK(By.xpath("//div[@class='alertErrorCta']/a")), DOC_UPLOAD_BTN(By.xpath("//span[@class='upload-btn']")),
	DOC_UPLOAD_INPUT(By.xpath("//input[@class='file-input file-msg']")),
	DOC_UPLOADED_VIEW_BTN(By.xpath("//div[@class='upload__group']/div/a")),
	DOC_DELETE_BTN(By.xpath("//a[@class='trashBtn']")), DOC_DOWNLOAD_BTN(By.xpath("//a[@class='downloadBtn']")),
	DOC_DELETE_CONFIRM(By.xpath("//button[text()='CONFIRM']")), UPLOAD_DIALOG(By.xpath("//div[@id='uploadDcument']")),
	DOC_LOADER_UPLOADER(By.xpath("//div[@class='uploader']/img")),
	DOC_LOADER_ANALYSER(By.xpath("//div[@id='analyzingDocuments']")),

	// address section Elements
	ADDRESS_SELECT_BTN(By.xpath("//a[@class='byseleBtn slectbtn']")),
	ADDRESS_SELECT_ALTER(By.xpath("//a[contains(@class,'selectbtn')]")),
	ADDRESS_STREET_NAME(By.xpath("//textarea[@name='customerDeliveryDetailStreetName']")),
	ADDRESS_LANDMARK(By.xpath("//input[@name='customerDeliveryDetailFormLandMark']")),
	ADDRESS_NEW_BTN(By.xpath("//span[@class='text-center by_mt_20']")),
	ADDRESS_CITY(By.xpath("//select[@id='customerDeliveryCityCode']")),
	ADDRESS_STATE(By.xpath("//select[@id='customerDeliveryDetailFormStateCode']")),
	ADDRESS_PIN_NO(By.xpath("//input[@name='customerDeliveryDetailFormPinCode']")),
	ADDRESS_PHONE_NO(By.xpath("//input[@id='customerDeliveryDetailPhone']")),

	FOREX_CURRENCY(By.xpath("//input[@id='buysell-foreignAmount']")),
	PURPOSE_SELECT(By.xpath("//select[@name='pusposeCode']")),
	MODAL_PAN_REPLACE(By.xpath("//div[@id='pan_mismatch_popup']//button[2]")),
	TOAST_MSG(By.xpath("//div[@class='toast-message']")),
	INVALID_KIT_MODAL(By.xpath("//div[@id='invalidKitNumber']//a")),
	INVALID_KIT_MSG(By.xpath("//div[@id='invalidKitNumber']//p")),
	PRODUCT_NAME(By.xpath("//td[@data-title='Product']")),
	// I_CONFIRM_PRESENT (By.xpath("//input[@id='confirmCheckBox']")),
	I_CONFIRM_PRESENT_TEXT(By.xpath("//div[@class='col-xs-12 checkbox ng-scope']//label")),

	// order summary charges keys /values
	SERVICE_CHARGE(By.xpath("//p[@class='bank_fee by_mt_20 deletetcs ng-scope']//span[@class='right_sp ng-binding']")),
	OSUMARY_KEY(By.xpath("//p[@class='bank_fee by_mt_20']//span[contains(@class,'left_sp')]")),
	OSUMARY_VALUE(By.xpath("//p[@class='bank_fee by_mt_20']//span[contains(@class,'right_sp')]")),
	OSUMARY_KEY_ADDONS(
			By.xpath("//p[@class='bank_fee by_mt_20 deletetcs ng-scope']//span[contains(@class,'left_sp')]")),
	OSUMARY_VALUE_ADONS(
			By.xpath("//p[@class='bank_fee by_mt_20 deletetcs ng-scope']//span[contains(@class,'right_sp')]")),
	TOTAL_AMNT(By.xpath("//div[@class='order_summary']//span[2]")),
	GRAND_TOTAL_AMNT(By.xpath("//p[@class='bank_fee by_mt_20 tot_txt']/span[2]")),
	NET_PAYABLE(By.xpath("//span[@class='payment_txt']//span[2]")),

	INPUT_CANCELLATION_POLICY(By.xpath("//input[@id='razor_accept']")),
	CANCELATION_POLICY(By.xpath("//span[contains(@class,'remember_txt mrl_10')]")),
	
	//CANCELATION_POLICY_LINK(By.xpath("//a[text()='cancellation policy']")),
	TIMER_CLOSE(By.xpath("//a[@class='orderflowcloseBtnTimer']")),
	NET_BANKING(By.xpath("//div//i[@class='net_bookmyforex_icon']")),
	OFFLINE_CLICK(By.xpath("//div[contains(@class,'otherPayModesDiv')]/div")),
	OFFLINE_PAY_NOW(By.xpath("//button[@ng-click='processAdvancePayment();']")),
	LOCK_IN_RATE_OPTIONAL(By.xpath("//span[@class='yespdleft']")),
	OFFLINE_PAYMODES(By.xpath("//div[contains(@class, 'col-xs-12 col-sm-6 col-md-4 col-lg-4 ng-scope')]")),
	ALL_PAY_MODES(By.xpath("//div[@class='col-xs-12 col-md-3 col-sm-3 by_mt_20 payboxwidth ng-scope']//span")),
	RELATION_PAYEE(By.xpath("//select[@name='idRelation']")), BANK_CARD_TYPE(By.xpath("//select[@id='cardType']")),
	UPI_INPUT(By.xpath("//input[@id='upi_id']")), UPI_ACCOUNT(By.xpath("//input[@id='upi_account_no']")),
	UPI_IFSC(By.xpath("//input[@id='upi_ifsc_code']")), UPI_ERROR(By.xpath("//p[@id='upiLimitErrorText']")),
	UPI_LIMIT_EXCEED(By.xpath("//button[@class='btn btn-warning continuepopupbtn_']")),
	TAT_INFO(By.xpath("//Span[@id='tatInfoText']")), VERIFY_UPI(By.xpath("//a[@class='verify_upi']")),
	ACCOUNT_NUMBER(By.xpath("//input[@name='account_number']")), IFSC_CODE(By.xpath("//input[@name='ifsc_code']")),
	SPECIAL_INSTRUCTION(By.xpath("//textarea[@name='customer_additional_comment']")),

	PAYEMENT_CONV_CHARGE(By.xpath("//div[@class='yellow_alert by_mt_30']")),
	R_U_INDIAN_RES_YES(By.xpath("//div[@id='parent']//span")),
	R_U_INDIAN_RES_NO(By.xpath("//label[@class='radio-label radiono']/span")),
	STUDENT_INDIAN(By.xpath("//label[@for='education_resident-radio-1']//span")),
	OVERSEAS_INDIA(By.xpath("//label[@for='overseasIndianCitizen-radio-3']")),
	TOTAL_ARE_YOU(By.xpath("//p[@class='are_txt']")),
	I_CONFIRM_CARD_BUY(By.xpath("//span[@class='remember_txt mrl_10']")),
	I_DCLARATION_INPUT(By.xpath("//input[@id='razor_accept']")),
	I_DECLARATION(By.xpath("//span[@class='remember_txt mrl_10 ng-binding ng-scope']")),
	UPI_ALERT_1LAC(By.xpath("//form[@id='upiBankingForm']/div[2]/div[1]/div/p")),
	PAY_CONFIRM(By.xpath("//span[text()='Pay and Confirm Order']")),
	NAME_MISMATCH_DIALOG(By.xpath("//div[@id='bank_account_name_mismatch_popup']")),
	NAME_MISMATCH_PAY(By.xpath("//*[@id='bank_account_name_mismatch_popup']//button")),
	BANK_NAME_MISMATCH_TEXT(By.xpath("//div[@id='bank_account_name_mismatch_popup']//p")),
	REVIEW_ORDER_DETAILS(By.xpath("//span[@class='defualt_color ng-binding']")),
	REVIEW_ORDER_SUMMARY(By.xpath("//div[@class='order_summary']")),

	// sim add ons
	SIM_INFO (By.xpath("//div[@class='alert alert-primary']")),
	SIM_ORD_REF (By.xpath("//div[@class='row row-flex']//p//span")),
	SIM_PAY_NOW (By.xpath("//a[@id='payment_button']")),
	SIM_ADD_SELECT (By.xpath("//a[contains (@class,'add_selectbtn')]")),
	SIM_BUY_COUNTINUE (By.xpath("//span[text()='Continue']")),
	SIM_TRAVEL(By.xpath("//input[@id='simplan-travel_date']")),
	SIM_PAY_MODE (By.xpath("//select[@id='payment_mode']")),
	SIM_SUB_PAY_MODE (By.xpath("//select[@id='sub_payment_mode']")),
	SIM_TO_COUNTRY(By.xpath("//select[@id='simplan-toCountry']")),	
	SIM_RETURN (By.xpath("//input[@id='simplan-return_date']")),
	SIM_SHOW_PLANS(By.xpath("//a[@id='simshowplantag']")),
	SIM_ADD_FREE(By.xpath("//div[@class='InternationalFreesimbox tripesscomm']//a[1]")),
	SIM_ADD_ON(By.xpath("//div[@class='Internationalsimbox tripesscomm']//a[@class='addtoorder']")),
	SIM_BUY_DIALOG(By.xpath("//div[@id='myModal']")),
	SIM_BUY_BTNS(By.xpath("//div[@class='sim_plan_column column-6']//button[1]")),
	SIM_CONTINUE_BTN(By.xpath("//button[@class='confirm_box confirm_po03 pull-right']/span")),
	OFFLINE_SIM_REMOVE_MODAL(By.xpath("//div[@class='modal fade ng-scope in']")),
	REMOVE_CONFIRM_BTN(By.xpath("//div[@class='modal fade ng-scope in']//button[text()='CONFIRM']")),
	SIM_ADDRESS_SELECT(By.xpath("//a[text()='Select']")),
	SIM_ADDRESS_SELECT_TABLE(By.xpath("//a[contains(@class,'add_selectbtn')]")),
	// TCS modal Elements
	NEW_TCS_DIALOG(By.xpath("//div[@id='newtaxCollectedatSourceApplied']")),
	OLD_TCS_DIALOG(By.xpath("//div[@id='taxCollectedatSourceApplied']")),
	THREE_TCS_DIALOG(By.xpath("//div[@id='tcsdeclearModal']")),
	THREE_TCS_CALCULATED(By.xpath("//div[@id='newv3taxCollectedatSourceApplied']")),
	TCS_MODAL(By.xpath("//h4[text()='Tax Collected At Source (TCS):']")),
	TCS_CLOSE(By.xpath("//a[@ng-click='closeTcsAppliedModal()']")), TCS_VIEW_TRN(By.xpath("//a[@id='showBtn']")),
	TCS_TOTAL_AMOUNT(By.xpath("//*[@id='taxCollectedatSourceApplied']/div/div/div[2]/table/tbody/tr[1]/td[2]")),
	TCS_PERCENTAGE(By.xpath("//*[@id='taxCollectedatSourceApplied']/div/div/div[2]/table/tbody/tr[2]/td[2]")),
	TCS_APPLIED(By.xpath("//*[@id='taxCollectedatSourceApplied']/div/div/div[2]/table/tbody/tr[3]/td[2]")),
	TCS_PREV_TRN(By.xpath("//*[@id='lastTransactions']/table/tbody/tr/td")),
	NEW_TCS_DETAILS(By.xpath("//div[@id='newtaxCollectedatSourceApplied']//td[2]")),
	TCS_THREE_YES(By.xpath("//label[@for='indian_resident-radio-1']")),
	TCS_THREE_NO(By.xpath("//label[@for='indian_resident-radio-2']")),
	TCS_CALU_PENDING(By.xpath("//div[@id='tcsCalculationPending']//a")),
	TCS_THREE_INPUT(By.xpath("//input[@id='taxableAmount']")),
	CAL_APPLY_TCS(By.xpath("//button[@ng-click='applyTCS()']")),
	TCS_2YRS_NOTFILLED_INPUT(By.xpath("//input[@id='is_specified_person']")),
	TCS_2YRS_CHECK(By.xpath("//span[@class='remember_txt']")),
	IS_EDUCATION_INPUT(By.xpath("//input[@id='is_edu_loan_availed']")),
	IS_EDUCATION_TEXT(By.xpath(
			"//div[@ng-if='tcsDetails.showEducationLoanFlag != undefined && tcsDetails.showEducationLoanFlag']//label")),
	FILE_UPLOAD_EDU(By.xpath("//input[@class='file-input file-msg']")),
	UPLOADER_ICON(By.xpath("//div[@class='uploader']")),
	TCS_THREE_PER(By.xpath("//div[@id='newv3taxCollectedatSourceApplied']//div[4]//span[2]")),
	TCS_THREE_TCS_APP(By.xpath("//div[@id='newv3taxCollectedatSourceApplied']//div[3]//span[2]")),
	TCS_THREE_CLOSE(By.xpath("//button[@ng-click='closeTcsAppliedModal()']")),
	TCS_THREE_APPLIED(By.xpath("//div[@id='newv3taxCollectedatSourceApplied']//div[5]//span[2]")),

	// razorpay Elements
	I_FRAME(By.xpath("//iframe[@class='razorpay-checkout-frame']")),
	RZR_OFFLINE_MODES(By.xpath("//div[@class='stack svelte-by96ls horizontal']")), // not
																													// in
																													// use
	RZR_BMF_LOGO(By.xpath("//div[@id='logo']")), RZR_WARNING_FAILURE(By.xpath("//button[ contains(@class,'cta-btn')]")),

	UPI_QR(By.xpath("//button[contains(@class,'new-method')]")), SHOW_QR_CODE(By.xpath("//div[@id='showQr']")),
	RZR_SPINER_LOADER(By.xpath("//div[@class='loader-container svelte-1cydu85']")),
	NEW_PAY_BTN(By.xpath("//button[@id='redesign-v15-cta']")),
	// RZR_CARD_SELECT (By.xpath("//button//div[text()='Card']")),
	CARD_NO(By.xpath("//input[@name='card[number]']")), CARD_EXPIRY(By.xpath("//input[@name='card[expiry]']")),
	CARD_CVV(By.xpath("//input[@name='card[cvv]']")), INPUT_SAVE(By.xpath("//input[@id='save']")),
	PAY_WITH_OUT_SAVE(By.xpath("//button[contains(@class,'later-button')]")),
	CARD_SAVE(By.xpath("//span[contains(@class,'saved-card-text')]")),
	RZR_ALLPAYMODE_SELECT(By.xpath("//button[@role='listitem']//div[@slot='title']")),
	RZR_NETBANK(By.xpath("//div[@id='netb-banks']//label")),
	RZR_SUCESS(By.xpath("//button[@class='success']")),
	DEBIT_CREDIT_CARD_OTP(By.xpath("//input[@placeholder='OTP']")),
	OTP_SUBMIT(By.xpath("//button[@id='submit-action']")),
	REVIEW_BUTTON(By.xpath("//button[@id='review-order-btn']//span")),
	ORD_REF(By.xpath("//span[@class='fs-25 ng-binding']")),
	THANK_YOU_BMF(By.xpath("//*[@class='yourBookingtext ng-scope']")),
	THANK_YOU_AGENT(By.xpath("//*[@class='order_confir']//p"));
	

	private By by;

	ElementBuy(By by) {
		this.by = by;
	}

	public By get() {
		return by;
	}
}
