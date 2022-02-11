package model.domain.datainfo;

public class BoardDTO implements Comparable<BoardDTO>{
	
	private static int count = 1;
	private int num;
	private String title;
	private String writer;
	private String contents;
	private String pw;
	private String date;

	public BoardDTO(int num){
		this.num = num;
	}
	
	public BoardDTO(String title, String writer, String contents, String pw, String date) {
		super();
		this.title = title;
		this.writer = writer;
		this.contents = contents;
		this.pw = pw;
		this.date = date;
		num = count++;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public static int getCount() {
		return count;
	}

	public static void setCount(int count) {
		BoardDTO.count = count;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}
	
	@Override
	public int compareTo(BoardDTO other) {
		return (num - other.getNum()) * -1;
	}
	
	@Override
	public boolean equals(Object o) {
		if(o == null || !(o instanceof BoardDTO)) {
			return false;
		}
		BoardDTO other = (BoardDTO)o;
		return num == other.getNum();
	}
}