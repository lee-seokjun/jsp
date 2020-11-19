package chap7;
/*
 * Bean Å¬·¡½º 
 * getProperty
 *     getAbc() : "abc"  
 * setProperty
 *     setAbc(Object) : "abc"  
 */
public class Book {
	private String name;
	private String title;
	private String content;
	//getter, setter
	public String getName() { //getPropery : name
		return name;
	}
	public void setName(String name) { //setPropery : name
		this.name = name;
	}
	public String getTitle() { //getPropery : title
		return title;
	}
	public void setTitle(String title) { //setPropery : title
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	@Override
	public String toString() {
		return "Book [name=" + name + ", title=" + title + ", content=" + content + "]";
	}	
}
