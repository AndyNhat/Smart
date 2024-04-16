package model;

public class SanPham {
	private String maSanPham;
	private String tenSanPham;
	private String XuatXu;
	private int namSanXuat;
	private double giaGoc;
	private double giaBan;
	private int soLuong;
	private TheLoai theLoai;
	private String moTa;
	private String image;
	
	public SanPham() {
	}

	

	public SanPham(String maSanPham, String tenSanPham, String xuatXu, int namSanXuat, double giaGoc, double giaBan,
			int soLuong, TheLoai theLoai, String moTa, String image) {
		super();
		this.maSanPham = maSanPham;
		this.tenSanPham = tenSanPham;
		XuatXu = xuatXu;
		this.namSanXuat = namSanXuat;
		this.giaGoc = giaGoc;
		this.giaBan = giaBan;
		this.soLuong = soLuong;
		this.theLoai = theLoai;
		this.moTa = moTa;
		this.image = image;
	}



	public String getMaSanPham() {
		return maSanPham;
	}

	public void setMaSanPham(String maSanPham) {
		this.maSanPham = maSanPham;
	}

	public String getTenSanPham() {
		return tenSanPham;
	}

	public void setTenSanPham(String tenSanPham) {
		this.tenSanPham = tenSanPham;
	}

	public String getXuatXu() {
		return XuatXu;
	}

	public void setXuatXu(String xuatXu) {
		XuatXu = xuatXu;
	}

	public int getNamSanXuat() {
		return namSanXuat;
	}

	public void setNamSanXuat(int namSanXuat) {
		this.namSanXuat = namSanXuat;
	}

	public double getGiaGoc() {
		return giaGoc;
	}

	public void setGiaGoc(double giaGoc) {
		this.giaGoc = giaGoc;
	}

	public double getGiaBan() {
		return giaBan;
	}

	public void setGiaBan(double giaBan) {
		this.giaBan = giaBan;
	}

	public int getSoLuong() {
		return soLuong;
	}

	public void setSoLuong(int soLuong) {
		this.soLuong = soLuong;
	}

	public TheLoai getTheLoai() {
		return theLoai;
	}

	public void setTheLoai(TheLoai theLoai) {
		this.theLoai = theLoai;
	}

	public String getMoTa() {
		return moTa;
	}

	public void setMoTa(String moTa) {
		this.moTa = moTa;
	}
	

	public String getImage() {
		return image;
	}



	public void setImage(String image) {
		this.image = image;
	}



	@Override
	public String toString() {
		return "SanPham [maSanPham=" + maSanPham + ", tenSanPham=" + tenSanPham + ", XuatXu=" + XuatXu + ", namSanXuat="
				+ namSanXuat + ", giaGoc=" + giaGoc + ", giaBan=" + giaBan + ", soLuong=" + soLuong + ", theLoai="
				+ theLoai + ", moTa=" + moTa + ", image=" + image + "]";
	}



	
	
	
}
