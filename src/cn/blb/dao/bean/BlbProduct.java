package cn.blb.dao.bean;

import java.util.Date;

public class BlbProduct {
    private int product_id		;//int 		primary key auto_increment, -- 主键
    private String name		;//VARCHAR(50)				, --  产品名
    private String keywords	;//	VARCHAR(50)		,-- 		关键字
    private String addTimeStr;
    private Date add_time	;//	DATE				, -- 上架时间
    private String picture	;//	VARCHAR(50)				, -- 产品图片
    private String big_picture	;//	VARCHAR(50)				, -- 放大图片
    private float fixed_price	;//	float				, -- 定价
    private float lower_price;//		float				, -- 京东价
    private String description;//		VARCHAR(100)				, -- 产品描述
    private String author	;//	VARCHAR(100)			, -- 	作者
    private String publishing	;//	VARCHAR(100)				, -- 出版社
    private Date publish_time	;//	DATE				, -- 出版时间
    private String publishTimeStr;
    private String isbn	;//	VARCHAR(100)				, -- ISBN编号
    private String language	;//	VARCHAR(100)				, -- 语种
    private String which_edtion	;//	VARCHAR(100)			, -- 	版次
    private String total_page	;//	VARCHAR(100)				, -- 页数
    private String bind_layout	;//	VARCHAR(100)			, -- 	装帧
    private String book_size	;//	VARCHAR(100)				, -- 开本
    private String editor_description	;//	VARCHAR(100)	, -- 			编辑推荐描述
    private String catalog	;//	VARCHAR(100)				, -- 目录
    private String book_summary	;//	VARCHAR(100)			, -- 	内容简介
    private String author_summary	;//	VARCHAR(100)			, -- 	作者简介
    private String extracts	;//	VARCHAR(100)			, -- 	精彩书斋
    private Date print_time	;//	DATE				, -- 印刷时间
    private int print_number	;//	int			, -- 	印刷数量
    private String paper_type	;//	VARCHAR(100)			, -- 	纸张类型
    private String print_frequency	;//	VARCHAR(100),		 -- 		印次
    private int sale_count ;// int -- 销量排行
    public String getAddTimeStr() {
        return addTimeStr;
    }

    public void setAddTimeStr(String addTimeStr) {
        this.addTimeStr = addTimeStr;
    }

    public String getPublishTimeStr() {
        return publishTimeStr;
    }

    public void setPublishTimeStr(String publishTimeStr) {
        this.publishTimeStr = publishTimeStr;
    }

    public BlbProduct() {
    }

    public BlbProduct(int product_id, String name, String keywords, Date add_time, String picture, String big_picture, float fixed_price, float lower_price, String description, String author, String publishing, Date publish_time, String isbn, String language, String which_edtion, String total_page, String bind_layout, String book_size, String editor_description, String catalog, String book_summary,
                      String author_summary, String extracts, Date print_time, int print_number, String paper_type, String print_frequency, int sale_count) {
        this.product_id = product_id;
        this.name = name;
        this.keywords = keywords;
        this.add_time = add_time;
        this.picture = picture;
        this.big_picture = big_picture;
        this.fixed_price = fixed_price;
        this.lower_price = lower_price;
        this.description = description;
        this.author = author;
        this.publishing = publishing;
        this.publish_time = publish_time;
        this.isbn = isbn;
        this.language = language;
        this.which_edtion = which_edtion;
        this.total_page = total_page;
        this.bind_layout = bind_layout;
        this.book_size = book_size;
        this.editor_description = editor_description;
        this.catalog = catalog;
        this.book_summary = book_summary;
        this.author_summary = author_summary;
        this.extracts = extracts;
        this.print_time = print_time;
        this.print_number = print_number;
        this.paper_type = paper_type;
        this.print_frequency = print_frequency;
        this.sale_count = sale_count;
    }

    public int getProduct_id() {
        return product_id;
    }

