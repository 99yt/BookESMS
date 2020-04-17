package cn.blb.dao.bean;

public class BlbUser {
    private int user_id;//		int		primary key auto_increment,		-- 主键
    private String login_name	;//	VARCHAR(64)	unique	not null		,		-- 登录名
    private String nick_name;//		VARCHAR(64)				,		-- 昵称
    private String real_name;//		VARCHAR(64)				,		-- 真实名
    private int grade_id;//		int				,		-- 会员等级ID
    private String password;//		VARCHAR(100)		not null		,		-- 密码
    private String email	;//	VARCHAR(200)				,		-- 邮箱地址
    private String province;//		VARCHAR(100)				,		-- 省份
    private String recommender	;//	VARCHAR(100)				,		-- 推荐人
    private String sex	;//		VARCHAR(64)				,		-- 性别
    private int birth	;//		TIMESTAMP				,		-- 生日
    private String location;//		VARCHAR(100)				,		-- 所属地
    private String school	;//		VARCHAR(200)				,		-- 学校信息
    private String company	;//		VARCHAR(200)				,		-- 公司信息
    private String card_number	;//	VARCHAR(64)		,		-- 身份证号码
    private String mobile	;//	VARCHAR(64)				,		-- 电话
    private String phone;//		VARCHAR(64)				,		-- 手机号
    private String msn	;//		VARCHAR(64)				,		-- MSN
    private String qq	;//		VARCHAR(64)				,		-- QQ
    private String website	;//		VARCHAR(64)				,		-- 个人网站
    private String send_address;//		VARCHAR(100)				,		-- 发货地址
    private String zipcode	;//		VARCHAR(32)				,		-- 邮编
    private String hobby;//			VARCHAR(64)				,		-- 兴趣爱好
    private String verify_flag;//		VARCHAR(64)				,		-- Email是否通过
    private String verify_code	;//	VARCHAR(64)				,		-- Email验证码
    private int last_login_time	;//	TIMESTAMP				,		-- 最后一次登录时间
    private String last_login_ip;//		VARCHAR(64)				,		-- 最后一次登录IP
    private String area	;//			VARCHAR(100)				,		-- 区
    private String head_pic	;//	VARCHAR(50)				-- 头像图片
    public BlbUser() {
        super();
        // TODO Auto-generated constructor stub
    }
    public BlbUser(String login_name, String password, String email, String recommender) {
        super();
        this.login_name = login_name;
        this.password = password;
        this.email = email;
        this.recommender = recommender;
    }
    public int getUser_id() {
        return user_id;
    }
    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }
    public String getLogin_name() {
        return login_name;
    }
    public void setLogin_name(String login_name) {
        this.login_name = login_name;
    }
    public String getNick_name() {
        return nick_name;
    }
    public void setNick_name(String nick_name) {
        this.nick_name = nick_name;
    }
    public String getReal_name() {
        return real_name;
    }
    public void setReal_name(String real_name) {
        this.real_name = real_name;
    }
    public int getGrade_id() {
        return grade_id;
    }
    public void setGrade_id(int grade_id) {
        this.grade_id = grade_id;
    }
    public String getPassword() {
        return password;
    }
    public void setPassword(String password) {
        this.password = password;
    }
    public String getEmail() {
        return email;
    }
    public void setEmail(String email) {
        this.email = email;
    }
    public String getProvince() {
        return province;
    }
    public void setProvince(String province) {
        this.province = province;
    }
    public String getRecommender() {
        return recommender;
    }
    public void setRecommender(String recommender) {
        this.recommender = recommender;
    }
    public String getSex() {
        return sex;
    }
    public void setSex(String sex) {
        this.sex = sex;
    }
    public int getBirth() {
        return birth;
    }
    public void setBirth(int birth) {
        this.birth = birth;
    }
    public String getLocation() {
        return location;
    }
    public void setLocation(String location) {
        this.location = location;
    }
    public String getSchool() {
        return school;
    }
    public void setSchool(String school) {
        this.school = school;
    }
    public String getCompany() {
        return company;
    }
    public void setCompany(String company) {
        this.company = company;
    }
    public String getCard_number() {
        return card_number;
    }
    public void setCard_number(String card_number) {
        this.card_number = card_number;
    }
    public String getMobile() {
        return mobile;
    }
    public void setMobile(String mobile) {
        this.mobile = mobile;
    }
    public String getPhone() {
        return phone;
    }
    public void setPhone(String phone) {
        this.phone = phone;
    }
    public String getMsn() {
        return msn;
    }
    public void setMsn(String msn) {
        this.msn = msn;
    }
    public String getQq() {
        return qq;
    }
    public void setQq(String qq) {
        this.qq = qq;
    }
    public String getWebsite() {
        return website;
    }
    public void setWebsite(String website) {
        this.website = website;
    }
    public String getSend_address() {
        return send_address;
    }
    public void setSend_address(String send_address) {
        this.send_address = send_address;
    }
    public String getZipcode() {
        return zipcode;
    }
    public void setZipcode(String zipcode) {
        this.zipcode = zipcode;
    }
    public String getHobby() {
        return hobby;
    }
    public void setHobby(String hobby) {
        this.hobby = hobby;
    }
    public String getVerify_flag() {
        return verify_flag;
    }
    public void setVerify_flag(String verify_flag) {
        this.verify_flag = verify_flag;
    }
    public String getVerify_code() {
        return verify_code;
    }
    public void setVerify_code(String verify_code) {
        this.verify_code = verify_code;
    }
    public int getLast_login_time() {
        return last_login_time;
    }
    public void setLast_login_time(int last_login_time) {
        this.last_login_time = last_login_time;
    }
    public String getLast_login_ip() {
        return last_login_ip;
    }
    public void setLast_login_ip(String last_login_ip) {
        this.last_login_ip = last_login_ip;
    }
    public String getArea() {
        return area;
    }
    public void setArea(String area) {
        this.area = area;
    }
    public String getHead_pic() {
        return head_pic;
    }
    public void setHead_pic(String head_pic) {
        this.head_pic = head_pic;
    }
    @Override
    public String toString() {
        return "BlbUser [user_id=" + user_id + ", login_name=" + login_name + ", nick_name=" + nick_name
                + ", real_name=" + real_name + ", grade_id=" + grade_id + ", password=" + password + ", email=" + email
                + ", province=" + province + ", recommender=" + recommender + ", sex=" + sex + ", birth=" + birth
                + ", location=" + location + ", school=" + school + ", company=" + company + ", card_number="
                + card_number + ", mobile=" + mobile + ", phone=" + phone + ", msn=" + msn + ", qq=" + qq + ", website="
                + website + ", send_address=" + send_address + ", zipcode=" + zipcode + ", hobby=" + hobby
                + ", verify_flag=" + verify_flag + ", verify_code=" + verify_code + ", last_login_time="
                + last_login_time + ", last_login_ip=" + last_login_ip + ", area=" + area + ", head_pic=" + head_pic
                + ", getUser_id()=" + getUser_id() + ", getLogin_name()=" + getLogin_name() + ", getNick_name()="
                + getNick_name() + ", getReal_name()=" + getReal_name() + ", getGrade_id()=" + getGrade_id()
                + ", getPassword()=" + getPassword() + ", getEmail()=" + getEmail() + ", getProvince()=" + getProvince()
                + ", getRecommender()=" + getRecommender() + ", getSex()=" + getSex() + ", getBirth()=" + getBirth()
                + ", getLocation()=" + getLocation() + ", getSchool()=" + getSchool() + ", getCompany()=" + getCompany()
                + ", getCard_number()=" + getCard_number() + ", getMobile()=" + getMobile() + ", getPhone()="
                + getPhone() + ", getMsn()=" + getMsn() + ", getQq()=" + getQq() + ", getWebsite()=" + getWebsite()
                + ", getSend_address()=" + getSend_address() + ", getZipcode()=" + getZipcode() + ", getHobby()="
                + getHobby() + ", getVerify_flag()=" + getVerify_flag() + ", getVerify_code()=" + getVerify_code()
                + ", getLast_login_time()=" + getLast_login_time() + ", getLast_login_ip()=" + getLast_login_ip()
                + ", getArea()=" + getArea() + ", getHead_pic()=" + getHead_pic() + ", getClass()=" + getClass()
                + ", hashCode()=" + hashCode() + ", toString()=" + super.toString() + "]";
    }


}
