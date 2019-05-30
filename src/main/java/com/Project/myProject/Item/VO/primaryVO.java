package com.Project.myProject.Item.VO;

import org.springframework.stereotype.Component;

@Component("primaryVO")
public class primaryVO {
//기본정보
private String itemAddr; //소재지 
private String itemBuild; //건물명 
private String itemWidth; //면적
private String itemLayer; //해당층
private String total_Layer; // 총 층수
private String itemParking; //주차가능대수
private String itemPay; //관리비
private String itemMoving; //입주가능일
//가격 정보
private String deposit; //보증금
private String ItemPrice;
private String ItemSelect;
private String Business; //취급 업소 (중개사무소 명)
private String explain; //설명
//사진 정보
private String LoadMap; //지도
public String getItemPrice() {
	return ItemPrice;
}
public void setItemPrice(String itemPrice) {
	ItemPrice = itemPrice;
}
public String getItemSelect() {
	return ItemSelect;
}
public void setItemSelect(String itemSelect) {
	ItemSelect = itemSelect;
}
public String getDeposit() {
	return deposit;
}
public void setDeposit(String deposit) {
	this.deposit = deposit;
}
public String getBusiness() {
	return Business;
}
public void setBusiness(String business) {
	Business = business;
}
public String getExplain() {
	return explain;
}
public void setExplain(String explain) {
	this.explain = explain;
}


public String getLoadMap() {
	return LoadMap;
}
public void setLoadMap(String loadMap) {
	LoadMap = loadMap;
}
public String getItemAddr() {
	return itemAddr;
}
public void setItemAddr(String itemAddr) {
	this.itemAddr = itemAddr;
}
public String getItemBuild() {
	return itemBuild;
}
public void setItemBuild(String itemBuild) {
	this.itemBuild = itemBuild;
}
public String getItemWidth() {
	return itemWidth;
}
public void setItemWidth(String itemWidth) {
	this.itemWidth = itemWidth;
}
public String getItemLayer() {
	return itemLayer;
}
public void setItemLayer(String itemLayer) {
	this.itemLayer = itemLayer;
}
public String getTotal_Layer() {
	return total_Layer;
}
public void setTotal_Layer(String total_Layer) {
	this.total_Layer = total_Layer;
}
public String getItemParking() {
	return itemParking;
}
public void setItemParking(String itemParking) {
	this.itemParking = itemParking;
}
public String getItemPay() {
	return itemPay;
}
public void setItemPay(String itemPay) {
	this.itemPay = itemPay;
}
public String getItemMoving() {
	return itemMoving;
}
public void setItemMoving(String itemMoving) {
	this.itemMoving = itemMoving;
}
public primaryVO(String itemAddr, String itemBuild, String itemWidth, String itemLayer, String total_Layer,
		String itemParking, String itemPay, String itemMoving, String deposit, String itemPrice, String itemSelect,
		String business, String explain, String loadMap) {
	this.itemAddr = itemAddr;
	this.itemBuild = itemBuild;
	this.itemWidth = itemWidth;
	this.itemLayer = itemLayer;
	this.total_Layer = total_Layer;
	this.itemParking = itemParking;
	this.itemPay = itemPay;
	this.itemMoving = itemMoving;
	this.deposit = deposit;
	ItemPrice = itemPrice;
	ItemSelect = itemSelect;
	Business = business;
	this.explain = explain;
	LoadMap = loadMap;
}
public primaryVO() {
}

}