package controller;

import java.io.IOException;
import java.sql.Date;
import java.util.Calendar;
import java.util.Random;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import database.KhachHangDAO;
import model.KhachHang;
import util.Email;
import util.SoNgauNhien;

/**
 * Servlet implementation class KhachHangController
 */
@WebServlet("/khach-hang")
public class KhachHangController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public KhachHangController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		String hanhDong = request.getParameter("hanhDong");
		if (hanhDong.equals("dangKy")) {
			dangKy(request, response);
		} else if (hanhDong.equals("dangNhap")) {
			dangNhap(request, response);
		}else if (hanhDong.equals("dangXuat")) {
			dangXuat(request, response);
		}else if (hanhDong.equals("doiMatKhau")) {
			doiMatKhau(request, response);
		}else if (hanhDong.equals("thayDoiThongTin")) {
			thayDoiThongTin(request, response);
		}else if (hanhDong.equals("xac-thuc")) {
			xacThuc(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}


	private void dangNhap(HttpServletRequest request, HttpServletResponse response) {

		try {
			String tenDangNhap = request.getParameter("tenDangNhap");
			String matKhau = request.getParameter("matKhau");

			KhachHang kh = new KhachHang();
			kh.setTenDangNhap(tenDangNhap);
			kh.setMatKhau(matKhau);

			KhachHangDAO khd = new KhachHangDAO();
			KhachHang khachHang = khd.selectByUsernameAndPassWord(kh);
			String url = "";
			if (khachHang != null&&khachHang.isTrangThaiXacThuc()) {
				//if (khachHang != null) {
					HttpSession session = request.getSession();
					session.setAttribute("khachHang", khachHang);
					url = "/index.jsp";
				} else {
					request.setAttribute("baoLoi", "Tên đăng nhập hoặc mật khẩu không đúng / hoặc Tài khoản chưa xác thực!");
					url = "/khachhang/dangnhap.jsp";
				}
				RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
				rd.forward(request, response);
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	private void dangXuat(HttpServletRequest request, HttpServletResponse response) {
		try {
			HttpSession session = request.getSession();
			// Huy bo session
			session.invalidate();

			String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
					+ request.getContextPath();

			response.sendRedirect(url + "/index.jsp");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	//đổi mật khẩu
	private void doiMatKhau(HttpServletRequest request, HttpServletResponse response) {
		try {
			String matKhauHienTai = request.getParameter("matKhauHienTai");
			String matKhauMoi = request.getParameter("matKhauMoi");
			String matKhauMoiNhapLai = request.getParameter("matKhauMoiNhapLai");

			String baoLoi = "";
			String url = "";

			// Kiem tra mat khau cu co giong hay khong
			HttpSession session = request.getSession();
			Object obj = session.getAttribute("khachHang");
			KhachHang khachHang = null;
			if (obj != null)
				khachHang = (KhachHang) obj;
			if (khachHang == null) {
				baoLoi = "Bạn chưa đăng nhập vào hệ thống!";
				url = "/khachhang/doimatkhau.jsp";
			} else {
				// Neu khach hang da dang nhap
				if (!matKhauHienTai.equals(khachHang.getMatKhau())) {
					baoLoi = "Mật khẩu hiện tại không chính xác!";
					url = "/khachhang/doimatkhau.jsp";
				} else {
					if (!matKhauMoi.equals(matKhauMoiNhapLai)) {
						baoLoi = "Mật khẩu nhập lại không khớp!";
						url = "/khachhang/doimatkhau.jsp";
					} else {
						
						khachHang.setMatKhau(matKhauMoi);
						KhachHangDAO khd = new KhachHangDAO();
						if (khd.changePassword(khachHang)) {
							url = "/khachhang/thanhcong.jsp";
						} else {
							baoLoi = "Quá trình thay đổi mật khẩu không thành công!";
							url = "/khachhang/doimatkhau.jsp";
						}
					}
				}
			}

			request.setAttribute("baoLoi", baoLoi);
			RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
			rd.forward(request, response);
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	private void thayDoiThongTin(HttpServletRequest request, HttpServletResponse response) {
		try {
			String hoVaTen = request.getParameter("hoVaTen");
			String gioiTinh = request.getParameter("gioiTinh");
			String ngaySinh = request.getParameter("ngaySinh");
			String diaChiKhachHang = request.getParameter("diaChiKhachHang");
			String soDienThoai = request.getParameter("soDienThoai");
			String email = request.getParameter("email");
		
			request.setAttribute("hoVaTen", hoVaTen);
			request.setAttribute("gioiTinh", gioiTinh);
			request.setAttribute("ngaySinh", ngaySinh);
			request.setAttribute("diaChiKhachHang", diaChiKhachHang);
			request.setAttribute("soDienThoai", soDienThoai);
			request.setAttribute("email", email);

			String url = "";

			String baoLoi = "";
			KhachHangDAO khachHangDAO = new KhachHangDAO();
			request.setAttribute("baoLoi", baoLoi);

			if (baoLoi.length() > 0) {
				url = "/khachhang/thaydoithongtin.jsp";
			} else {
				Object obj = request.getSession().getAttribute("khachHang");
				KhachHang khachHang = null;
				if (obj != null)
				khachHang = (KhachHang) obj;
				if (khachHang != null) {
					String maKhachHang = khachHang.getMaKhachHang();
					KhachHang kh = new KhachHang(maKhachHang,"","",hoVaTen,gioiTinh,Date.valueOf(ngaySinh),diaChiKhachHang,soDienThoai,email);
					khachHangDAO.updateInfo(kh);
					KhachHang kh2 = khachHangDAO.selectById(kh);
					request.getSession().setAttribute("khachHang", kh2);
					url = "/khachhang/thanhcong.jsp";
				}

			}
			RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
			rd.forward(request, response);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
		private void dangKy(HttpServletRequest request, HttpServletResponse response) {

		try {
			request.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=UTF-8");
			String tenDangNhap = request.getParameter("tenDangNhap");
			String matKhau = request.getParameter("matKhau");
			String matKhauNhapLai = request.getParameter("matKhauNhapLai");
			String hoVaTen = request.getParameter("hoVaTen");
			String gioiTinh = request.getParameter("gioiTinh");
			String ngaySinh = request.getParameter("ngaySinh");
			String diaChiKhachHang = request.getParameter("diaChiKhachHang");
			String soDienThoai = request.getParameter("soDienThoai");
			String email = request.getParameter("email");

			request.setAttribute("tenDangNhap", tenDangNhap);
			request.setAttribute("hoVaTen", hoVaTen);
			request.setAttribute("gioiTinh", gioiTinh);
			request.setAttribute("ngaySinh", ngaySinh);
			request.setAttribute("diaChiKhachHang", diaChiKhachHang);
			request.setAttribute("soDienThoai", soDienThoai);
			request.setAttribute("email", email);

			String url = "";

			String baoLoi = "";
			KhachHangDAO khachHangDAO = new KhachHangDAO();

			if (khachHangDAO.kiemTraTenDangNhap(tenDangNhap)) {
				baoLoi += "Tên đăng nhập đã tồn tại, vui lòng chọn tên đăng nhập khác.<br/>";
			}

			if (!matKhau.equals(matKhauNhapLai)) {
				baoLoi += "Mẫu khẩu không khớp.<br/>";
			}

			request.setAttribute("baoLoi", baoLoi);

			if (baoLoi.length() > 0) {
				url = "/khachhang/dangky.jsp";
			} else {
				Random rd = new Random();
				String maKhachHang = System.currentTimeMillis() + rd.nextInt(1000) + "";
				KhachHang kh = new KhachHang(maKhachHang, tenDangNhap, matKhau, hoVaTen, gioiTinh,
						Date.valueOf(ngaySinh), diaChiKhachHang, soDienThoai, email);
				if (khachHangDAO.insert(kh)>0) {
					// Day so xac thuc
					String soNgauNhien = SoNgauNhien.getSoNgauNhien();

					// Quy dinh thoi gian hieu luc
					Date todaysDate = new Date(new java.util.Date().getTime());
					Calendar c = Calendar.getInstance();
					c.setTime(todaysDate);
					c.add(Calendar.DATE, 1);
					Date thoGianHieuLucXacThuc = new Date(c.getTimeInMillis());

					// Trang thai xac thuc = false		 			
					boolean trangThaiXacThuc = false;
					
					kh.setMaXacThuc(soNgauNhien);
					kh.setThoiGianHieuLucCuaMaXacThuc(thoGianHieuLucXacThuc);
					kh.setTrangThaiXacThuc(trangThaiXacThuc);
					if(khachHangDAO.updateVerifyInformation(kh)>0) {
						// Gui email cho khach hang
						Email.sendEmail(kh.getEmail(), "Xác thực tài khoản!", getNoiDung(kh));
					}
				}
				url = "/khachhang/thanhcong.jsp";
			}
			RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
			rd.forward(request, response);
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

		private void xacThuc(HttpServletRequest request, HttpServletResponse response) {
			try {
				String maKhachHang = request.getParameter("maKhachHang");
				String maXacThuc = request.getParameter("maXacThuc");

				KhachHangDAO khachHangDAO = new KhachHangDAO();
				
				KhachHang kh = new KhachHang();
				kh.setMaKhachHang(maKhachHang);
				KhachHang khachHang = khachHangDAO.selectById(kh);
				
				String msg = "";
				if (khachHang != null) {
					// Kiem tra ma xac thuc co giong nhau hay khong? // Kiem tra xem ma xac thuc con hieu luc hay khong?
					if(khachHang.getMaXacThuc().equals(maXacThuc)) {
						// Thanh Cong
						khachHang.setTrangThaiXacThuc(true);
						khachHangDAO.updateVerifyInformation(khachHang);
						msg ="Xác thực thành công!";
					}else {
						// That Bai
						msg ="Xác thực không thành công!";
					}
				}else {
					msg ="Tài khoản không tồn tại!";
				}
				String url = "/khachhang/thanhcong.jsp";
				request.setAttribute("baoLoi", msg);
				RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
				rd.forward(request, response);
			} catch (ServletException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
	
	public static String getNoiDung(KhachHang kh) {
		String link = "http://localhost:8080/webcn/khach-hang?hanhDong=xac-thuc&maKhachHang="+kh.getMaKhachHang()+"&maXacThuc="+kh.getMaXacThuc();
		String noiDung = "<p>TITV.vn xin ch&agrave;o bạn <strong>"+kh.getHoVaTen()+"</strong>,</p>\r\n"
				+ "<p>Vui l&ograve;ng x&aacute;c thực t&agrave;i khoản của bạn bằng c&aacute;ch nhập m&atilde; <strong>"+kh.getMaXacThuc()+"</strong>, hoặc click trực tiếp v&agrave;o đường link sau đ&acirc;y:</p>\r\n"
				+ "<p><a href=\""+link+"\">"+link+"</a></p>\r\n"
				+ "<p>Đ&acirc;y l&agrave; email tự động, vui l&ograve;ng kh&ocirc;ng phản hồi email n&agrave;y.</p>\r\n"
				+ "<p>Tr&acirc;n trọng cảm ơn.</p>";
		return noiDung;
	}


}
