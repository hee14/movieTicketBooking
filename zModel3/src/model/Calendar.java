package model;

import java.io.Serializable;

import java.sql.Timestamp;

@SuppressWarnings("serial")
public class Calendar implements Serializable{
	
	//1. cal_num 2. mem_id(fk) 3. cal_title 4. cal_start 5. cal_end 
	private int cal_num;
	private String mem_id;
	private String cal_title;
	private Timestamp cal_start;
	private Timestamp cal_end;
	private Timestamp cal_create;
	
	public int getCal_num() {
		return cal_num;
	}
	public void setCal_num(int cal_num) {
		this.cal_num = cal_num;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getCal_title() {
		return cal_title;
	}
	public void setCal_title(String cal_title) {
		this.cal_title = cal_title;
	}
	public Timestamp getCal_start() {
		return cal_start;
	}
	public void setCal_start(Timestamp cal_start) {
		this.cal_start = cal_start;
	}
	public Timestamp getCal_end() {
		return cal_end;
	}
	public void setCal_end(Timestamp cal_end) {
		this.cal_end = cal_end;
	}
	public Timestamp getCal_create() {
		return cal_create;
	}
	public void setCal_create(Timestamp cal_create) {
		this.cal_create = cal_create;
	}
	
	
	@Override
	public String toString() {
		return "Calendar [cal_num=" + cal_num + ", mem_id=" + mem_id + ", cal_title=" + cal_title + ", cal_start="
				+ cal_start + ", cal_end=" + cal_end + ", cal_create=" + cal_create + "]";
	}
	
	
	
	
	
	
}
