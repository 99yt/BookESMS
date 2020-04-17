package cn.blb.dao.bean;

public class BookNews {
    private int id		;//int		primary key auto_increment,-- 主键
    private String title	;//	VARCHAR(100)				,-- 资讯标题
    private String content	;//	VARCHAR(200)				,-- 资讯内容
    private int release_time	;//	TIMESTAMP				,-- 发布时间
    private String sticky	;//	CHAR(1)				-- 是否置顶

    public BookNews() {
    }

    public BookNews(int id, String title, String content, int release_time, String sticky) {
        this.id = id;
        this.title = title;
        this.content = content;
        this.release_time = release_time;
        this.sticky = sticky;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public int getRelease_time() {
        return release_time;
    }

    public void setRelease_time(int release_time) {
        this.release_time = release_time;
    }

    public String getSticky() {
        return sticky;
    }

    public void setSticky(String sticky) {
        this.sticky = sticky;
    }

    @Override
    public String toString() {
        return "BookNews{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", content='" + content + '\'' +
                ", release_time=" + release_time +
                ", sticky='" + sticky + '\'' +
                '}';
    }
}
