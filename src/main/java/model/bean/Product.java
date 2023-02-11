package model.bean;

public class Product {
	private int id;
	private String name;
	private int type;
	private String desciption;
	private String image;
	private int price;
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getQuanlity() {
		return quanlity;
	}
	public void setQuanlity(int quanlity) {
		this.quanlity = quanlity;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	private int quanlity;
	private String category;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public String getDesciption() {
		return desciption;
	}
	public void setDesciption(String desciption) {
		this.desciption = desciption;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	
	public Product(int id, String name, int type, String des, String image, int price, int quan, String cate) {
		this.id=id;
		this.name=name;
		this.type=type;
		this.desciption=des;
		this.image=image;
		this.price=price;
		this.quanlity=quan;
		this.category=cate;
	}
	public Product() {
		// TODO Auto-generated constructor stub
	}
	

}
