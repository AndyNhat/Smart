package model;

import java.sql.Date;

public class KhachHang {
	
	private String maKhachHang;
	private String tenDangNhap;
	private String matKhau;
	private String hoVaTen;
	private String gioiTinh;
	private Date ngaySinh;
	private String diaChi;
	private String soDienThoai;
	private String email;
	private String maXacThuc;
	private Date thoiGianHieuLucCuaMaXacThuc;
	private boolean trangThaiXacThuc;
	private String duongDanAnh;
	
	public KhachHang() {	
	}
	
	public KhachHang(String maKhachHang, String tenDangNhap, String matKhau, String hoVaTen, String gioiTinh,
			Date ngaySinh, String diaChi, String soDienThoai, String email, String maXacThuc,
			Date thoiGianHieuLucCuaMaXacThuc, boolean trangThaiXacThuc, String duongDanAnh) {
		super();
		this.maKhachHang = maKhachHang;
		this.tenDangNhap = tenDangNhap;
		this.matKhau = matKhau;
		this.hoVaTen = hoVaTen;
		this.gioiTinh = gioiTinh;
		this.ngaySinh = ngaySinh;
		this.diaChi = diaChi;
		this.soDienThoai = soDienThoai;
		this.email = email;
		this.maXacThuc = maXacThuc;
		this.thoiGianHieuLucCuaMaXacThuc = thoiGianHieuLucCuaMaXacThuc;
		this.trangThaiXacThuc = trangThaiXacThuc;
		this.duongDanAnh = duongDanAnh;
	}

	public KhachHang(String maKhachHang, String tenDangNhap, String matKhau, String hoVaTen, String gioiTinh,
			Date ngaySinh, String diaChi, String soDienThoai, String email) {
		this.maKhachHang = maKhachHang;
		this.tenDangNhap = tenDangNhap;
		this.matKhau = matKhau;
		this.hoVaTen = hoVaTen;
		this.gioiTinh = gioiTinh;
		this.ngaySinh = ngaySinh;
		this.diaChi = diaChi;
		this.soDienThoai = soDienThoai;
		this.email = email;
	}
	
	public KhachHang(String maKhachHang, String tenDangNhap, String matKhau, String hoVaTen, String gioiTinh,
			Date ngaySinh, String diaChi, String soDienThoai, String email, String maXacThuc,
			Date thoiGianHieuLucCuaMaXacThuc, boolean trangThaiXacThuc) {
		super();
		this.maKhachHang = maKhachHang;
		this.tenDangNhap = tenDangNhap;
		this.matKhau = matKhau;
		this.hoVaTen = hoVaTen;
		this.gioiTinh = gioiTinh;
		this.ngaySinh = ngaySinh;
		this.diaChi = diaChi;
		this.soDienThoai = soDienThoai;
		this.email = email;
		this.maXacThuc = maXacThuc;
		this.thoiGianHieuLucCuaMaXacThuc = thoiGianHieuLucCuaMaXacThuc;
		this.trangThaiXacThuc = trangThaiXacThuc;
	}

	public String getMaKhachHang() {
		return maKhachHang;
	}

	public void setMaKhachHang(String maKhachHang) {
		this.maKhachHang = maKhachHang;
	}

	public String getTenDangNhap() {
		return tenDangNhap;
	}

	public void setTenDangNhap(String tenDangNhap) {
		this.tenDangNhap = tenDangNhap;
	}

	public String getMatKhau() {
		return matKhau;
	}

	public void setMatKhau(String matKhau) {
		this.matKhau = matKhau;
	}

	public String getHoVaTen() {
		return hoVaTen;
	}

	public void setHoVaTen(String hoVaTen) {
		this.hoVaTen = hoVaTen;
	}

	public String getGioiTinh() {
		return gioiTinh;
	}

	public void setGioiTinh(String gioiTinh) {
		this.gioiTinh = gioiTinh;
	}

	public Date getNgaySinh() {
		return ngaySinh;
	}

	public void setNgaySinh(Date ngaySinh) {
		this.ngaySinh = ngaySinh;
	}

	public String getDiaChi() {
		return diaChi;
	}

	public void setDiaChi(String diaChi) {
		this.diaChi = diaChi;
	}

	public String getSoDienThoai() {
		return soDienThoai;
	}

	public void setSoDienThoai(String soDienThoai) {
		this.soDienThoai = soDienThoai;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	

	public String getMaXacThuc() {
		return maXacThuc;
	}

	public void setMaXacThuc(String maXacThuc) {
		this.maXacThuc = maXacThuc;
	}

	public Date getThoiGianHieuLucCuaMaXacThuc() {
		return thoiGianHieuLucCuaMaXacThuc;
	}

	public void setThoiGianHieuLucCuaMaXacThuc(Date thoiGianHieuLucCuaMaXacThuc) {
		this.thoiGianHieuLucCuaMaXacThuc = thoiGianHieuLucCuaMaXacThuc;
	}

	public boolean isTrangThaiXacThuc() {
		return trangThaiXacThuc;
	}

	public void setTrangThaiXacThuc(boolean trangThaiXacThuc) {
		this.trangThaiXacThuc = trangThaiXacThuc;
	}
		
	
	
	public String getDuongDanAnh() {
		return duongDanAnh;
	}

	public void setDuongDanAnh(String duongDanAnh) {
		this.duongDanAnh = duongDanAnh;
	}

	@Override
	public String toString() {
		return "KhachHang [maKhachHang=" + maKhachHang + ", tenDangNhap=" + tenDangNhap + ", matKhau=" + matKhau
				+ ", hoVaTen=" + hoVaTen + ", gioiTinh=" + gioiTinh + ", ngaySinh=" + ngaySinh + ", diaChi=" + diaChi
				+ ", soDienThoai=" + soDienThoai + ", email=" + email + ", maXacThuc=" + maXacThuc
				+ ", thoiGianHieuLucCuaMaXacThuc=" + thoiGianHieuLucCuaMaXacThuc + ", trangThaiXacThuc="
				+ trangThaiXacThuc + ", duongDanAnh=" + duongDanAnh + "]";
	}

	

	

	

	
		
}
