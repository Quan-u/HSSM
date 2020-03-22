package com.quanyou.po;
public class OrderItem {
	private Orders order;
	private Shop p;
	private int buynum;
	private String order_id;
    private String product_id;
	public Orders getOrder() {
		return order;
	}
	public void setOrder(Orders order) {
		this.order = order;
	}
	public Shop getP() {
		return p;
	}
	public void setP(Shop p) {
		this.p = p;
	}
	public int getBuynum() {
		return buynum;
	}
	public void setBuynum(int buynum) {
		this.buynum = buynum;
	}
	public String getOrder_id() {
		return order_id;
	}
	public void setOrder_id(String order_id) {
		this.order_id = order_id;
	}
	public String getProduct_id() {
		return product_id;
	}
	public void setProduct_id(String product_id) {
		this.product_id = product_id;
	}
    
}