    public void setProduct_id(int product_id) {
        this.product_id = product_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getKeywords() {
        return keywords;
    }

    public void setKeywords(String keywords) {
        this.keywords = keywords;
    }

    public Date getAdd_time() {
        return add_time;
    }

    public void setAdd_time(Date add_time) {
        this.add_time = add_time;
    }

    public String getPicture() {
        return picture;
    }

    public void setPicture(String picture) {
        this.picture = picture;
    }

    public String getBig_picture() {
        return big_picture;
    }

    public void setBig_picture(String big_picture) {
        this.big_picture = big_picture;
    }

    public float getFixed_price() {
        return fixed_price;
    }

    public void setFixed_price(float fixed_price) {
        this.fixed_price = fixed_price;
    }

    public float getLower_price() {
        return lower_price;
    }

    public void setLower_price(float lower_price) {
        this.lower_price = lower_price;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getPublishing() {
        return publishing;
    }

    public void setPublishing(String publishing) {
        this.publishing = publishing;
    }

    public Date getPublish_time() {
        return publish_time;
    }

    public void setPublish_time(Date publish_time) {
        this.publish_time = publish_time;
    }

    public String getIsbn() {
        return isbn;
    }

    public void setIsbn(String isbn) {
        this.isbn = isbn;
    }

    public String getLanguage() {
        return language;
    }

    public void setLanguage(String language) {
        this.language = language;
    }

    public String getWhich_edtion() {
        return which_edtion;
    }

    public void setWhich_edtion(String which_edtion) {
        this.which_edtion = which_edtion;
    }

    public String getTotal_page() {
        return total_page;
    }

    public void setTotal_page(String total_page) {
        this.total_page = total_page;
    }

    public String getBind_layout() {
        return bind_layout;
    }

    public void setBind_layout(String bind_layout) {
        this.bind_layout = bind_layout;
    }

    public String getBook_size() {
        return book_size;
    }

    public void setBook_size(String book_size) {
        this.book_size = book_size;
    }

    public String getEditor_description() {
        return editor_description;
    }

    public void setEditor_description(String editor_description) {
        this.editor_description = editor_description;
    }

    public String getCatalog() {
        return catalog;
    }

    public void setCatalog(String catalog) {
        this.catalog = catalog;
    }

    public String getBook_summary() {
        return book_summary;
    }

    public void setBook_summary(String book_summary) {
        this.book_summary = book_summary;
    }

    public String getAuthor_summary() {
        return author_summary;
    }

    public void setAuthor_summary(String author_summary) {
        this.author_summary = author_summary;
    }

    public String getExtracts() {
        return extracts;
    }

    public void setExtracts(String extracts) {
        this.extracts = extracts;
    }

    public Date getPrint_time() {
        return print_time;
    }

    public void setPrint_time(Date print_time) {
        this.print_time = print_time;
    }

    public int getPrint_number() {
        return print_number;
    }

    public void setPrint_number(int print_number) {
        this.print_number = print_number;
    }

    public String getPaper_type() {
        return paper_type;
    }

    public void setPaper_type(String paper_type) {
        this.paper_type = paper_type;
    }

    public String getPrint_frequency() {
        return print_frequency;
    }

    public void setPrint_frequency(String print_frequency) {
        this.print_frequency = print_frequency;
    }

    public int getSale_count() {
        return sale_count;
    }

    public void setSale_count(int sale_count) {
        this.sale_count = sale_count;
    }

    @Override
    public String toString() {
        return "BlbProduct{" +
                "product_id=" + product_id +
                ", name='" + name + '\'' +
                ", keywords='" + keywords + '\'' +
                ", add_time=" + add_time +
                ", picture='" + picture + '\'' +
                ", big_picture='" + big_picture + '\'' +
                ", fixed_price=" + fixed_price +
                ", lower_price=" + lower_price +
                ", description='" + description + '\'' +
                ", author='" + author + '\'' +
                ", publishing='" + publishing + '\'' +
                ", publish_time=" + publish_time +
                ", isbn='" + isbn + '\'' +
                ", language='" + language + '\'' +
                ", which_edtion='" + which_edtion + '\'' +
                ", total_page='" + total_page + '\'' +
                ", bind_layout='" + bind_layout + '\'' +
                ", book_size='" + book_size + '\'' +
                ", editor_description='" + editor_description + '\'' +
                ", catalog='" + catalog + '\'' +
                ", book_summary='" + book_summary + '\'' +
                ", author_summary='" + author_summary + '\'' +
                ", extracts='" + extracts + '\'' +
                ", print_time=" + print_time +
                ", print_number=" + print_number +
                ", paper_type='" + paper_type + '\'' +
                ", print_frequency='" + print_frequency + '\'' +
                ", sale_count=" + sale_count +
                '}';
    }
}
