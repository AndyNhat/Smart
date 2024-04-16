package database;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import controller.KhachHangController;
import model.KhachHang;

public class KhachHangDAO implements DAOInterface<KhachHang> {

	public ArrayList<KhachHang> data = new ArrayList<>();

	@Override
	public ArrayList<KhachHang> selectAll() {
		ArrayList<KhachHang> ketQua = new ArrayList<KhachHang>();
		try {
			// Bước 1: tạo kết nối đến CSDL
			Connection con = JDBCUtil.getConnection();

			// Bước 2: tạo ra đối tượng statement
			String sql = "SELECT * FROM khachhang";
			PreparedStatement st = con.prepareStatement(sql);

			// Bước 3: thực thi câu lệnh SQL
			System.out.println(sql);
			ResultSet rs = st.executeQuery();

			// Bước 4:
			while (rs.next()) {
				String maKhacHang = rs.getString("makhachhang");
				String tenDangNhap = rs.getString("tendangnhap");
				String matKhau = rs.getString("matkhau");
				String hoVaTen = rs.getString("hovaten");
				String gioiTinh = rs.getString("gioitinh");
				String diaChi = rs.getString("diachi");
				Date ngaySinh = rs.getDate("ngaysinh");
				String soDienThoai = rs.getString("sodienthoai");
				String email = rs.getString("email");
				String maXacThuc = rs.getString("maxacthuc");
				Date thoiGianHieuLucCuaMaXacThuc = rs.getDate("thoigianhieuluccuamaxacthuc");
				boolean trangThaiXacThuc = rs.getBoolean("trangthaixacthuc");
				String duongDananh = rs.getString("duongdananh");

				KhachHang kh = new KhachHang(maKhacHang, tenDangNhap, matKhau, hoVaTen, gioiTinh, ngaySinh, diaChi,
						soDienThoai, email, maXacThuc, thoiGianHieuLucCuaMaXacThuc, trangThaiXacThuc,duongDananh);
				ketQua.add(kh);
			}

			// Bước 5:
			JDBCUtil.closeConnection(con);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return ketQua;
	}

	@Override
	public KhachHang selectById(KhachHang t) {
		KhachHang ketQua = null;
		try {
			// Bước 1: tạo kết nối đến CSDL
			Connection con = JDBCUtil.getConnection();

			// Bước 2: tạo ra đối tượng statement
			String sql = "SELECT * FROM khachhang WHERE makhachhang=?";
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, t.getMaKhachHang());

			// Bước 3: thực thi câu lệnh SQL
			System.out.println(sql);
			ResultSet rs = st.executeQuery();

			// Bước 4:
			while (rs.next()) {
				String maKhacHang = rs.getString("makhachhang");
				String tenDangNhap = rs.getString("tendangnhap");
				String matKhau = rs.getString("matkhau");
				String hoVaTen = rs.getString("hovaten");
				String gioiTinh = rs.getString("gioitinh");
				String diaChi = rs.getString("diachi");
				Date ngaySinh = rs.getDate("ngaysinh");
				String soDienThoai = rs.getString("sodienthoai");
				String email = rs.getString("email");
				String maXacThuc = rs.getString("maxacthuc");
				Date thoiGianHieuLucCuaMaXacThuc = rs.getDate("thoigianhieuluccuamaxacthuc");
				boolean trangThaiXacThuc = rs.getBoolean("trangthaixacthuc");
				String duongDananh = rs.getString("duongdananh");
				
				ketQua = new KhachHang(maKhacHang, tenDangNhap, matKhau, hoVaTen, gioiTinh, ngaySinh, diaChi,
						soDienThoai, email, maXacThuc, thoiGianHieuLucCuaMaXacThuc, trangThaiXacThuc,duongDananh);

			}

			// Bước 5:
			JDBCUtil.closeConnection(con);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return ketQua;
	}

	@Override
	public int insert(KhachHang t) {
		int ketQua = 0;
		try {
			// Bước 1: tạo kết nối đến CSDL
			Connection con = JDBCUtil.getConnection();

			// Bước 2: tạo ra đối tượng statement
			String sql = "INSERT INTO khachhang (makhachhang, tendangnhap, matkhau, hovaten, gioitinh, ngaysinh, diachi,sodienthoai, email) "
					+ " VALUES (?,?,?,?,?,?,?,?,?)";

			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, t.getMaKhachHang());
			st.setString(2, t.getTenDangNhap());
			st.setString(3, t.getMatKhau());
			st.setString(4, t.getHoVaTen());
			st.setString(5, t.getGioiTinh());
			st.setDate(6, t.getNgaySinh());
			st.setString(7, t.getDiaChi());
			st.setString(8, t.getSoDienThoai());
			st.setString(9, t.getEmail());

			// Bước 3: thực thi câu lệnh SQL
			ketQua = st.executeUpdate();

			// Bước 4:
			System.out.println("Bạn đã thực thi: " + sql);
			System.out.println("Có " + ketQua + " dòng bị thay đổi!");

			// Bước 5:
			JDBCUtil.closeConnection(con);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return ketQua;
	}

	@Override
	public int insertAll(ArrayList<KhachHang> arr) {
		int dem = 0;
		for (KhachHang KhachHang : arr) {
			dem += this.insert(KhachHang);
		}
		return dem;
	}

	@Override
	public int delete(KhachHang t) {
		int ketQua = 0;
		try {
			// Bước 1: tạo kết nối đến CSDL
			Connection con = JDBCUtil.getConnection();

			// Bước 2: tạo ra đối tượng statement
			String sql = "DELETE from khachhang " + " WHERE makhachhang=?";

			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, t.getMaKhachHang());

			// Bước 3: thực thi câu lệnh SQL
			System.out.println(sql);
			ketQua = st.executeUpdate();

			// Bước 4:
			System.out.println("Bạn đã thực thi: " + sql);
			System.out.println("Có " + ketQua + " dòng bị thay đổi!");

			// Bước 5:
			JDBCUtil.closeConnection(con);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return ketQua;
	}

	@Override
	public int deleteAll(ArrayList<KhachHang> arr) {
		int dem = 0;
		for (KhachHang KhachHang : arr) {
			dem += this.delete(KhachHang);
		}
		return dem;
	}

	@Override
	public int update(KhachHang t) {
		int ketQua = 0;
		try {
			// Bước 1: tạo kết nối đến CSDL
			Connection con = JDBCUtil.getConnection();

			// Bước 2: tạo ra đối tượng statement
			String sql = "UPDATE khachhang " + " SET " + " tendangnhap=?" + ", matkhau=?" + ", hovaten=?"
					+ ", gioitinh=?" + ", ngaysinh=?" + ", diachi=?" + ", sodienthoai=?" + ", email=?"
					+ " WHERE makhachhang=?";

			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, t.getTenDangNhap());
			st.setString(2, t.getMatKhau());
			st.setString(3, t.getHoVaTen());
			st.setString(4, t.getGioiTinh());
			st.setDate(5, t.getNgaySinh());
			st.setString(6, t.getDiaChi());
			st.setString(7, t.getSoDienThoai());
			st.setString(8, t.getEmail());
			st.setString(9, t.getMaKhachHang());
			// Bước 3: thực thi câu lệnh SQL

			System.out.println(sql);
			ketQua = st.executeUpdate();

			// Bước 4:
			System.out.println("Bạn đã thực thi: " + sql);
			System.out.println("Có " + ketQua + " dòng bị thay đổi!");

			// Bước 5:
			JDBCUtil.closeConnection(con);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return ketQua;
	}

	// note lại Đăng ký
	public boolean kiemTraTenDangNhap(String tenDangNhap) {
		boolean ketQua = false;
		try {
			// Bước 1: tạo kết nối đến CSDL
			Connection con = JDBCUtil.getConnection();

			// Bước 2: tạo ra đối tượng statement
			String sql = "SELECT * FROM khachhang WHERE tenDangNhap=?";
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, tenDangNhap);

			// Bước 3: thực thi câu lệnh SQL
			System.out.println(sql);
			ResultSet rs = st.executeQuery();

			// Bước 4:
			while (rs.next()) {
				ketQua = true;
			}

			// Bước 5:
			JDBCUtil.closeConnection(con);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return ketQua;
	}

	// note lại Đăng nhập
	public KhachHang selectByUsernameAndPassWord(KhachHang t) {
		KhachHang ketQua = null;
		try {
			// Bước 1: tạo kết nối đến CSDL
			Connection con = JDBCUtil.getConnection();

			// Bước 2: tạo ra đối tượng statement
			String sql = "SELECT * FROM khachhang WHERE tendangnhap=? and matkhau=?";
			PreparedStatement st = con.prepareStatement(sql);
			System.out.println(t.getTenDangNhap() + "/" + t.getMatKhau());
			st.setString(1, t.getTenDangNhap());
			st.setString(2, t.getMatKhau());

			// Bước 3: thực thi câu lệnh SQL
			System.out.println(sql);
			ResultSet rs = st.executeQuery();

			// Bước 4:
			while (rs.next()) {
				String maKhacHang = rs.getString("makhachhang");
				String tenDangNhap = rs.getString("tendangnhap");
				String matKhau = rs.getString("matkhau");
				String hoVaTen = rs.getString("hovaten");
				String gioiTinh = rs.getString("gioitinh");
				String diaChi = rs.getString("diachi");
				Date ngaySinh = rs.getDate("ngaysinh");
				String soDienThoai = rs.getString("sodienthoai");
				String email = rs.getString("email");
				String maXacThuc = rs.getString("maxacthuc");
				Date thoiGianHieuLucCuaMaXacThuc = rs.getDate("thoigianhieuluccuamaxacthuc");
				boolean trangThaiXacThuc = rs.getBoolean("trangthaixacthuc");
				String duongDananh = rs.getString("duongdananh");

				ketQua = new KhachHang(maKhacHang, tenDangNhap, matKhau, hoVaTen, gioiTinh, ngaySinh, diaChi,
						soDienThoai, email, maXacThuc, thoiGianHieuLucCuaMaXacThuc, trangThaiXacThuc,duongDananh);

			}

			// Bước 5:
			JDBCUtil.closeConnection(con);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return ketQua;
	}

	// Thay đổi mật khẩu
	public boolean changePassword(KhachHang t) {
		int ketQua = 0;
		try {
			// Bước 1: tạo kết nối đến CSDL
			Connection con = JDBCUtil.getConnection();

			// Bước 2: tạo ra đối tượng statement
			String sql = "UPDATE khachhang " + " SET " + " matkhau=?" + " WHERE makhachhang = ?";

			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, t.getMatKhau());
			st.setString(2, t.getMaKhachHang());
			// Bước 3: thực thi câu lệnh SQL

			System.out.println(sql);
			ketQua = st.executeUpdate();

			// Bước 4:
			System.out.println("Bạn đã thực thi: " + sql);
			System.out.println("Có " + ketQua + " dòng bị thay đổi!");

			// Bước 5:
			JDBCUtil.closeConnection(con);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return ketQua > 0;
	}

	public int updateInfo(KhachHang t) {
		int ketQua = 0;
		try {
			// Bước 1: tạo kết nối đến CSDL
			Connection con = JDBCUtil.getConnection();

			// Bước 2: tạo ra đối tượng statement
			String sql = "UPDATE khachhang " + " SET " + " hovaten=?" + ", gioitinh=?" + ", ngaysinh=?" + ", diachi=?"
					+ ", sodienthoai=?" + ", email=?" + " WHERE makhachhang=?";

			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, t.getHoVaTen());
			st.setString(2, t.getGioiTinh());
			st.setDate(3, t.getNgaySinh());
			st.setString(4, t.getDiaChi());
			st.setString(5, t.getSoDienThoai());
			st.setString(6, t.getEmail());
			st.setString(7, t.getMaKhachHang());
			// Bước 3: thực thi câu lệnh SQL

			System.out.println(sql);
			ketQua = st.executeUpdate();

			// Bước 4:
			System.out.println("Bạn đã thực thi: " + sql);
			System.out.println("Có " + ketQua + " dòng bị thay đổi!");

			// Bước 5:
			JDBCUtil.closeConnection(con);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return ketQua;
	}

	public int updateVerifyInformation(KhachHang t) {
		int ketQua = 0;
		try {
			// Bước 1: tạo kết nối đến CSDL
			Connection con = JDBCUtil.getConnection();

			// Bước 2: tạo ra đối tượng statement
			String sql = "UPDATE khachhang " + " SET " + " maxacthuc=?" + ", thoigianhieuluccuamaxacthuc=?"
					+ ", trangthaixacthuc=?" + " WHERE makhachhang=?";

			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, t.getMaXacThuc());
			st.setDate(2, t.getThoiGianHieuLucCuaMaXacThuc());
			st.setBoolean(3, t.isTrangThaiXacThuc());
			st.setString(4, t.getMaKhachHang());
			// Bước 3: thực thi câu lệnh SQL

			System.out.println(sql);
			ketQua = st.executeUpdate();

			// Bước 4:
			System.out.println("Bạn đã thực thi: " + sql);
			System.out.println("Có " + ketQua + " dòng bị thay đổi!");

			// Bước 5:
			JDBCUtil.closeConnection(con);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return ketQua;
	}
	public int updateImage(KhachHang t) {
		int ketQua = 0;
		try {
			// Bước 1: tạo kết nối đến CSDL
			Connection con = JDBCUtil.getConnection();

			// Bước 2: tạo ra đối tượng statement
			String sql = "UPDATE khachhang " + " SET " + " duongdananh=?"  + " WHERE makhachhang=?";

			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, t.getDuongDanAnh());
			st.setString(2, t.getMaKhachHang());
			// Bước 3: thực thi câu lệnh SQL

			System.out.println(sql);
			ketQua = st.executeUpdate();

			// Bước 4:
			System.out.println("Bạn đã thực thi: " + sql);
			System.out.println("Có " + ketQua + " dòng bị thay đổi!");

			// Bước 5:
			JDBCUtil.closeConnection(con);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return ketQua;
	}
	

}
