package devpro.crawl;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.ObjectOutputStream;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.net.URL;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import devpro.crawl.Document.Category;
import devpro.crawl.Document.Constans;
import devpro.crawl.Service.BaseService;

public class Main extends BaseService implements Constans {

	public static void main(String[] args) throws IOException {

		List<Category> product = new ArrayList<Category>();

		List<String> productTitle = new ArrayList<String>();

		List<String> productImage = new ArrayList<String>();

		Category category;

		// Doc toan bo html lua vao doc
		Document doc = Jsoup.connect("https://viendong.com.vn/").get();
		// Lay toan bo the nam trong va ca the chua class = title
		Elements imgs = doc.getElementsByClass("ee-product");

		for (Element element : imgs) {
			System.out.println("The a: " + element.toString());
		}
		// Chon toan bo the a nam trong class
		Elements tag = imgs.select("a");
		// Doc toan bo noi dung trong the a
		Elements url_image = tag.select("img");

		String url = null;
		for (Element element : url_image) {
			url = element.absUrl("data-src");
			System.out.println("url: " + url);
			productImage.add(url);
			// productAddress.add(url);
		}

		Elements title = imgs.select("h5");
		String titles = null;

		for (Element element : title) {
			titles = element.text();
			productTitle.add(titles);
		}

		for (int i = 0; i < imgs.size(); i++) {
			category = new Category();
			category.setImages(productImage.get(i));
			category.setTitle(productTitle.get(i));
			product.add(category);
		}

		for (Category element : product) {
			System.out.println("data-nt: " + element.toString());
		}

		saveFile(product, FILE_FOLDER_ROOT);
		
		openFile("data.txt", FILE_FOLDER_ROOT);

		// Luu vao thu muc
		/*
		 * for (Category element : product) { try { saveImg(element.getImages(),
		 * element.getTitle(), IMAGES_FORDER_CRAWL); } catch (Exception e) {
		 * System.out.println("\nLỗi crawl ảnh!!!"); } finally {
		 * System.out.println("\nDone!"); } }
		 */

	}

	public static void saveImg(String src_image, String name, String dir) {
		try {
			URL url = new URL(src_image);
			InputStream in = new BufferedInputStream(url.openStream());
			OutputStream out = new BufferedOutputStream(new FileOutputStream(dir + "\\" + name + ".jpg"));

			for (int i; (i = in.read()) != -1;) {
				out.write(i);
			}
			in.close();
			out.close();
		} catch (Exception e) {
			// TODO: handle exception
		} finally {

		}
	}

	public static void saveFile(List<Category> categories, String dirFile) {
		BufferedWriter fio = null;
		ObjectOutputStream oos = null;
		try {
			File file = new File(dirFile + "\\data.txt");

			fio = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(file), "UTF8"));

			for (Category category : categories) {
				fio.write(category.toString());
				fio.newLine();
			}

			fio.flush();
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			try {
				if (fio != null)
					fio.close();
				if (oos != null)
					oos.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
	}

	public static void openFile(String fileName, String dirFile) throws IOException {
		BufferedReader reader = new BufferedReader(new FileReader(dirFile + "\\" + fileName));

		String[] split;
		String data = reader.readLine();
		Connection conn = getConnection(DB_URL, USER_NAME, PASSWORD);
		
		while (data != null) {
			split = data.split(";");
			try {
				Statement stmt = conn.createStatement();
				String sql = "INSERT INTO tbl_products(title, avatar, price, detail_description, short_description, category_id) VALUES (" + "'" + split[0] + "'" + ", " + "'" + split[1] + "'"
						+ ", 3000.00, 'Gỗ Oak - MDF veneer Oak - Inox 304', 'Mã sản phẩm: VDD 123', 22);";
				stmt.executeUpdate(sql);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			System.out.println("data = " + data);
			data = reader.readLine();
		}

		reader.close();
	}
}
