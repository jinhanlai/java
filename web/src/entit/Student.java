package entit;

public class Student {
    private String studenId;
    private String name;
    private String gender;
    private String birthday;
    private String classname;
    private String major;
    private String photo;
    private String height;

    public Student(String studenId, String name, String gender, String birthday, String classname, String major, String height, String weight,String photo) {
        this.studenId = studenId;
        this.name = name;
        this.gender = gender;
        this.birthday = birthday;
        this.classname = classname;
        this.major = major;
        this.photo = photo;
        this.height = height;
        this.weight = weight;
    }

    private String weight;

    public String getStudenId() {
        return studenId;
    }

    public String getName() {
        return name;
    }

    public String getGender() {
        return gender;
    }

    public String getClassname() {
        return classname;
    }

    public String getWeight() {
        return weight;
    }

    public String getMajor() {

        return major;
    }

    public String getPhoto() {
        return photo;
    }

    public String getHeight() {
        return height;
    }


    public String getBirthday() {
        return birthday;
    }

    public void setStudenId(String studenId) {
        this.studenId = studenId;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }

    public void setClassname(String classname) {
        this.classname = classname;
    }

    public void setMajor(String major) {
        this.major = major;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    public void setHeight(String height) {
        this.height = height;
    }

    public void setWeight(String weight) {
        this.weight = weight;
    }
}
