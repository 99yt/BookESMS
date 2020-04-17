package cn.blb.dao.bean;

/*
* 封装图书分类信息实体类
* */
public class BookCategory {
    //-- 字段名称		类型		约束		描述
    private int category_id		;//int		primary key auto_increment,		-- 主键
    private String name		;//VARCHAR(50)				,		-- 类别名
    private int turn		;//int				,		-- 顺序
    private String description	;//	VARCHAR(50)				,		-- 描述
    private int parent_id	;//	int					-- 父类别ID

    public BookCategory() {
    }

    public BookCategory(int category_id, String name, int turn, String description, int parent_id) {
        this.category_id = category_id;
        this.name = name;
        this.turn = turn;
        this.description = description;
        this.parent_id = parent_id;
    }

    public int getCategory_id() {
        return category_id;
    }

    public void setCategory_id(int category_id) {
        this.category_id = category_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getTurn() {
        return turn;
    }

    public void setTurn(int turn) {
        this.turn = turn;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getParent_id() {
        return parent_id;
    }

    public void setParent_id(int parent_id) {
        this.parent_id = parent_id;
    }

    @Override
    public String toString() {
        return "BookCategory{" +
                "category_id=" + category_id +
                ", name='" + name + '\'' +
                ", turn=" + turn +
                ", description='" + description + '\'' +
                ", parent_id=" + parent_id +
                '}';
    }
}

