package devpro.crawl.Document;

public class Category {
	
	private String title;
	private String images;
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getImages() {
		return images;
	}
	public void setImages(String images) {
		this.images = images;
	}
	
	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return getTitle() + ";" + getImages();
	}

}
